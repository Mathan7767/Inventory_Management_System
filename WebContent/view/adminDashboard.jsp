<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="description" content="Inventory Management System For Emart Grocery Shop">
  	<meta name="keywords" content="HTML, JSP, CSS, Java, MySQL">
  	<meta name="author" content="Mathan S">
  	
	<title>Dashboard</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
 	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 	<link rel="stylesheet" type="text/css" href="/css/admindashboard.css">
	
</head>
<body>
	   
    <br/><br/>
    <%HttpSession session1=request.getSession(); %>
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="card h-100">
                  <div class="card-body">
                  	 <img class="card-img-top mx-auto" style="width:60%;" src="images/user.jpg">
                  	 <h4 class="card-title">Profile Info</h4>
                     <br>
                     <p class="card-text"><i class="fas fa-user" aria-hidden="true"></i><%=session.getAttribute("name") %></p>
                     <p class="card-text"><i class="fas fa-envelope-open" aria-hidden="true"></i><%=session.getAttribute("role") %></p>
                     <p class="card-text"><i class="fas fa-envelope-open" aria-hidden="true"></i><%=session.getAttribute("email") %></p>
                   </div>
                </div>
            </div>
      
            <div class="col-md-8">
                <div class="jumbotron" style="width:100%;height:100%;">
                    <h1>Welcome <%=session.getAttribute("role") %></h1>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="card">
                              <div class="card-body">
                                <h4 class="card-title">New Orders</h4>
                                <p class="card-text">Here you can make invoices and create new orders</p>
                                <a href="newOrder.jsp" class="btn btn-primary">New Orders</a>
                              </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      
        </div>
    </div>
    
    
    <div class="container">
    	
    	<br><br>
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                        <div class="card-body">
                        <h4 class="card-title">Customers</h4>
                        <p class="card-text">Here you can manage your customer</p>
                        <br>
                        <a href="#" class="btn btn-primary">Add</a>
                        <a href="manageCustomer.jsp" class="btn btn-primary">Manage</a>
                    </div>
                </div>
            </div>
    
            <div class="col-md-4">
                <div class="card">
                        <div class="card-body">
    	                    <h4 class="card-title">Suppliers</h4>
        	                <p class="card-text">Here you can manage your suppliers</p>
            	            <br>
                	        <a href="#" class="btn btn-primary">Add</a>
                    	    <a href="#" class="btn btn-primary">Manage</a>
                    	</div>
                	</div>
            	</div>
            
            	<div class="col-md-4">
                	<div class="card">
                        <div class="card-body">
                    	    <h4 class="card-title">Products</h4>
                        	<p class="card-text">Here you can manage your products</p>
                        	<br>
                            <a href="#" class="btn btn-primary">Manage</a>
                    	</div>
                	</div>
            	</div>
        	</div>
    	</div>
	
		
	<!-- JS, Popper.js, and jQuery -->
	
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.1/js/bootstrap.min.js" integrity="sha384-XEerZL0cuoUbHE4nZReLT7nx9gQrQreJekYhJD9WNWhH8nEW+0c5qq7aIo2Wl30J" crossorigin="anonymous"></script>
</body>
</html>