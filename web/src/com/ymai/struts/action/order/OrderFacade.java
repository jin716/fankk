package com.ymai.struts.action.order;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.ymai.hibernate.Area;
import com.ymai.hibernate.Block;
import com.ymai.hibernate.City;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Item;
import com.ymai.hibernate.Order;
import com.ymai.hibernate.OrderEvaluate;
import com.ymai.hibernate.OrderItems;
import com.ymai.hibernate.OrderTrace;
import com.ymai.hibernate.Store;
import com.ymai.hibernate.StoreComnt;
import com.ymai.hibernate.User;
import com.ymai.policy.OrderIncomePolicy;
import com.ymai.sms.SMSSendError;
import com.ymai.sms.SMSSender;
import com.ymai.sms.SMSSenderFactory;
import com.ymai.struts.Page;
import com.ymai.struts.action.user.UserValidate;

public class OrderFacade {
	
	
	
	
	public static Area getArea(Integer id){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		return (Area) sess.get(Area.class, id);
	}
	
	public static List<Area> getAllAreas(Integer cityId){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = sess.createSQLQuery("select * from area where city_id = :city order by area_id")
		.addEntity(Area.class).setInteger("city", cityId).list();
		return list;
	}
	
	
	
	
	
	
	
	
	public static List getBlocks(Integer areaId, String f_letter , Integer type){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		StringBuffer sql = new StringBuffer("select * from block as b where b.area_id = :area ");
		if(areaId==null){
			return null;
		}
		if(f_letter!=null){
			sql.append("and b.first_letter = :letter ");
		}
		if(type != null){
			sql.append("and b.block_type = :type ");
		}
		sql.append("order by b.block_name");
		Query query =  sess.createSQLQuery(sql.toString()).addEntity(Block.class)
		.setInteger("area", areaId);
		if(f_letter!=null){
			query = query.setString("letter", f_letter);
		}
		if(type != null){
			query = query.setInteger("type", type);
		}
		return query.list();
	}
	
	public static List getBlocksNotEmpty(Integer areaId, String f_letter , Integer type){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		StringBuffer sql = new StringBuffer("select * from block as b where b.area_id = :area ");
		if(areaId==null){
			return null;
		}
		if(f_letter!=null){
			sql.append("and b.first_letter = :letter ");
		}
		if(type != null){
			sql.append("and b.block_type = :type ");
		}
		sql.append("and b.store_num > 0 order by b.block_name");
		Query query =  sess.createSQLQuery(sql.toString()).addEntity(Block.class)
		.setInteger("area", areaId);
		if(f_letter!=null){
			query = query.setString("letter", f_letter);
		}
		if(type != null){
			query = query.setInteger("type", type);
		}
		return query.list();
	}
	
