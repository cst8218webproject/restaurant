package project.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import project.db.DatabaseConnection;
import project.web.common.MenuitemBean;
/**
 * Connect to database and operate on menuitems table in database
 * @author Chen
 *
 */
public class MenuitemDaoImpl implements MenuitemDao{

	private Connection conn = null;
	private PreparedStatement pStmt = null;

	public MenuitemDaoImpl() throws Exception {
		conn = new DatabaseConnection().getConnection();
	}

	@Override
	public boolean doCreate(MenuitemBean item) throws Exception {
		boolean flag = false;
		try{
			String sql = "insert into menuitems(name,price,description,imgsrc) values (?,?,?,?)";
			pStmt = conn.prepareStatement(sql);
			pStmt.setString(1, item.getName());
			pStmt.setBigDecimal(2, item.getPrice());
			pStmt.setString(3, item.getDescription());
			pStmt.setString(4, item.getImgsrc());

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
	public MenuitemBean findById(int id) throws Exception {
		MenuitemBean item = null;
		ResultSet rs = null;
		try{
			String sql = "select * from menuitems where id=?";
			pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, id);
			rs = pStmt.executeQuery();
			if(rs.next()){
				item = new MenuitemBean();
				item.setId(id);
				item.setName(rs.getString(2));
				item.setPrice(rs.getBigDecimal(3));
				item.setDescription(rs.getString(4));
				item.setImgsrc(rs.getString(5));
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
		return item;
	}

	@Override
	public MenuitemBean updateId(int id, MenuitemBean item) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MenuitemBean> findAll() throws Exception {
		List<MenuitemBean> all = new ArrayList<MenuitemBean>();
		ResultSet rs = null;
		try{
			String sql = "select * from menuitems";
			pStmt=this.conn.prepareStatement(sql);
			rs=this.pStmt.executeQuery();
			MenuitemBean item = null;
			while(rs.next()){
				item = new MenuitemBean();
				item = new MenuitemBean();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setPrice(rs.getBigDecimal(3));
				item.setDescription(rs.getString(4));
				item.setImgsrc(rs.getString(5));
				all.add(item);
			}
		}catch(Exception e){
			throw e;
		}finally{
			if(rs!=null)
				rs.close();
			if(pStmt!= null)
				pStmt.close();
			conn.close();
		}
		return all;
	}

}
