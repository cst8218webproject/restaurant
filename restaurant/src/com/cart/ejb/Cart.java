package com.cart.ejb;


import java.math.BigDecimal;
import java.util.List;
import com.cart.util.ItemException;

import project.web.common.MenuitemBean;

import javax.ejb.Local;;
/**
 * 
 * @author Chen
 * Interface for Cart operations.
 */
@Local
public interface Cart {
	public void initialize(String person) throws ItemException;

	public void initialize(String person, String id) throws ItemException;

	public void addItem(MenuitemBean item);

	public String removeItem(int id) throws ItemException;
	
	public boolean removeItem(MenuitemBean item) throws ItemException;

	public List<MenuitemBean> getContents();

	public void remove();
	
	public int getQuantity(MenuitemBean item);
	
	public boolean setQuantity(MenuitemBean item, int quantity);
	
	public int Count();
	
	public BigDecimal totalPrice();

	public boolean setQuantity(int id, int quantity);
	
	public boolean checkout();
}
