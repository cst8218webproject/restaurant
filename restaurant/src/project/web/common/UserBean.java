package project.web.common;

public class UserBean{
	private int id;
	private String username;
	private String email;
	private String firstname;
	private String lastname;
	private String password;
	private int role_id;
	
	public void setId(int id){
		this.id = id;
	}
	public int getId(){
		return id;
	}
	public void setUsername(String username){
		this.username = username;
	}
	public String getUsername(){
		return username;
	}
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return email;
	}
	public void setFirstname(String firstname){
		this.firstname = firstname;
	}
	public String getFirstname(){
		return firstname;
	}
	public void setLastname(String lastname){
		this.lastname = lastname;
	}
	public String getLastname(){
		return lastname;
	}
	public void setPassword(String password){
		this.password = password;
	}
	public String getPassword(){
		return password;
	}
	public void setRole_id(int role_id){
		this.role_id = role_id;
	}
	public int getRole_id(){
		return role_id;
	}
}