package com.ymai.struts.action.user.a;

import java.util.LinkedList;
import java.util.List;

import net.sourceforge.pinyin4j.PinyinHelper;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ymai.hibernate.Area;
import com.ymai.hibernate.Block;
import com.ymai.hibernate.City;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Position;

public class AdminFacade {
	
	static public List getAllCity(){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = session.createCriteria(City.class).list();
		return list;
	}
	
	static public List getAreas(Integer cityId){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = session.createSQLQuery("select * from area where area.city_id = :city").addEntity(Area.class)
		.setInteger("city", cityId).list();
		return list;
	}
	
	/**
	 * 找出全数据库与 position 距离小于 distance 的所有 block
	 * @param position 位置
	 * @param distance 距离
	 * @return 
	 */
	static public List getBlocksNear(Position position , double distance){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List list = session.createCriteria(Block.class).list();
		List<Block> blockList = new LinkedList<Block>();
		for(int i = 0 ;i < list.size(); ++i){
			Block b = (Block) list.get(i);
			Double dis = position.getDistance(b);
			if(dis < distance){
				blockList.add(b);
			}
		}
		return blockList;
	}

	/**
	 * 找出全数据库在Area的小区
	 * @param areaId 
	 * @return 
	 */
	static public List getBlocksInArea(Integer areaId){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List<Block> list = session.createSQLQuery("select * from block where block.area_id = :area")
			.addEntity(Block.class).setInteger("area", areaId).list();
		return list;
	}
	
	static public List getBlocksInArea(Integer areaId,String fl){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		List<Block> list = session.createSQLQuery("select * from block where block.area_id = :area and block.first_letter = :letter")
			.addEntity(Block.class).setString("letter", fl).setInteger("area", areaId).list();
		return list;
	}
	
	
	static public Block getBlock(Integer blockId){
		Session session = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Block block = (Block) session.get(Block.class, blockId);
		return block;
	}

	static public void update(BlockEditForm bform,Integer blockId) throws Exception{
		
		
		Session session = HibernateSessionFactory.getSession();
		Block block = (Block) session.load(Block.class , blockId);
		Position posi = new Position();
		posi.setNTULatitude(bform.getLatitude());
		posi.setNTULongitude(bform.getLongitude());
		block.setBlockAddrY(posi.getLatitude());
		block.setBlockAddrX(posi.getLongitude());
		block.setBlockName(bform.getBlockName());
		//block.setIsBuilding(bform.getIsBuilding());
		char ch = block.getBlockName().charAt(0);
		String letter = PinyinHelper.toHanyuPinyinStringArray(ch)[0].substring(0, 1);
		block.setFirstLetter(letter);
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.update(block);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("添加失败");
		}finally{
			if(session.isOpen())session.close();
		}
	}
	
	static public void insert(BlockEditForm bform) throws Exception{
		Block block = new Block();
		Position posi = new Position();
		posi.setNTULatitude(bform.getLatitude());
		posi.setNTULongitude(bform.getLongitude());
		block.setBlockAddrY(posi.getLatitude());
		block.setBlockAddrX(posi.getLongitude());
		block.setBlockName(bform.getBlockName());
		//block.setIsBuilding(bform.getIsBuilding());
		char ch = block.getBlockName().charAt(0);
		String letter = PinyinHelper.toHanyuPinyinStringArray(ch)[0].substring(0, 1);
		block.setFirstLetter(letter);
		
		Session session = HibernateSessionFactory.getSession();
		Area area = (Area) session.load(Area.class,bform.getArea());
		block.setArea(area);
		Transaction tran = null;
		try{
			tran = session.beginTransaction();
			tran.begin();
			session.save(block);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			e.printStackTrace();
			throw new Exception("添加失败");
		}finally{
			if(session.isOpen())session.close();
		}
	}
}
