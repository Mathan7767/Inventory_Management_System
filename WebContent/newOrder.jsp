<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>New Product</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" text="text/css" href="background.css"/>
</head>
<body>

	<div class="overlay"><div class="loader"></div></div>
	   <br/><br/>

       <div class="container" style="min-height: 100%;height: 100%;">
        <br><br><br>
        <div class="row">
            <div class="col-md-10 mx-auto">
                <div class="card" style="box-shadow:0 0 25px 0 lightgrey;">
                  <div class="card-header">
                    <h4>New Orders</h4>
                  </div>
                  <div class="card-body">
                    <form id="get_order_data" onsubmit="return false">
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label" align="right">Order Date</label>
                            <div class="col-sm-6">
                                <input type="text" id="order_date" name="order_date" readonly class="form-control form-control-sm" value="<%=(new SimpleDateFormat("dd:MM:yyyy").format(new Date()))%>"/>
                            </div>
                         </div>
                         <div class="form-group row">
                            <label class="col-sm-3 col-form-label" align="right">Order Time</label>
                            <div class="col-sm-6">
                                <input type="text" id="order_time" name="order_time" readonly class="form-control form-control-sm" value="<%=(new SimpleDateFormat("hh:mm:ss").format(new Date()))%>"/>
                            </div>
                         </div>
                        <div class="form-group row">
                            <label class="col-sm-3 col-form-label" align="right">Supplier ID*</label>
                            <div class="col-sm-6">
                                <input type="text" id="supplier_id" name="supplier_id"class="form-control form-control-sm" placeholder="Enter Supplier ID" required/>
                            </div>
                        </div>


                        <div class="card" style="box-shadow:0 0 15px 0 lightgrey;">
                            <div class="card-body">
                                <h3>Order list</h3>
                                <table align="center" style="width:800px;">
                                    <thead>
                                      <tr>
                                        <th>#</th>
                                        <th style="text-align:center;">Item Name</th>
                                        <th style="text-align:center;">Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody id="invoice_item">
                                    </tbody>
                                </table> <!--Table Ends-->
                                <center style="padding:10px;">
                                    <button id="add" style="width:150px;" class="btn btn-success" onclick="add()	">Add</button>
                                    <button id="remove" style="width:150px;" class="btn btn-danger">Remove</button>
                                </center>
                            </div> <!--Crad Body Ends-->
                        </div> <!-- Order List Crad Ends-->

                    <p></p>
              
                    <center>
                      <input type="submit" id="order_form" style="width:150px;" class="btn btn-info" value="Order">
                      <input type="submit" id="print_invoice" style="width:150px;" class="btn btn-success d-none" value="Print Invoice">
                    </center>


                    </form>

                  </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- JS, Popper.js, and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	
</body>
</html>