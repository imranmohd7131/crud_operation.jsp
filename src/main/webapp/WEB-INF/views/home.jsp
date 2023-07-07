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
<title>Home Page</title>
<%@include file="all_css.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container p-5">
<p class="text-center fs-1">All Employees Details</p>
				<% if(request.getAttribute("msg")!=null) { %>
	<center><h4 style="color:blue;"><%=request.getAttribute("msg") %></h4>	</center>
				<% } %>
				<% if(request.getAttribute("mmssgg")!=null) { %>
	<center><h4 style="color:red;"><%=request.getAttribute("mmssgg") %></h4>	</center>
				<% } %>
<table class="table">
  <thead>
    <tr>
      <th scope="col">Employee ID</th>
      <th scope="col">Employee Name</th>
      <th scope="col">Employee Location</th>
    </tr>
    <tr>  
    <% List<Entity> li=(List<Entity>)request.getAttribute("get");
	for(Entity e:li){
	%>
	<td><%= e.getId()%></td>
	<td><%= e.getName()%></td> 
	<td><%= e.getLoc()%></td>
	<td><a href="edit?id=<%=e.getId() %>" class="btn btn-sm btn-primary">Edit</a>
       <a href="delete?id=<%=e.getId() %>" class="btn btn-sm btn-danger ms-1">Delete</a>
      </td>
	</tr>
	<% }%>
  </thead>
  <tbody>
  </tbody>
</table>
</div>
</body>
</html>