package com.ymai.struts;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ymai.hibernate.Block;
import com.ymai.tools.MD5;


public class CookieUtil {
	
	//3个月
	public final static int cookie_max_age = 180*24*3600;
	
	public final static String PASSWORD = "u_pass";
	public final static String USER_NAME = "u_name";
	public final static String BLOCK_1 = "u_block_1";
	public final static String BLOCK_2 = "u_block_2";
	public final static String BLOCK_3 = "u_block_3";
	public final static String USEED_ADDRESS = "uesed_address";
	public final static String PHONE_CODE_PREFFIX = "pCode_";

	private final static String KEY = "fankkMaoxingLijing";
	
	static private String getPhoneMD5Key(BigInteger tele){
		if(tele==null)return null;
		String local_key = MD5.encode(KEY, 5);
		String phoneKey = MD5.encode(MD5.encode(tele.toString())+local_key);
		return phoneKey;
	}
	
	static public void setPhoneCodeinCookie(BigInteger tele , HttpServletRequest request,HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
		int max = 0 ;
		for(Cookie cook :cookies){
			if(cook.getName().startsWith("pCode_")){
				int num = Integer.valueOf(cook.getName().substring(PHONE_CODE_PREFFIX.length()));
				if(max < num) max = num;
			}
		}
		String name = PHONE_CODE_PREFFIX + max;
		String key = getPhoneMD5Key(tele);
		Cookie cookie = new Cookie(name,key);
		cookie.setMaxAge(cookie_max_age);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	static public boolean hasValidatePhone(BigInteger tele , HttpServletRequest request,HttpServletResponse response){
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			String key = getPhoneMD5Key(tele);
			for(Cookie cook :cookies){
				if(cook.getName().startsWith("pCode_")){
					if(cook.getValue().equals(key))return true;
				}
			}
			return false;
		}
		return false;
	}
	
	

	static public void addAddressInCookies(String address , HttpServletRequest request,HttpServletResponse response){
		try {
			String value = URLEncoder.encode(address, "utf-8");
			Cookie address_cookie = new Cookie(USEED_ADDRESS,value);
			address_cookie.setMaxAge(cookie_max_age);
			address_cookie.setPath("/");
			response.addCookie(address_cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	static public String getAddressInCookies(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals(USEED_ADDRESS)){
				try {
					return URLDecoder.decode(cookie.getValue(),"utf-8");
				} catch (UnsupportedEncodingException e) {
					return null;
				}}
			}
		}
		return null;
	}

	static public void removeUserInCookies(HttpServletRequest request,HttpServletResponse response){
		Cookie[]   cookies=request.getCookies();      
		//cookies不为空，则清除      
		if(cookies!=null)      
		{   
			for(Cookie cookie : cookies){
				String   name = cookie.getName();
			    if(name.equals(PASSWORD)||name.equals(USER_NAME))      
			    {      
			    	 cookie.setPath("/");
			    	 cookie.setValue(null);
			    	 cookie.setMaxAge(0);    
			         response.addCookie(cookie);    
			    }  
			}
		} 
	}
	
