package com.ymai.struts;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;

public class FormUtil {
	
	public static String escape(String value){
		if(value!=null)
		return  value.replaceAll("\"", "&quot; ").replaceAll("\'", "''")
		.replaceAll("&", "&amp; ").replaceAll("<[^>]*>", "");//
		return null;
	}
	
	public static final String[] illegal = {"<",">","\'","\""};
	public static void checkForm(ActionForm form)throws IllegalParameter{
		Field[] fields = form.getClass().getDeclaredFields();
		Class clazz = form.getClass();
		Method method = null;
		String methodName = null;
		for(Field field : fields){
			
			try {
				methodName = field.getName().toString().substring(0, 1).toUpperCase() +field.getName().toString().substring(1) ;
				method = clazz.getDeclaredMethod("get"+methodName);
				String value = method.invoke(form).toString();
				for(String str : illegal){
					if(value.contains(str))throw new IllegalParameter();
				}
			} catch (NullPointerException e){
				
			} catch (SecurityException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	public static void setFromId(HttpServletRequest request , String name){
		request.getSession().setAttribute(name, (int)(1000000*Math.random())+"");
	}
	
	public static String getFromId(HttpServletRequest request , String name){
		return (String) request.getSession().getAttribute(name);
	}
	
	public static boolean isFromAble(HttpServletRequest request , String name , String value){
		String string = (String) request.getSession().getAttribute(name);
		if(string == null)return false;
		if(string.equals(value)) return true;
		return false;
	}
	
	
	public static void disableFrom(HttpServletRequest request, String name){
		request.getSession().removeAttribute(name);
	}
	


}
