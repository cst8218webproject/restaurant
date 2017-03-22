package project.web.dao;

import java.util.List;

import project.web.common.MenuitemBean;

public interface MenuitemDao {
	/**
	 * 
	 * @param item
	 * @return
	 * @throws Exception
	 */
	public boolean doCreate(MenuitemBean item) throws Exception;
	public MenuitemBean findById(int id) throws Exception;
	public MenuitemBean updateId(int id, MenuitemBean item) throws Exception;
	public List<MenuitemBean> findAll() throws Exception;
}
