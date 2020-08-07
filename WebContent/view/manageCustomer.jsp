<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.User"%>
<%@ page import="inventory.EmartDao"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">
  	
	<title>Customer Details</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/css/bootstrap.min.css" integrity="sha384-VCmXjywReHh4PwowAiWNagnWcLhlEJLA5buUprzK8rxFgeH0kww/aWY76TfkUoSX" crossorigin="anonymous">
	<link rel="stylesheet" href="managecustomer.css">
</head>
<body>

	<%
		String role="customer";
		List<User> list=EmartDao.getAllRecords(role);  
		request.setAttribute("list",list);  
	%>  
		
	<%!int count; %>
		
	<div class="heading">
		<h1>Customer Details</h1><br>
		
		<!-- initialize every time when the page is refreshed -->
		<%count=0; %>
  	
  		<div class="header">
    		<table>
      			<thead>
        			<tr>
          				<th>#</th>
		          		<th>Customer ID</th>
		          		<th>Customer Name</th>
		          		<th>Email ID</th>
		          		<th></th>
		          		<th></th>
		        	</tr>
      			</thead>
    		</table>
  		</div>
  		
  		<div class="content">
    		<table>
      			<tbody>
      				<c:forEach items="${list}" var="u">  
		        		<tr>
		        			<td><%=++count %></td>
	    	    			<td>${u.getId()}</td>
	        				<td>${u.getName()}</td>
	        				<td>${u.getEmail()}</td>
	        				<td><a href="edituser.jsp?id=${u.getId()}&role=customer" style="width:150px;" class="btn btn-success">Edit</a></td>
	        				<td><a href="deleteuser.jsp?id=${u.getId()}&role=customer" style="width:150px;" class="btn btn-danger">Delete</a></td>
	        			</tr>
	        	    </c:forEach>  
      			</tbody>
    		</table>
  		</div>
	</div>
	
	<!-- JS, Popper.js, and jQuery -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>