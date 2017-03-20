package com.ymai.struts.action.user.s;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.upload.FormFile;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.ymai.hibernate.HibernateSessionFactory;
import com.ymai.hibernate.Item;
import com.ymai.hibernate.Store;

public class FileUpHelper {

	public static final String BASE_FOLDER = "/images/store/";
	public static final String[] ALLOWED_FILE = { "jpeg", "jpg", "bmp", "png",
			"gif" };
	public static final String[] DENIED_FILE = { "exe", "bat", "jsp", "htm",
			"html" };
	public static final int MAX_FILE_SIZE = 2000000;

	
	public static String saveItemImage(Integer storeId, Integer itemId,
			FormFile file, HttpServletRequest request) throws Exception {
		String save_to = BASE_FOLDER + storeId + "/";
		String real_local_path = request.getSession().getServletContext()
				.getRealPath(save_to);
		
		File file_fold = new File(real_local_path);
		if (!file_fold.isDirectory())
			file_fold.mkdir();

		String file_name = file.getFileName();
		String suffix = file_name.substring(file_name.lastIndexOf('.')+1)
				.toLowerCase();

		// 设定上传限制
		if (file.getFileSize()>MAX_FILE_SIZE)
			throw new Exception("不得上传大于2M的文件.");
		
		for (int i = 0; i < ALLOWED_FILE.length; ++i) {
			if (suffix.equals(ALLOWED_FILE[i].toLowerCase()))
				break;
			if (i + 1 == ALLOWED_FILE.length)
				throw new Exception("不得上传非图形文件.");
		}
		
		
		Date today = new Date();
		SimpleDateFormat sbf =new SimpleDateFormat("yyyy_MM_dd_kk_mm_ss");
		String flag = sbf.format(today);
		
		String last_filename = flag+"_"+itemId+"."+suffix;
		String url = save_to +last_filename;
		File current_image = new File(real_local_path+"/"+last_filename);
		//写入
		try {
			InputStream stream = file.getInputStream();// 把文件读入
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			OutputStream bos = new FileOutputStream(current_image);
			// 建立一个上传文件的输出流，将上传文件存入web应用的根目录。
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
				bos.write(buffer, 0, bytesRead);// 将文件写入服务器
			}
			bos.close();
			stream.close();
		} catch (Exception e) {
			current_image.delete();
			throw new Exception("写入失败.");
		}
		
		//删除旧有数据
		Session session =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Item item = (Item) session.get(Item.class, itemId);
		String src = item.getItemImgSrc();
		if(src != null){
			try{
				File old_file = new File(request.getSession().getServletContext()
				.getRealPath(src));
				old_file.delete();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//存入数据库
		try{
			item.setItemImgSrc(url);
			session.save(item);
		}catch(Exception e){
			current_image.delete();
			throw new Exception("写入失败.");
		}
		return url;
	}
	
	
	public static String saveStoreImage(Integer storeId,
			FormFile file, HttpServletRequest request) throws Exception {
		String save_to = BASE_FOLDER + storeId + "/";
		String real_local_path = request.getSession().getServletContext()
				.getRealPath(save_to);
		
		File file_fold = new File(real_local_path);
		if (!file_fold.isDirectory())
			file_fold.mkdir();

		String file_name = file.getFileName();
		String suffix = file_name.substring(file_name.lastIndexOf('.')+1)
				.toLowerCase();

		// 设定上传限制
		if (file.getFileSize()>MAX_FILE_SIZE)
			throw new Exception("不得上传大于2M的文件.");
		
		for (int i = 0; i < ALLOWED_FILE.length; ++i) {
			if (suffix.equals(ALLOWED_FILE[i].toLowerCase()))
				break;
			if (i + 1 == ALLOWED_FILE.length)
				throw new Exception("不得上传非图形文件.");
		}
		
		
		Date today = new Date();
		SimpleDateFormat sbf =new SimpleDateFormat("yyyy_MM_dd_kk_mm_ss");
		String flag = sbf.format(today);
		
		String last_filename = flag+"_store."+suffix;
		String url = save_to +last_filename;
		File current_image = new File(real_local_path+"/"+last_filename);
		//写入
		try {
			InputStream stream = file.getInputStream();// 把文件读入
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			
			OutputStream bos = new FileOutputStream(current_image);
			// 建立一个上传文件的输出流，将上传文件存入web应用的根目录。
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
				bos.write(buffer, 0, bytesRead);// 将文件写入服务器
			}
			bos.close();
			stream.close();
		} catch (Exception e) {
			current_image.delete();
			throw new Exception("写入失败.");
		}
		
		//删除旧有数据
		Session session =  HibernateSessionFactory.getSessionFactory().getCurrentSession();
		Store store = (Store) session.get(Store.class, storeId);
		String src = store.getStoreImgSrc();
		if(src != null){
			try{
				File old_file = new File(request.getSession().getServletContext()
				.getRealPath(src));
				old_file.delete();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//存入数据库
		try{
			store.setStoreImgSrc(url);
			session.save(store);
		}catch(Exception e){
			current_image.delete();
			throw new Exception("写入失败.");
		}
		return url;
	}


}
