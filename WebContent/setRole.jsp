<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		String role=request.getParameter("role");
	
		HttpSession sessions=request.getSession();
		sessions.setAttribute("role", role);
		
		request.getRequestDispatcher("login.jsp").forward(request,response);
	%>
</body>
</html>