	public static List getItemTypes(Integer storeId){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		String sql = "select distinct item.item_type from item where item.store_id = "+storeId+" and item.item_state = '上架' order by item_type";
		
		List list = null;
		try {
			list = sess.createSQLQuery(sql).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static Store getStoreAndItsItems(Integer storeId){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = (Store) sess.get(Store.class, storeId);
		Hibernate.initialize(store.getItems());
		return store;
	}
	
	public static Page getStorePage(Integer blockId,Integer cur, Integer eachPage){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		String body = " from store as s ,store_block as sb where sb.store_id = s.store_id and sb.block_id = :block and s.store_set != -1 " +
				"order by s.store_set desc,s.store_id";
		String sql_1 = "select count(*)" +body;
		BigInteger total = (BigInteger) sess.createSQLQuery(sql_1)
		.setInteger("block", blockId).uniqueResult();
		Page page = new Page(cur, total.intValue() , eachPage);
		String sql_2 = "select * "+body;
		List list = sess.createSQLQuery(sql_2)
		.addEntity(Store.class).setInteger("block", blockId)
		.setFirstResult(page.getStart()).setMaxResults(page.getEachPage()).list();
		page.setList(list);
		 return page;
	}

	public static Page getOEPage(Integer storeId,Integer cur, Integer eachPage){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		String sql_1 = "select count(*) from order_evaluate as oe where oe.store_id = :store";
		BigInteger total = (BigInteger) sess.createSQLQuery(sql_1)
		.setInteger("store", storeId).uniqueResult();
		Page page = new Page(cur, total.intValue() , eachPage);
		String sql_2 = "select * from order_evaluate as oe where oe.store_id = :store order by evaluate_time desc";
		List list = sess.createSQLQuery(sql_2)
		.addEntity(OrderEvaluate.class).setInteger("store",storeId)
		.setFirstResult(page.getStart()).setMaxResults(page.getEachPage()).list();
		page.setList(list);
		 return page;
	}
	
	public static Page getSCPage(Integer storeId,Integer cur, Integer eachPage){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		String sql_1 = "select count(*) from store_comnt as sc where sc.store_id = :store";
		BigInteger total = (BigInteger) sess.createSQLQuery(sql_1)
		.setInteger("store", storeId).uniqueResult();
		Page page = new Page(cur, total.intValue() , eachPage);
		String sql_2 = "select * from store_comnt as sc where sc.store_id = :store order by store_comnt_time desc";
		List list = sess.createSQLQuery(sql_2)
		.addEntity(StoreComnt.class).setInteger("store",storeId)
		.setFirstResult(page.getStart()).setMaxResults(page.getEachPage()).list();
		page.setList(list);
		 return page;
	}
	
	public static BigInteger getReviewNum(Integer storeId, Session session){
		BigInteger en = (BigInteger) session.createSQLQuery("select count(*) from order_evaluate where store_id = :store")
		.setInteger("store", storeId).uniqueResult();
		BigInteger sc = (BigInteger) session.createSQLQuery("select count(*) from store_comnt where store_id = :store")
		.setInteger("store", storeId).uniqueResult();
		return en.add(sc);
	}
	
	public static void addComnt(ActionForm form,HttpServletRequest request) throws Exception{
		AddComntForm af = (AddComntForm) form;
		if(!UserValidate.getValidateCodeValue(request).equals(af.getVcode())){
			throw new Exception("验证码错误");
		}
		if(af.getDetail().length()>200)throw new Exception("留言不得超过200字");
		Session sess = HibernateSessionFactory.getSession();
		User user = UserValidate.getUser(request);
		String name = "游客";
		if(user != null) name = user.getUserLoginName();		
		Store store = (Store) sess.load(Store.class, af.getStore());
		StoreComnt sc = new StoreComnt();
		sc.setStoreComntDetail(af.getDetail());
		sc.setUser(user);
		sc.setUserName(name);
		sc.setStore(store);
		sc.setStoreComntTime(new Date());
		store.setStoreEv(getReviewNum(store.getStoreId(),sess).intValue());
		Transaction tran = null;
		try{
			tran = sess.beginTransaction();
			tran.begin();
			sess.save(sc);
			sess.update(store);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("添加评论失败");
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	
	public static Page getAllComntPage(Integer storeId,Integer cur, Integer eachPage){
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		
		String sql_1 = "select count(*) from store_comnt as sc where sc.store_id = :store";
		String sql_2 = "select * from store_comnt as sc where sc.store_id = :store order by store_comnt_time desc";
		String sql_3 = "select count(*) from order_evaluate as oe where oe.store_id = :store";
		String sql_4 = "select * from order_evaluate as oe where oe.store_id = :store order by evaluate_time desc";

		BigInteger total_1 = (BigInteger) sess.createSQLQuery(sql_1)
		.setInteger("store", storeId).uniqueResult();
		BigInteger total_2 = (BigInteger) sess.createSQLQuery(sql_3)
		.setInteger("store", storeId).uniqueResult();
		Page page = new Page(cur, total_1.intValue() + total_2.intValue() , eachPage);

		List list_1 = sess.createSQLQuery(sql_2)
		.addEntity(StoreComnt.class).setInteger("store",storeId)
		.setMaxResults(page.getEachPage()*page.getCur()).list();
		List list_2 = sess.createSQLQuery(sql_4)
		.addEntity(OrderEvaluate.class).setInteger("store",storeId)
		.setMaxResults(page.getEachPage()*page.getCur()).list();

		int counter = 0,j = 0,k = 0,total_length = page.getEachPage()*page.getCur();
		List list = new ArrayList();
		while(counter < total_length && 
			  j < total_length && 
			  k < total_length ){
			
			if(list_1 == null || j  == list_1.size()){
				if(list_2 != null){
					for(;k<list_2.size()&&counter<total_length;++k){
						list.add(list_2.get(k));++counter;
					}
					break;
				}
			}
			if(list_2 == null || k  == list_2.size()){
				if(list_1 != null){
					for(;j<list_1.size()&&counter<total_length;++j){
						list.add(list_1.get(j));++counter;
					}
					break;
				}
			}
			StoreComnt sc = (StoreComnt) list_1.get(j);
			OrderEvaluate oe = (OrderEvaluate) list_2.get(k);
			if(sc.getStoreComntTime().after(oe.getEvaluateTime())){
				list.add(sc);j++;counter++;
			}
			if(sc.getStoreComntTime().equals(oe.getEvaluateTime())){
				list.add(oe);list.add(sc);k++;j++;counter+=2;
			}
			else{
				list.add(oe);k++;counter++;
			}
		}
		List pageList = new LinkedList();
		for(int index = page.getEachPage()*(page.getCur()-1); index < list.size() ; ++ index){
			pageList.add(list.get(index));
		}
		page.setList(pageList);
		return page;
	}
}
