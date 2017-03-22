package project.web.dao;
import project.web.common.UserBean;
public interface UserDao {
	public boolean updateUser(int id, UserBean user) throws Exception;
	public UserBean findById(int id) throws Exception;
}
