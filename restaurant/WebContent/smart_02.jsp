<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import="com.jspsmart.upload.*" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<body> 
<%  
   request.setCharacterEncoding("utf-8");  
%> 
<%   
   SmartUpload smart=new SmartUpload();  
  smart.initialize(pageContext);// 初始化上传操作  
  smart.upload();       //上传准备  
 String name=smart.getRequest().getParameter("mname"); 
  String des=smart.getRequest().getParameter("description");
  String pri=smart.getRequest().getParameter("price");
 com.jspsmart.upload.File file = smart.getFiles().getFile(0);
 String test = file.getFileName();
String fileName="images"+"\\"+"Menuitems"+"\\"+file.getFileName();


 smart.save("/images/Menuitems");  //文件保存  
 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject?useSSL=false","root", "");
 Statement st = con.createStatement();
 
 try{
 	int i = st.executeUpdate("insert into menuitems(name, description,price,imgsrc) values ('"+name+"' , '"+des+"' , '"+pri+"' , '"+fileName+"')");
 	if (i > 0) {
        
         response.sendRedirect("login.jsp");
     } else {
     	out.print("Error");
     }
 }catch(Exception e){
 	//response.sendRedirect("smart_02.html");
 	out.print(e.toString());
 }
  
%> 

</body> 
</body>
</html>