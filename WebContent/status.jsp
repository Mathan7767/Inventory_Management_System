<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% String status=request.getSession().getAttribute("status").toString();%>
	
	<input type="hidden" id="status" value='<%=status%>' />
	          
	<script type="text/javascript">
		var status=document.getElementById('status').value
		console.log(status);
		alert(status);
	</script>
</body>
</html>