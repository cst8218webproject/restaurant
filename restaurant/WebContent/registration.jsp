<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false",
            "root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    //int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "', now())");
    try{
    	int i = st.executeUpdate("insert into users(username, email, firstname, lastname, password, create_date) values ('" + user + "','" + email + "','" + fname + "','" + lname + "','" + pwd + "', current_date())");
    	if (i > 0) {
            session.setAttribute("username",request.getParameter("uname"));
            response.sendRedirect("welcome.jsp");
        } else {
        	out.print("Error");
        }
    }catch(Exception e){
    	response.sendRedirect("reg.jsp");
    	out.print(e.toString());
    }
%>