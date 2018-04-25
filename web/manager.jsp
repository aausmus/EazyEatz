<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Management Console</title>
        <!---<link href="styles.css" rel="stylesheet" type="text/css"> --->
        
        <style media="screen" type="text/css">

           H3 {text-align: center;}

            table, th, td {
                margin:auto;
                padding: 15px;
                border: 0px solid black;
            }

            .POStable button {
                width: 250px;
                font-size: 24px;
                background-color: orange; /* Green background */
                border: 1px solid orange; /* Green border */
                color: white; /* White text */
                padding: 20px 48px; /* Some padding */
                cursor: pointer; /* Pointer/hand icon */
                float: left; /* Float the buttons side by side */
            }
            
            .POStable td {    
                padding: 15px; /* Some padding */
            }
            
            .POStable p {
                font-size: 20px;
            }

            .distable button {
                width: 250px;
                font-size: 24px;
                background-color: orange; /* Green background */
                border: 1px solid orange; /* Green border */
                color: white; /* White text */
                padding: 20px 48px; /* Some padding */
                cursor: pointer; /* Pointer/hand icon */
                float: left; /* Float the buttons side by side */
            }

        </style>
      
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
              
        <div align="center">
            <h3>Admin Control Panel</h3>
            
        </div>
        
        <script>
            
        </script>
        
        <div class="POStable">
        <table style="width:70%">
        <tr>
            <td><h3>
                    
                           
                              <p id="p1">Welcome <!--${requestScope.user.firstName} ${requestScope.user.lastName}--> Manager!</p>
             <script>
                var currenttime; 
                var tDate = new Date();
                var month;
                if(tDate.getMonth() === 0){month = 'January';}
                if(tDate.getMonth() === 1){month = 'February';}
                if(tDate.getMonth() === 2){month = 'March';}
                if(tDate.getMonth() === 3){month = 'April';}
                if(tDate.getMonth() === 4){month = 'May';}
                if(tDate.getMonth() === 5){month = 'June';}
                if(tDate.getMonth() === 6){month = 'July';}
                if(tDate.getMonth() === 7){month = 'August';}
                if(tDate.getMonth() === 8){month = 'September';}
                if(tDate.getMonth() === 9){month = 'October';}
                if(tDate.getMonth() === 10){month = 'November';}
                if(tDate.getMonth() === 11){month = 'December';}
                
                
                 
                currenttime = tDate.toLocaleTimeString();
                var para = document.createElement("p");
                
                var node = document.createTextNode("Today is " + month + ' ' + tDate.getDate()+',' + ' ' + tDate.getFullYear() + '  ' + currenttime);
                para.appendChild(node);

                var element = document.getElementById("p1");
                element.appendChild(para);
                 
                 
            </script>       
            <!--<p>Today is ${requestScope.currentTime}</p>-->   
            </h3></td>
          <td>
                <!--- menu item table --->
                <div id="menutable">
                <table>
                  <tr>
                    <td>
                      <!--- the target url needs to be updated here to the appropriate pages --->  
                      <button onclick="location.href='ManageEmployeeController?action=manageemployeehome'" type="button">
                            Manage Employees</button>
                    </td>
                    <td>
                      <button onclick="location.href='http://localhost:8080/nbproject/inventory.jsp'" type="button">Manage Inventory</button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <button onclick="location.href='http://localhost:8080/nbproject/sales.jsp'" type="button">Sales Functions</button>
                    </td>
                    <td>
                      <button onclick="location.href='http://localhost:8080/nbproject/menu.jsp'" type="button">Manage Menu</button>
                    </td>
                  </tr>
                  <tr>
                    
                  </tr>
                </table>
              </div>
          </td>
        </tr>
        <tr>


        </tr>
      </table>
    </div>
    </body>
</html>