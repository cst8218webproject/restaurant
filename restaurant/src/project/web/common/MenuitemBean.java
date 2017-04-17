package project.web.common;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.*;
/**
 * Description: This class represents a menuitem
 * @author Chen
 *
 */
@Entity
@Table(name="menuitems", catalog = "webproject")
public class MenuitemBean implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8450935220937298058L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id", nullable = false)
	private int id;
	@Column(name="name", nullable = false)
	private String name;
	@Column(name="price", nullable = false)
	private BigDecimal price;
	@Column(name="description")
	private String description;
	@Column(name="imgsrc")
	private String imgsrc;
	private int quantity = 0;
	
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id = id;
	}
	public String getName(){
		return name;
	}
	public void setName(String name){
		this.name = name;
	}
	public BigDecimal getPrice(){
		return price;
	}
	public void setPrice(BigDecimal price){
		this.price = price;
	}
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description = description;
	}
	public String getImgsrc(){
		return imgsrc;
	}
	public void setImgsrc(String imgsrc){
		this.imgsrc = imgsrc;
	}
	
	public int getQuantity(){
		return quantity;
	}
	public void setQuantity(int quantity){
		this.quantity = quantity;
	}
	public BigDecimal getSubTotal(){
		BigDecimal total = new BigDecimal(0);
		total = price.multiply(new BigDecimal(quantity));
		return total;
	}
}
