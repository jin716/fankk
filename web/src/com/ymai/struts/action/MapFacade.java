package com.ymai.struts.action;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Hibernate;
import org.hibernate.Session;

import com.ymai.hibernate.City;
import com.ymai.hibernate.CityIp;
import com.ymai.hibernate.HibernateSessionFactory;

public class MapFacade {
	
	static final public String current_city = "c_city";
	
	static public String getIpAddr(HttpServletRequest request) {      
	       String ip = request.getHeader("x-forwarded-for");      
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	           ip = request.getHeader("Proxy-Client-IP");      
	       }      
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	           ip = request.getHeader("WL-Proxy-Client-IP");      
	       }      
	       if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {      
	           ip = request.getRemoteAddr();      
	       }      
	       return ip;      
	   }   
	
	static public City getCurrentCity(HttpServletRequest request){
		City c_city = (City) request.getSession().getAttribute(current_city);
		return c_city;
	}
	/**
	static public City currentCity(HttpServletRequest request){
		City c_city = (City) request.getSession().getAttribute(current_city);
		if(c_city != null)
			return c_city;
		Session sess = HibernateSessionFactory.getSession();
		try{
			String ip = getIpAddr(request);
			String[] ips = ip.split("\\.");
			Double ipString =  Double.valueOf(ips[0])*Math.pow(256, 3)+
			Double.valueOf(ips[1])*Math.pow(256, 2)+
			Double.valueOf(ips[2])*256+
			Double.valueOf(ips[3]);
			City city =  (City) sess.createSQLQuery("select city_id from city where city_name = (select city from city_ip where city_ip.start <= :ip order by start desc limit 1)").addEntity(City.class)
			.setDouble("ip", ipString).uniqueResult();
			Hibernate.initialize(city.getAreas());
			request.getSession().setAttribute(current_city,city);
			if(city==null){
				city =  (City) sess.createSQLQuery("select * from city where city.city_id = 1").addEntity(City.class).uniqueResult();
				request.getSession().setAttribute(current_city,city);
				return city;
			}
			else return city;
		}catch(Exception e){
			City city =  (City) sess.createSQLQuery("select * from city where city.city_id = 1").addEntity(City.class).uniqueResult();
			request.getSession().setAttribute(current_city,city);
			return city;
		}finally{
			if(sess.isOpen())sess.close();
		}
	}
	*/
	
	static public City currentCity(HttpServletRequest request){
		City c_city = (City) request.getSession().getAttribute(current_city);
		if(c_city != null)
			return c_city;
		Session sess = HibernateSessionFactory.getSessionFactory().getCurrentSession();
		c_city =  (City) sess.createSQLQuery("select * from city where city.city_id = 1").addEntity(City.class).uniqueResult();
		Hibernate.initialize(c_city.getAreas());
		request.getSession().setAttribute(current_city,c_city);
		return c_city;
	}
}
