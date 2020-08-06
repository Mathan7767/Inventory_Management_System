<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>New Product</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" text="text/css" href="neworder.css"/>
    <style type="text/css" src="js/newOrder.js"></style>
</head>
<body>

	<div class="overlay" id="pane"><div class="loader"></div></div>
	   <br/><br/>

       <div class="container" style="min-height: 100%;height: 100%;">
        <br>
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
                            <label class="col-sm-3 col-form-label" align="right">Supplier ID<span style="color: red">*</span></label>
                            <div class="col-sm-6">
                                <input type="text" id="supplier_id" name="supplier_id"class="form-control form-control-sm" placeholder="Enter Supplier ID"/>
                            </div>
                        </div>

                     <div class="card" style="box-shadow:0 0 15px 0 lightgrey;">
                            <div class="card-body">
                                <h3>Order list</h3>
                                <table id='tableid' align="center" style="width:800px;">
                                    <thead>
                                      <tr>
                                        <th>#</th>
                                        <th style="text-align:center;">Item Name</th>
                                        <th style="text-align:center;">Quantity</th>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </thead>
                                    <tbody id="invoice_item">
                                    </tbody>
                                </table> <!--Table Ends-->
                                <center style="padding:10px;">
                                    <button id="addProduct" style="width:150px;" class="btn btn-success">Add</button>
                                    <button id="remove" style="width:150px;" class="btn btn-danger">Remove</button>
                                </center>
                            </div> <!--Crad Body Ends-->
                        </div> <!-- Order List Crad Ends-->

                    <p></p>
              
                    <center>
                      <input type="submit" id="order_form" style="width:150px;" class="btn btn-info" value="Order">
                      <input type="submit" id="print_invoice" style="width:150px;" class="btn btn-success" value="Print Invoice">
                    </center>


                    </form>

                  </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="popup" id="popup">
        <div class="popup-content">
        	<form id="form" name="form">
            <img scr="close.jpg" class="close" id="close">
            <input type="text" class="input" placeholder="Enter Item" name="new_item" id="input-type"><br><br>
            <input type="text" class="input" placeholder="Enter Quantity" name="new_quantity" id="input-type"><br>
            <input type="submit" class="btn btn-success button" name="button" onclick="addRow()" value="Add Product">
            </form>
        </div>
    </div>
   
    <script type="text/javascript">
          document.getElementById("addProduct").addEventListener("click", function()
          {
            document.getElementById("popup").style.display = "flex";
            document.getElementById("pane").style.display = "none";
            
          })
          document.getElementById("close").addEventListener("click", function()
          {
            document.getElementById("popup").style.display = "none";
            document.getElementById("pane").style.display = "flex";
          })
          function addRow()
		  {
        		// get input values
                var item = document.form.new_item.value;
                var quantity = document.form.new_quantity.value;
                
                  
                // get the html table
                // 0 = the first table
                var table = document.getElementsByTagName('table')[0];
                  
                // add new empty row to the table
                // 0 = in the top 
                // table.rows.length = the end
                // table.rows.length/2+1 = the center
                var newRow = table.insertRow(table.rows.length/2+1);
                 
                // add cells to the row
                var cel1 = newRow.insertCell(0);
                var cel2 = newRow.insertCell(1);
                var cel3 = newRow.insertCell(2);
                  
                // add values to the cells
                cel1.innerHTML = '#';
                cel2.innerHTML = item;
                cel3.innerHTML = quantity;
    		}

        </script>
    <!-- JS, Popper.js, and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
	
</body>
</html>