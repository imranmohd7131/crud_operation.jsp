<%@page import="com.example.demo.entity.Login"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.example.demo.controller.Controller"%>
<%@page import="com.example.demo.entity.Entity"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="all_css.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container p-5">
	 
  <% int id=Integer.parseInt(request.getParameter("id"));
  System.out.println("id from edit: "+id);
  Controller con=new Controller();
  %>
  <% Entity e=(Entity)request.getAttribute("data"); 
  %>
  	<pre>
	<form action="update" method="post">
	<div class="mb-3">
	 	<label class="form-label">Enter employee id which you want to edit</label>
		<input type="number" value="<%= e.getId() %>" name="empId" class="form-control"><br>
		<label class="form-label">employee name</label>
		<input type="text" value="<%=e.getName() %>" name="empName" class="form-control"><br>  
		<label class="form-label">employee location</label>
		<input type="text" value="<%=e.getLoc() %>"name="empLoc" class="form-control"><br>
					
		<button type="submit" class="btn btn-primary">Update</button>
	</div>
	</form>
	</pre>  
</div>
</body>
</html>