package com.cart.ejb;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import com.cart.util.ItemException;

import project.web.common.MenuitemBean;
import project.web.dao.MenuitemFactory;

import com.cart.util.IdVerifier;

import javax.annotation.PostConstruct;
import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
/**
 * Description: This class represents a cart and stores information.
 * @author Chen
 *
 */
@Stateful
public class CartBean implements Cart{

	String customerId;
	String customerName;

	@PersistenceContext(unitName = "item", type = PersistenceContextType.EXTENDED)
	private EntityManager entityManager;
	List<MenuitemBean> items;
	@PostConstruct
	@Override
	public void initialize(String person) throws ItemException {
		if (person == null) {
			throw new ItemException("Null person not allowed.");
		} else {
			customerName = person;
		}

		customerId = "0";
		items = new ArrayList<>();
	}

	@Override
	public void initialize(String person, String id) throws ItemException {
		if (person == null) {
			throw new ItemException("Null person not allowed.");
		} else {
			customerName = person;
		}

		IdVerifier idChecker = new IdVerifier();
		if (idChecker.validate(id)) {
			customerId = id;
		} else {
			throw new ItemException("Invalid id: " + id);
		}

		items = new ArrayList<>();
	}

	@Override
	public void addItem(MenuitemBean item){
		boolean exist = false;
		for (MenuitemBean i : items) {
			if(i.getId() == item.getId()){
				exist = true;
				i.setQuantity(i.getQuantity() + item.getQuantity());
				break;
			}

		}
		if(!exist)
			items.add(item);
	}

	@Override
	public boolean removeItem(MenuitemBean item) throws ItemException {
		boolean flag =false;
		for(MenuitemBean i :items){
			if(i.getId() == item.getId()){
				if(items.remove(i)){
					flag = true;
				}
				break;
			}
		}
		if (flag == false) {
			throw new ItemException("\"Failed to remove " + item.getName() + "\" from cart.");
		}
		return flag;
	}

	@Override
	public String removeItem(int id) throws ItemException {
		boolean flag =false;
		String name = null;
		for(MenuitemBean item :items){
			if(id == item.getId()){
				name = item.getName();
				if(items.remove(item)){
					flag = true;
				}
				break;
			}
		}
		if (flag == false) {
			throw new ItemException("\"Failed to remove  item\" from cart.");
		}
		return name;
	}
	
	@Override
	public List<MenuitemBean> getContents() {
		return items;
	}

	@Remove()
	@Override
	public void remove() {
		items.clear();
	}
	@Override
	public int getQuantity(MenuitemBean item){
		return item.getQuantity();
	}

	@Override
	public boolean setQuantity(MenuitemBean item, int quantity){
		boolean flag =false;
		item.setQuantity(quantity);
		for(MenuitemBean i :items){
			if(i.getId() == item.getId()){
				i.setQuantity(quantity);
				flag = true;
				break;
			}
		}
		return flag;
	}

	@Override
	public int Count(){
		if(null == items)
			return 0;
		else
			return items.size();
	}

	@Override
	public BigDecimal totalPrice() {
		if(this.Count() > 0){
			BigDecimal total = new BigDecimal(0);
			for (MenuitemBean item : items) {
				total = total.add(item.getPrice().multiply(new BigDecimal(item.getQuantity())));
			}
			return total;
		}else
			return BigDecimal.ZERO;
	}

	public static MenuitemBean createItem(int id) throws Exception{
		MenuitemBean item = MenuitemFactory.getInstance().findById(id);
		return item;
	}

	@Override
	public boolean setQuantity(int id, int quantity) {
		boolean flag =false;
		for(MenuitemBean item :items){
			if(id == item.getId()){
				item.setQuantity(quantity);
				flag = true;
				break;
			}
		}
		return flag;
	}

	@Override
	public boolean checkout() {
		// TODO Auto-generated method stub
		return false;
	}
}
