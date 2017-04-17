package project.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import project.db.DatabaseConnection;
import project.web.common.UserBean;
/**
 * This class connect to database and operate on users table.
 * @author Chen
 *
 */
public class UserDaoImpl implements UserDao{
	private Connection conn = null;
	private PreparedStatement pStmt = null;
	
	public UserDaoImpl() throws Exception {
		conn = new DatabaseConnection().getConnection();
	}
	@Override
	public boolean updateUser(int id, UserBean user) throws Exception {
		boolean flag = false;
		try{
			// TODO SQL query needed
			String sql = "update users set email = ?, firstname=?,lastname=?,password=? where id = ?;";
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, user.getEmail());
			pStmt.setString(2, user.getFirstname());
			pStmt.setString(3,user.getLastname());
			pStmt.setString(4, user.getPassword());
			pStmt.setInt(5, id);
			if(pStmt.executeUpdate()>0){
				flag = true;
			}
		}catch(Exception e){
			throw e;
		}finally {
			pStmt.close();
			conn.close();
		}
		return flag;
	}

	@Override
	public UserBean findById(int id) throws Exception {
		UserBean user = null;
		ResultSet rs = null;
		try{
			String sql = "select * from users where id=?";
			pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			if(rs.next()){
				user = new UserBean();
				user.setId(id);
				user.setUsername(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setFirstname(rs.getString(4));
				user.setLastname(rs.getString(5));
				user.setPassword(rs.getString(6));
				user.setRole_id(rs.getInt(10));
			}
		}catch (Exception e){
			throw e;
		}finally{
			if(rs!=null)
				rs.close();
			if(pStmt!= null)
				pStmt.close();
			conn.close();
		}
		
		return user;
	}

}
