import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class StoreNumManager {
	
	static int cityId = 1;

	
	
	

	static String url = "jdbc:mysql://localhost:3306/ymai";
	static String user = "root";
	static String pass = "123qwe";
		
	/*
	static String url = "jdbc:mysql://113.105.167.36:3306/ymai";
	static String user = "jin";
	static String pass = "269015";
	*/
	static public void main(String[] args) throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(url,user,pass);
		try{
			conn.setAutoCommit(false); 
			Statement stat = conn.createStatement();
			String sql = "select block_id from block where block.area_id in " +
			"(select area_id from area where area.city_id = "+ cityId +") order by block_id";
			ResultSet rs = stat.executeQuery(sql);
			System.out.println(sql);
			List<Integer> bids = new ArrayList<Integer>(0);
			while(rs.next()){
				bids.add(rs.getInt("block_id"));
			}
			for(int i = 0 ; i < bids.size() ; ++i){
				Integer bid = bids.get(i);
				String sql3 = "update block set store_num = (select count(*) from store_block where block_id = "+
				bid+") where block_id = " +bid;
				stat.execute(sql3);
				System.out.println(sql3);
			}
			stat.close();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
			conn.rollback();
		}
	}
}
