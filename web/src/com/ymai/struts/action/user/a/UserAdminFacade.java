package com.ymai.struts.action.user.a;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.MathContext;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.ymai.hibernate.Block;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Item;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderEvaluate;
import com.ymai.hibernate.Position;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.StoreBlock;
import com.ymai.hibernate.StoreBlockId;
import com.ymai.hibernate.User;
import com.ymai.struts.Page;
import com.ymai.struts.action.MapFacade;
import com.ymai.struts.action.order.OrderFacade;
import com.ymai.struts.action.user.UserValidate;
import com.ymai.struts.action.user.s.FileUpHelper;
import com.ymai.struts.action.user.u.EvaluateForm;

public class UserAdminFacade {
	
	final public static int EACH_ORDER_PAGE = 20 ;
	
	public static Page getOrder(HttpServletRequest request,String start , String end , int pageNum){
		return getOrder(request,start , end , pageNum , EACH_ORDER_PAGE);
	}
	
	public static List selectLikeStore(String storeName){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = session.createSQLQuery("select * from store where store_name like :store")
		.addEntity(Store.class).setString("store", "%"+storeName+"%").list();
		return  list;
	}
	
	public static void changeDistance(Double distance , Integer storeId) throws Exception{
		Session session = HibernateSessionFactory.getSession();
		String sql_1 = "delete from store_block where store_id = "+storeId;
		Transaction tran = null;
		try{
			Store store = (Store) session.get(Store.class, storeId);	
			List blocks = session.createSQLQuery("select * from block where block.area_id in " +
			"(select area_id from area where area.city_id = :city)").addEntity(Block.class)
			.setInteger("city", store.getBlock().getArea().getCity().getCityId()).list();
			
			List sbs = session.createSQLQuery("select * from store_block where store_id = :store")
			.addEntity(StoreBlock.class).setInteger("store", storeId).list();
			
			tran = session.beginTransaction();
			for(int i = 0 ; i < sbs.size();++i){
				StoreBlock sb = (StoreBlock) sbs.get(i);
				Block block = sb.getId().getBlock();
				block.setStoreNum(block.getStoreNum()-1);
				session.update(block);
				session.delete(sb);
			}
			for(int i = 0 ; i < blocks.size();++i){
				Block ablock = (Block)blocks.get(i);
				StoreBlock sb = new StoreBlock();
				StoreBlockId id = new StoreBlockId();
				Double d =  store.getPosition().getDistance(ablock);
				if(d<=distance){
					ablock.setStoreNum(ablock.getStoreNum()+1);
					id.setBlock(ablock);
					id.setStore(store);
					sb.setId(id);
					sb.setDistance(d.floatValue());
					session.save(sb);
					session.update(ablock);
				}
			}
			store.setStoreSendDistance(distance);
			session.update(store);
			tran.commit();
		}catch(Exception e){
				e.printStackTrace();
				tran.rollback();
				throw e;
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
	public static void saveStore(Store store, Integer ownerId , Integer blockId, Integer cityId) throws Exception{
		Session sess =HibernateSessionFactory.getSession();
		Block block = (Block) sess.load(Block.class,blockId);
		User owner = (User) sess.load(User.class, ownerId);
		List blocks = sess.createSQLQuery("select * from block where block.area_id in " +
				"(select area_id from area where area.city_id = :city)").addEntity(Block.class)
				.setInteger("city", cityId).list();
		store.setBlock(block);
		store.setUser(owner);
		Transaction tran = null;
		Byte send = 1;
		Byte noSend = 0;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			sess.save(store);
			for(int i = 0 ; i < blocks.size();++i){
				Block ablock = (Block)blocks.get(i);
				StoreBlock sb = new StoreBlock();
				StoreBlockId id = new StoreBlockId();
				id.setBlock(ablock);
				id.setStore(store);
				sb.setId(id);
				Position sp = new Position(store);
				Float dis = Double.valueOf(sp.getDistance(ablock)).floatValue();
				sb.setDistance(dis);
					sb.setId(id);
				if(dis <= store.getStoreSendDistance()){
					sess.save(sb);
					BigInteger counter = (BigInteger) sess.createSQLQuery("select count(*) from store_block where store_block.block_id = :block")
					.setInteger("block", ablock.getBlockId()).uniqueResult();
					ablock.setStoreNum(counter.intValue()+1);
					sess.update(ablock);
				}
			}
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			throw e;
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	public static Page getOrder(HttpServletRequest request, String start , String end , int pageNum , int eachPage){
		User user = UserValidate.getUser(request);
		if(user == null)return null;
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		if(start == null && end == null){
			BigInteger size = (BigInteger) session.createSQLQuery("select count(*) from order_tb where user_id = :user")
			.setInteger("user", user.getUserId()).uniqueResult();
			Page page = new Page(pageNum,size.intValue(),eachPage);
			List list = session.createSQLQuery("select * from order_tb where user_id = :user " +
					"order by order_time desc limit :off,:eachPage")
			.addEntity(Order.class).setInteger("user", user.getUserId()).setInteger("off", page.getStart())
			.setInteger("eachPage", page.getEachPage()).list();
			page.setList(list);
			return page;
		}
		if(start == null || end == null)
			return null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date start_d = null;
		Date end_d = null;
		try {
			start_d = sdf.parse(start);
			end_d =  sdf.parse(end);
			end_d.setDate(end_d.getDate()+1);
		} catch (ParseException e) {
			return null;
		}
		int size  = session.createCriteria(Order.class).
		add(Restrictions.eq("user", user)).
		add(Restrictions.between("orderTime", start_d, end_d)).list().size();
		Page page = new Page(pageNum,size,eachPage);
		List list = session.createCriteria(Order.class).
		addOrder(org.hibernate.criterion.Order.desc("orderTime")).
		add(Restrictions.eq("user", user)).
		add(Restrictions.between("orderTime", start_d, end_d)).
		setFirstResult(page.getStart()).setMaxResults(page.getEachPage())
		.list();
		page.setList(list);
		return page;
	}

	static public Page  getOrderListMonth(HttpServletRequest request, int month , int c_page, int eachPage){
		User user = UserValidate.getUser(request);
		if(user == null)return null;
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		String size = "select count(*) ";
		String object = "select * ";
		String sql = "from order_tb as o where o.order_time " +
			"between (CURDATE() - INTERVAL "+month+" MONTH) and CURDATE()+1 and o.user_id = :user";
		BigInteger total = (BigInteger) sess.createSQLQuery(size+sql).setInteger("user", user.getUserId()).uniqueResult();
		Page page = new Page(c_page, total.intValue(),eachPage);
		List list = sess.createSQLQuery(object+sql).addEntity(Order.class).setInteger("user", user.getUserId())
						.setMaxResults(page.getEachPage()).setFirstResult(page.getStart()).list();
		page.setList(list);
		return page;
	}
	
	static public OrderEvaluate getOE(Integer orderId){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		OrderEvaluate oe = (OrderEvaluate) session.get(OrderEvaluate.class, orderId);
		return oe;
	}
	
	static public void saveMenu(Integer storeId, FormFile excel)throws Exception{
		Session session = HibernateSessionFactory.getSession();
		Menu menu = Menu.getMenuFromXls(excel.getInputStream());
		MenuItem[] mis = menu.getMenuItems();
		Item item = null;
		Item item2 = null;
		Store store = (Store) session.load(Store.class, storeId);
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			for(MenuItem mi : mis){
				item = new Item();
				Iterator iter = store.getItems().iterator();
				while(iter.hasNext()){
					item2 = (Item) iter.next();
					if(item2.getItemName().equals(mi.getName())){
						item = item2;
						break;
					}
				}
				item.setStore(store);
				item.setItemName(mi.getName());
				item.setItemPrice(mi.getPrice());
				item.setItemType(mi.getSort());
				item.setItemDsct(1.0);
				item.setItemState("上架");
				session.saveOrUpdate(item);
			}
			tran.commit();
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			throw e;
		}
		finally{
			if(session.isOpen())session.close();
		}
	}
	
	
	static public void saveImage(Integer storeId, FormFile excel, HttpServletRequest request)throws Exception{
		try{
			String url = FileUpHelper.saveStoreImage(storeId, excel, request);
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	static private Float averageStars(Integer storeId , Session session){
		Float stars = (Float) session.createQuery("select avg(orderStars) from OrderEvaluate where store.storeId = "+storeId)
		.uniqueResult();
		return stars;
	}
	static private Float averageTaste(Integer storeId , Session session){
		Float stars =  (Float) session.createQuery("select avg(orderTaste) from OrderEvaluate where store.storeId = "+storeId)
		.uniqueResult();
		return stars;
	}
	static private Float averageSpeed(Integer storeId , Session session){
		Float stars =  (Float) session.createQuery("select avg(orderSpeed) from OrderEvaluate where store.storeId = "+storeId)
		.uniqueResult();
		return stars;
	}
	static private Float averageHealth(Integer storeId , Session session){
		Float stars =  (Float) session.createQuery("select avg(orderHealth) from OrderEvaluate where store.storeId = "+storeId)
		.uniqueResult();
		return stars;
	}
	
	
	static public OrderEvaluate saveOE(EvaluateForm eform,HttpServletRequest request) throws Exception{
		OrderEvaluate oe = new OrderEvaluate();
		oe.setEvaluateTime(new Date());
		oe.setFavorite(eform.getFavorite());
		oe.setOrderDetail(eform.getText());
		oe.setOrderHealth(eform.getHealth()/10);
		oe.setOrderSpeed(eform.getSpeed()/10);
		oe.setOrderStars(eform.getStars()/10);
		oe.setOrderTaste(eform.getTaste()/10);
		Session session = HibernateSessionFactory.getSession();
		Order order = (Order) session.load(Order.class, eform.getOrderId());
		User c_user = UserValidate.getUser(request);
		Store store = order.getStore();
		if(c_user==null){
			throw new Exception("权限不足！");
		}
		c_user = (User) session.load(User.class,c_user.getUserId());
		if(order.getUser().getUserId()!=c_user.getUserId())
			throw new Exception("权限不足！");
		oe.setUser(c_user);
		oe.setStore(store);
		oe.setOrder(order);
		oe.setOrderId(order.getOrderId());
		store.setStoreStars(averageStars(store.getStoreId(),session).doubleValue());
		store.setStoreSpeed(averageSpeed(store.getStoreId(),session).doubleValue());
		store.setStoreHealth(averageHealth(store.getStoreId(),session).doubleValue());
		store.setStoreTaste(averageTaste(store.getStoreId(),session).doubleValue());
		store.setStoreEv(OrderFacade.getReviewNum(store.getStoreId(),session).intValue());
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.save(oe);
			session.update(store);
			tran.commit();
			return oe;
		}catch(Exception e){
			e.printStackTrace();
			tran.rollback();
			throw e;
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
}
