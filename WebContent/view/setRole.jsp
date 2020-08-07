<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">
</head>
<body>
	<%
		String role=request.getParameter("role");
	
		HttpSession sessions=request.getSession();
		//Using HttpSession for the processing the User Info
		sessions.setAttribute("role", role);
		
		response.sendRedirect("login.jsp");
	%>
</body>
</html>