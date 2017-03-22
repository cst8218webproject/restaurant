package project.web.dao;

public class UserFactory {
	public static UserDao getInstance() throws Exception {
		return new UserDaoImpl();
	}
}