	static public void setUserInCookies(String name, String pass ,HttpServletResponse response){
		try {
			String _name = URLEncoder.encode(name, "utf-8");
			String _pass = URLEncoder.encode(pass, "utf-8");
			Cookie n_cookie = new Cookie(USER_NAME,_name);
			Cookie p_cookie = new Cookie(PASSWORD,_pass);
			n_cookie.setMaxAge(cookie_max_age);
			p_cookie.setMaxAge(cookie_max_age);
			n_cookie.setPath("/");
			p_cookie.setPath("/");
			response.addCookie(n_cookie);
			response.addCookie(p_cookie);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	static public String getPasswordInCookies(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals(PASSWORD)){
				try {
					return URLDecoder.decode(cookie.getValue(),"utf-8");
				} catch (UnsupportedEncodingException e) {
					return null;
				}}
			}
		}
		return null;
	}
	
	
	
	static public String getUserInCookies(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if(cookie.getName().equals(USER_NAME)){try {
					return URLDecoder.decode(cookie.getValue(),"utf-8");
				} catch (UnsupportedEncodingException e) {
					return null;
				}}
			}
		}
		return null;
	}
	
	static public Block[] getBlocksInCookies(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();	
		Block[] bs = new Block[3];
		if(cookies!=null){
			for(Cookie cook : cookies){
				if(cook.getName().equals("u_block_1")){bs[0] = toBlock(cook);continue;}
				if(cook.getName().equals("u_block_2")){bs[1] = toBlock(cook);continue;}
				if(cook.getName().equals("u_block_3")){bs[2] = toBlock(cook);continue;}
			}
		}
		return bs;
	}
	
	static public void setBlockInCookies(Block block , HttpServletRequest request, 
			HttpServletResponse response){
		Cookie[] cookies = request.getCookies();	
		Cookie u_cookie_1 = null;
		Cookie u_cookie_2 = null;
		Cookie u_cookie_3 = null;
		if(cookies!=null){
			for(Cookie cook : cookies){
				if(cook.getName().equals("u_block_1")){u_cookie_1 = cook;continue;}
				if(cook.getName().equals("u_block_2")){u_cookie_2 = cook;continue;}
				if(cook.getName().equals("u_block_3")){u_cookie_3 = cook;continue;}
			}
		}
		Block u_block_1 = toBlock(u_cookie_1);
		Block u_block_2 = toBlock(u_cookie_2);
		Block u_block_3 = toBlock(u_cookie_3);
		if(u_block_1 != null){
			try{
				if(u_block_1.getBlockId().equals(block.getBlockId())){
					return ;
				}
				if(u_block_2 != null && u_block_2.getBlockId().equals(block.getBlockId())){
					if(block!=null) 	u_cookie_1 = toCookie("u_block_1", block);
					if(u_block_1!=null) u_cookie_2 = toCookie("u_block_2",u_block_1);
					response.addCookie(u_cookie_1);
					response.addCookie(u_cookie_2);
					return ;
				}
				if(u_block_3 != null && u_block_3.getBlockId().equals(block.getBlockId())){
					if(block!=null)		u_cookie_1 = toCookie("u_block_1", block);
					if(u_block_1!=null)	u_cookie_2 = toCookie("u_block_2",u_block_1);
					if(u_block_2!=null)	u_cookie_3 = toCookie("u_block_3",u_block_2);
					response.addCookie(u_cookie_1);
					response.addCookie(u_cookie_2);
					response.addCookie(u_cookie_3);
					return ;
				}
				else{
					if(u_block_2!=null)u_cookie_3 = toCookie("u_block_3",u_block_2);
					if(u_block_1!=null)u_cookie_2 = toCookie("u_block_2",u_block_1);
					u_cookie_1 = toCookie("u_block_1", block);
					response.addCookie(u_cookie_1);
					response.addCookie(u_cookie_2);
					response.addCookie(u_cookie_3);
					return;
				}
			}catch(Exception e){
				u_cookie_1 = toCookie("u_block_1", block);
				response.addCookie(u_cookie_1);
				return;
			}
		}
		else{
			u_cookie_1 = toCookie("u_block_1", block);
			response.addCookie(u_cookie_1);
			return;
		}
	}
	
	/**样式 小区ID|小区名称 如 1|华景新城 */
	static private Block toBlock(Cookie cookie){
		Block block = null;
		try{
			block = new Block();
			String value = cookie.getValue();
			String[] values = value.split("_");
			Integer id = Integer.valueOf(values[0]);
			String name = URLDecoder.decode(values[1],"utf-8");
			block.setBlockName(name);
			block.setBlockId(id);
			return block;
		}catch(Exception e){
			return null;
		}
		
	}
	
	/**样式 小区ID|小区名称 如 1|华景新城 */
	static private Cookie toCookie(String name, Block block){
		try{
			String value = block.getBlockId() + "_" + URLEncoder.encode(block.getBlockName(),"utf-8");
			Cookie cookie = new Cookie(name , value);
			cookie.setPath("/");
			cookie.setMaxAge(cookie_max_age);
			return cookie;
		}catch(Exception e){
			return null;
		}
	}
	
	
}
