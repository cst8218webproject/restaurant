package project.web.dao;

public class MenuitemFactory {
	public static MenuitemDao getInstance() throws Exception {
		return new MenuitemDaoImpl();
	}
}
