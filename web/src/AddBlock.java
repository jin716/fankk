import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.ymai.hibernate.Area;
import com.ymai.hibernate.Block;
import com.ymai.hibernate.HibernateSessionFactory;

public class AddBlock {

	/**
	 * File file = new File(filename[0]); FileInputStream in = new
	 * FileInputStream(file);
	 * 
	 * //String line = reader.readLine(); //StringBuffer json = new
	 * StringBuffer(); byte[] b = new byte[2048]; int length = in.read(b); int
	 * total = 0 ; ArrayList list = new ArrayList(); while(length != -1){
	 * total+= length; list.add(b); length = in.read(b); } byte[] byt = new
	 * byte[total]; int index = 0; for(int i = 0 ; i < list.size() ; ++i){
	 * byte[] bb = (byte[]) list.get(i); for(int j = 0 ; j < bb.length && index <
	 * total; ++j){ byt[index++] = bb[j]; } }
	 * 
	 * @param args
	 * @throws IOException
	 * @throws IOException
	 * @throws JSONException
	 */
	private static String toJson(File file) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(file), "utf-8"));
		String line = br.readLine();
		StringBuffer json = new StringBuffer("[");
		while (line != null) {
			json.append(line);
			line = br.readLine();
		}
		json.append("]");
		return json.toString();
	}
	
	private static void addFromFile() throws IOException, JSONException{
		String[] filename = { "src/by_bus.txt", "src/by_road.txt",
				"src/hz_bus.txt", "src/hz_road.txt", "src/lw_bus.txt",
				"src/lw_road.txt", "src/py_bus.txt", "src/py_road.txt",
				"src/th_bus.txt", "src/th_road.txt", "src/yx_bus.txt",
				"src/yx_road.txt", };
		
		
		

		for (int i = 0; i < filename.length; ++i) {
			String json = toJson(new File(filename[i]));
			File log = new File(filename[i] + "_log.txt");
			OutputStreamWriter writer = new OutputStreamWriter(new FileOutputStream(log), "utf-8");
			json = json.substring(0,1) + json.substring(2);
			System.out.print(json);
			JSONArray array = new JSONArray(json);
			JSONObject a_json = null;
				for (int j = 0; j < array.length(); ++j) {
					Session session = HibernateSessionFactory.getSession();
					Transaction tran = null;
						try {	
							a_json = array.getJSONObject(j);
							System.out.print(a_json);
							Integer areaid = a_json.getInt("area");
							Area area = (Area) session.load(Area.class, areaid);
							Block block = new Block();
							block.setArea(area);
							block.setBlockName(a_json.getString("name"));
							if (filename[i].contains("bus"))
								block.setBlockType(Block.BLOCK_TYPE_BUSSTOP);
							if (filename[i].contains("road"))
								block.setBlockType(Block.BLOCK_TYPE_STREE);
							block.setBlockAddrX(a_json.getDouble("longtitude"));
							block.setBlockAddrY(a_json.getDouble("latitude"));
							char ch = block.getBlockName().charAt(0);
							String letter = PinyinHelper.toHanyuPinyinStringArray(ch)[0]
									.substring(0, 1);
							block.setFirstLetter(letter);
							tran = session.beginTransaction();
							tran.begin();
							session.save(block);
							tran.commit();
						} catch (Exception e) {
							if(tran!=null)tran.rollback();
							writer.write(a_json.toString()+"\r\n");
							e.printStackTrace();
							continue;
						} finally {
							if (session.isOpen())
								session.close();
						}
				}
				
			
		}
	}

	public static void main(String[] args) throws IOException, JSONException {
		
		Block block = null;
		String name = null;
		StringBuffer every = null;
		StringBuffer pinyin = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tran = null;
		try {	
			tran = session.beginTransaction();
			tran.begin();
			List all = session.createCriteria(Block.class).list();
			for(int i = 0 ; i < all.size() ; ++i){
			
				block = (Block) all.get(i);
				name = block.getBlockName();
				every = new StringBuffer();
				pinyin = new StringBuffer();
				for(int j = 0 ; j < name.length() ; ++j){
					char ch = name.charAt(j);
					String[] a = PinyinHelper.toHanyuPinyinStringArray(ch);
					if(a !=null){
						every.append(a[0].substring(0, 1));
						pinyin.append(a[0].substring(0, a[0].length()-1));
					}
				}
				String old = block.getEveryFirstLetter();
				block.setEveryFirstLetter(every.toString().trim());
				block.setPinYin(pinyin.toString().trim());
				String newn = block.getEveryFirstLetter();
				session.update(block);
				//System.out.println(block.getEveryFirstLetter()+"### "+block.getPinYin());
			}
			tran.commit();

		} catch (Exception e) {
			tran.rollback();
			e.printStackTrace();
		} finally {
			if (session.isOpen())
				session.close();
		}
	}

}
