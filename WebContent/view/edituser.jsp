<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.List"%>
<%@ page import="model.User"%>
<%@ page import="dao.EmartDao"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">
	
	<title>Edit User</title>
	
	<link rel="icon" type="image/x-icon" href="/images/registration.jpg">
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body>
	<%
		String id=request.getParameter("id");
		String role=request.getParameter("role");
		
		User user=EmartDao.getUserById(id,role);
		//System.out.println(user.getId());
	%>	
	
	<div class="cont">
    	<div class="form edit">
      	    <h2>Edit User Details</h2>
	        <form action="editform.jsp?role=<%=role %>" name="edit" method="post">
	          
	          <label>
	            <span>User Id<span style="color: red">*</span></span>
	            <input type="text" readonly value="<%=user.getId()%>">
	          </label>
	          <label>
	            <span>Name<span style="color: red">*</span></span>
	            <input type="text" name="name" placeholder="<%=user.getName() %>">
	          </label>
	          <label>
	            <span>Email<span style="color: red">*</span></span>
	            <input type="email" name="emailid" placeholder="<%=user.getEmail() %>">
	          </label>
	          <label>
	            <span>Password<span style="color: red">*</span></span>
	            <input type="password" readonly value="<%=user.getPassword() %>">
	          </label>
	          <button type="submit" class="submit" onclick="return check()">Submit</button>
	                  
	        </form>
	       </div>
	
	    <div class="sub-cont">
	      <div class="img">
	        <div class="img-text m-up">
	          <h2>Edit here!</h2>
	          <p>You can change the users details!</p>
	        </div>
	      </div>
	     </div>
	</div>
	
	<script type="text/javascript">
		
		function check()
		{
			var name=document.edit.name.value;
			var email=document.edit.emailid.value;
			
			if(name=="")
			{
				alert('Enter the name');
				return false;
			}
			
			if(email=="")
			{
				alert('Enter the name');
				return false;
			}
			
			if(validateEmail(email)==false)
			{
				alert('you have entered an invalid email address!')
				return false
			}
		
		}
		function validateEmail(email)
		{
			return /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email);
		}

		
	</script>
</body>
</html>