<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="model.User"%>
<%@ page import="dao.EmartDao"%>
<%@ page import="inventory.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="u" class="model.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">

	<title>Delete Customer</title>
</head>
<body>

	<!-- Getting the role of the user -->
	<%String role=request.getParameter("role"); %>
	
	<%
		int status=EmartDao.delete(u,role);
	
		//If the deletion is not done
		if(status==0)
		{
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error in Deletion');");
			out.println("</script>");
		}
		response.sendRedirect("manageCustomer.jsp");
	%>
	
</body>
</html>