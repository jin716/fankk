package com.ymai.struts.action.user.s;

import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Restrictions;

import com.ymai.hibernate.Area;
import com.ymai.hibernate.Block;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Item;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.User;
import com.ymai.struts.Page;
import com.ymai.struts.action.user.UserValidate;

public class StoreFacade {
	
	public static Store getStore(Integer id){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return (Store) session.get(Store.class, id);
	}
	
	public static Store getUsersStore(Integer id , User user){
		Store store = new Store();
		store.setUser(user);
		store.setStoreId(id);
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store a_store = (Store) session.createSQLQuery("select * from store where store_id = :store and user_id = :user")
		.addEntity(Store.class).setInteger("store", id).setInteger("user", user.getUserId()).uniqueResult();
		return a_store;
	}
	
	
	public static Item getItem(Integer id){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return (Item) session.get(Item.class, id);
	}
	
	public static Item getItem(Integer itemId, Integer userId){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Item item = (Item) session.get(Item.class, itemId);
		if(item.getStore().getUser().getUserId().equals(userId))
			return item;
		return null;
	}


	public static Page getItemPage(Integer storeId , Integer currentPage , String type , Integer eachPage){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		BigInteger list_total_size = (BigInteger) session.
			createSQLQuery("select count(*) from item where item.store_id = :store")
			.setInteger("store", storeId).uniqueResult();
		if(currentPage == null)currentPage=1;
		String sql = null;
		List list = null;
		if(type!=null){
			sql = "select * from item where item.item_state = :type and item.store_id = :store limit :current, :eachPage";
			list = session.createSQLQuery(sql).addEntity(Item.class)
			.setString("type", type)
			.setInteger("store", storeId)
			.setInteger("current", currentPage-1)
			.setInteger("eachPage", eachPage)
			.list();
		}
		else {
			sql = "select * from item where item.store_id = :store limit :current, :eachPage";
			list = session.createSQLQuery(sql).addEntity(Item.class)
			.setInteger("store", storeId)
			.setInteger("current", currentPage-1)
			.setInteger("eachPage", eachPage)
			.list();
		}
		Page page = new Page(currentPage, list_total_size.intValue(),eachPage);
		page.setList(list);
		return page;
	}
	
	public static Integer getUserId(Integer storeId){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Integer userId = (Integer) session.createSQLQuery("select user_id from store where store.store_id = "+storeId).uniqueResult();
		return userId;
	}
	
	static public List getStoreList(Integer userId){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = session.
			createSQLQuery("select * from store " +
					"where store.user_id = "+userId).addEntity(Store.class).list();
		return list;
	}
	

	
	public static List getBlockListNear(Integer storeId ,Float distance){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = (Store) session.load(Store.class, storeId);
		List list = session.createSQLQuery("select b.* from block as b ,store_block as sb where " +
				"sb.store_id = :store and sb.distance < :distance and b.block_id = sb.block_id")
				.addEntity(Block.class).setInteger("store", storeId).setFloat("distance", distance).list();
		return list;
	}
	
	
	public static List getBlockListNear(Integer storeId ,Double distance , Boolean send){
		Session session  =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = (Store) session.load(Store.class, storeId);
		List list = session.createSQLQuery("select b.* from block as b ,store_block as sb where " +
				"sb.store_id = :store and sb.distance < :distance and b.block_id = sb.block_id and sb.is_send = :send")
				.addEntity(Block.class).setInteger("store", storeId).setDouble("distance", distance).setBoolean("send", send).list();
		return list;
	}
	
	public static void addTestBlock(Integer num, Integer max_map_size){
		Session sess = HibernateSessionFactory.getSession();
		
		Area area = (Area) sess.load(Area.class, 2);
		Transaction tran = sess.beginTransaction();
		tran.begin();
		for(int i = 0 ; i < num ; ++i){
			Block block = new Block();
			block.setArea(area);
			block.setFirstLetter("A");
			Double x = (max_map_size * Math.random());
			Double y =  (max_map_size * Math.random());
			block.setBlockName("test_block_"+x+"_"+y);
			block.setBlockAddrX(x);
			block.setBlockAddrY(y);
			sess.save(block);
		}
		tran.commit();
		sess.close();
	}
	
	public static void save(Item item) throws Exception{
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			 tran = session.beginTransaction();
			 tran.begin();
			 session.save(item);
			 tran.commit();
			 
		}catch(Exception e){
			tran.rollback();
			throw new Exception("插入失败");
		}finally{
			session.close();
		}
		
		
	}
	
	public static void update(Item item) throws Exception{
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try{
			 tran = session.beginTransaction();
			 tran.begin();
			 session.update(item);
			 tran.commit();
			 
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("更新失败");
		}finally{
			session.close();
		}
		
		
	}

	public static void saveDistance(ActionForm form,HttpServletRequest request) throws Exception{
		BlockEditSubmitForm f = (BlockEditSubmitForm) form;
		Store store = UserValidate.getStore(request);
		if(store==null)throw new Exception("添加失败");
		Session sess = HibernateSessionFactory.getSession();
		store = (Store) sess.load(Store.class, store.getStoreId());
		Area area = (Area) sess.load(Area.class, 2);
		Transaction tran = null;
			try{
				tran = sess.beginTransaction();
				tran.begin();
				String sql_1 = "update store_block set is_send = 1 where store_id = "+store.getStoreId()+" and distance <="+f.getDistance();
				String sql_2 = "update store_block set is_send = 0 where store_id = "+store.getStoreId()+" and distance > "+f.getDistance();
				store.setStoreSendDistance(f.getDistance());
				sess.update(store);
				//sess.createSQLQuery(sql_1).list();
				//sess.createSQLQuery(sql_2).list();
				tran.commit();
			}catch(Exception e){
				e.printStackTrace();
				tran.rollback();
				throw e;
			}
			finally{
				sess.close();
			}
	}
	
	public static Page getOrder(HttpServletRequest request, String start , String end , int pageNum , int eachPage){
		Store store = UserValidate.getStore(request);
		if(store == null)return null;
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
			e.printStackTrace();
			return null;
		}
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		int size  = session.createCriteria(Order.class).
		add(Restrictions.eq("store", store)).
		add(Restrictions.between("orderTime", start_d, end_d)).list().size();
		Page page = new Page(pageNum,size,eachPage);
		List list = session.createCriteria(Order.class).
		addOrder(org.hibernate.criterion.Order.asc("orderTime")).
		add(Restrictions.eq("store", store)).
		add(Restrictions.between("orderTime", start_d, end_d)).
		setFirstResult(page.getStart()).setMaxResults(page.getEachPage())
		.list();
		page.setList(list);
		return page;
	}

}
