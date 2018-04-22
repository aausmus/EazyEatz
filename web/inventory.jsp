<%-- 
    Document   : inventory
    Created on : Apr 9, 2018, 7:55:13 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
    <!--- css --->
    <link href="css/fontawesome.css" rel="stylesheet" type="text/css">
    <link href="css/footable.standalone.css" rel="stylesheet" type="text/css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="js/footable.js"></script>
    
    
    <style media="screen" type="text/css">
        #mainLayOutTable  {
                width: 75%;
                margin-left:15%; 
                margin-right:15%;
                padding: 5px;
                border: 1px solid black;
            }
            
        #inventoryEntryForm table {
                margin:auto;
                padding: 15px;
                border: 1px solid black;
            }    
    </style>
    
    <!--- form validation --->
    <script>
        jQuery(function($){
	$('.table').footable();
        });
    </script>
    
    <script>
        function validateForm() {
        var x = document.forms["myForm"]["fname"].value;
            if (x === "") {
            alert("Name must be filled out");
            return false;
            }
        }
</script>
</head>
<body>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
<header>
        <nav class="navbar navbar-default manager-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                 <!---   <a class="navbar-brand" href="manager.jsp">Management Console</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Manage Employees</a></li>
                    <li><a href="#">Manage Inventory</a></li>
                    <li><a href="#">Sales Functions</a></li>
                    <li><a href="#">Manage Menu</a></li>
                    <li><a href="#">Time Logging</a></li>
                </ul> --->
            </div>
        </nav>
        </header>    
    
    
    
    <div id="mainLayOutTable">
                <table>
                  <tr>
                      <!--- Top --->
                      <td>
                          <div id="inventoryEntryForm">
                              <table>
                                  <tr>
                                  <h2>Inventory Entry Form</h2>
                                  <form id="invenEntry" name="myForm" action="/action_page.php"
                                   onsubmit="return validateForm()" method="post">
                                    Item Name: <input type="text" name="iname"><br>
                                    Item Quantity: <input type="text" name="iquantity"><br>
                                    Item Description <input type="text" name="idesc"><br><br>
                                    <input type="submit" value="Submit">
                                    </form>
                                  </tr>
                              </table>
                          </div>
                      </td>
                  </tr>
                  <tr>
                      <!--- bottom --->
                      <td>
                          <div id="display">
                              <h2>Current Inventory</h2>
                              <table class="table">
                                    <thead>
                                        <tr>
                                            <th data-breakpoints="xs">ID</th>
                                            <th>Item Name</th>
                                            <th data-breakpoints="xs">Quantity Count</th>
                                            <th data-breakpoints="xs sm">Description</th>
			
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr data-expanded="true">
                                            <td>1</td>
                                            <td>Burger Patties</td>
                                            <td>100</td>
                                            <td>100% USDA All Beef Paties</td>
			
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Tomatoes</td>
                                            <td>25</td>
                                            <td>California Vine Ripe Tomatoes</td>
			
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Idaho Gold French Fries</td>
                                            <td>100</td>
                                            <td>4 Cases containing 25 bags a piece </td>
			
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>Angus Steak Patties</td>
                                            <td>50</td>
                                            <td>Aged Angus Steak Patties</td>
                                        </tr>
		
                                    </tbody>
                                </table>
                              
                          </div>
                      </td>
                  </tr>
                </table>
              </div>


</body>
</html>

