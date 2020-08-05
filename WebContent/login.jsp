<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
	
	<div class="cont">
    	<div class="form sign-in">
      	<h2>Sign In</h2>
      	<form action="<%=request.getContextPath() %>/Signin" name="signin" method="post">
	        <label>
	          <span>User Id<span style="color: red">*</span></span>
	          <input type="text" name="userid" id="userid">
	        </label>
	        <label>
	          <span>Password<span style="color: red">*</span></span>
	          <input type="password" name="password" id="password">
	        </label>
	        <button class="submit" type="submit" onclick="return login()">Sign In</button>
	      </form>
	    </div>
	
	    <div class="sub-cont">
	      <div class="img">
	        <div class="img-text m-up">
	          <h2>New here?</h2>
	          <p>Sign up and discover great amount of new opportunities!</p>
	        </div>
	        <div class="img-text m-in">
	          <h2>One of us?</h2>
	          <p>If you already has an account, just sign in.</p>
	        </div>
	        <div class="img-btn">
	          <span class="m-up">Sign Up</span>
	          <span class="m-in">Sign In</span>
	        </div>
	      </div>
	      <div class="form sign-up">
       
	        <h2>Sign Up</h2>
	        <form action="<%=request.getContextPath() %>/Register" name="signup" method="post">
	        
	          <% String role=request.getSession().getAttribute("role").toString();%>
	          <input type="hidden" id="role" value=<%=role%> />
	          
	          <label>
	            <span>User Id<span style="color: red">*</span></span>
	            <input type="text" name="userid">
	          </label>
	          <label>
	            <span>Name<span style="color: red">*</span></span>
	            <input type="text" name="name">
	          </label>
	          <label>
	            <span>Email<span style="color: red">*</span></span>
	            <input type="email" name="emailid">
	          </label>
	          <label>
	            <span>Password<span style="color: red">*</span></span>
	            <input type="password" name="password1">
	          </label>
	          <label>
	            <span>Confirm Password<span style="color: red">*</span></span>
	            <input type="password" name="password2">
	          </label>
	          <button type="submit" class="submit" onclick="return register()">Sign Up Now</button>
	        </form>
	      </div>
	    </div>
	  </div>
	<script type="text/javascript" src="js/script.js"></script>
</body>
</html>