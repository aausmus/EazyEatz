<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body onload="checkIfEditFunction()">
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <header>
        <nav class="navbar navbar-default manager-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="manager.jsp">Management Console</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="ManageEmployeeController?action=manageemployee">Manage Employees</a></li>
                    <li><a href="#">Manage Inventory</a></li>
                    <li><a href="#">Sales Functions</a></li>
                    <li><a href="#">Manage Menu</a></li>
                    <li><a href="#">Time Logging</a></li>
                </ul>
            </div>
        </nav>
        </header>
        
        <h1 align="center">New Employee</h1>
        <br>
        <form name="submitForm" method="POST" action="ManageEmployeeController?action=addemployee">
            <div style="width:50%; margin:0 auto;">
                <div id="entryForms" style="float:left">
                    Employee Name: <input id="empNameTxt" name="nameEntry" type="text" />
                    <br>
                    Address:  <input id="addressTxt" name="addressEntry" type="text" />
                    <br>
                    Phone:  <input id="phoneTxt" name="phoneEntry" type="text" />
                    <br>
                    Pin: <input id="pinTxt" name="pinEntry" type="text"
                    <br>
                    <br>
                    <button id="submitButton" type="submit">Submit</button>
                </div>
                <div id="accessLevels" style="float:right">
                    <h3>System Access Level:</h3>
                    <br>
                    <input id="adminCheckBox" type="radio" name="accessLevel" value="1"> Administrator
                    <br>
                    <input id="cashierCheckBox" type="radio" name="accessLevel" value="2"> Cashier
                    <br>
                    <input id="nonSalesCheckBox" type="radio" name="accessLevel" value="3"> Non-Sales
                    <br>
                </div>
            </div>
        </form>
        
        <label id="hiddenLabel" style="visibility: visible"></label>
    </body>
    <script>
        
        function checkIfEditFunction() {
            
            document.getElementById("empNameTxt").value = "${user.name}";
            document.getElementById("addressTxt").value = "${user.address}";
            document.getElementById("phoneTxt").value = "${user.phone}";
            document.getElementById("pinTxt").value = "${user.userPin}";
            switch("${user.roleID}") {
                case "1":
                    document.getElementById("adminCheckBox").checked = true;
                    break;
                case "2":
                    document.getElementById("cashierCheckBox").checked = true;
                    break;
                case "3":
                    document.getElementById("nonSalesCheckBox").checked = true;
                    break;
                default:
                    break;
                }
        }
    </script>
</html>

