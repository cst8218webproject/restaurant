package project.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	private Connection conn = null;
	private static final String driver = "com.mysql.jdbc.Driver";
	private static final String dbName = "webproject?useSSL=false";
	private static final String url = "jdbc:mysql://localhost:3306/";
	private static final String userName = "root";
	private static final String password = "";
	
	public DatabaseConnection() throws Exception{
		try{
//			Properties props = new Properties();
//			FileInputStream in = new FileInputStream("database.properties");
//		    props.load(in);
//		    in.close();
//		    
//		    String driver = props.getProperty("driver");
//		    String dbName = props.getProperty("dbname");
//		    String url = props.getProperty("url");
//		    String userName = props.getProperty("username");
//	        String password = props.getProperty("password");
	        
			Class.forName(driver).newInstance();
			conn = DriverManager
                    .getConnection(url + dbName, userName, password);
		}catch (Exception e){
			throw e;
		}
	}
	
	public Connection getConnection(){
		return conn;
	}
	
	public void close() throws Exception{
		if(conn!=null){
			try{
				conn.close();
			}catch(Exception e){
				throw e;
			}
		}
	}
}
