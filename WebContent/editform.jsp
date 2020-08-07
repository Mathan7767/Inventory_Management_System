<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="model.User"%>
 <%@ page import="inventory.EmartDao"%>
 <%@ page import="inventory.*"%>
 
<jsp:useBean id="u" class="model.User"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">
	
	<title>Edit Form</title>
</head>
<body>
	<%
		String role=request.getParameter("role");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		User user=null;
		System.out.println(name+" "+email);
		user.setName(name);
		user.setEmail(email);
		user.setId(request.getParameter("id"));
		int status=EmartDao.update(user, role);  
		
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