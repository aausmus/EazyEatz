<%-- 
    Document   : manageemployeehome
    Created on : Apr 17, 2018, 10:19:33 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <header>
        <nav class="navbar navbar-default manager-navbar">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="manager.jsp">Management Console</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Manage Employees</a></li>
                    <li><a href="#">Manage Inventory</a></li>
                    <li><a href="#">Sales Functions</a></li>
                    <li><a href="#">Manage Menu</a></li>
                    <li><a href="#">Time Logging</a></li>
                </ul>
            </div>
        </nav>
        </header>
        <div align="center">
            <h2>Manage Employees</h2>
        </div>
        <div align="center">
            <div style="width:30%">
                <form id="editForm" method="POST" action="ManageEmployeeController?action=edituser">
                    <div class="btn-toolbar" style="float:left">
                        <a href="ManageEmployeeController?action=addemployee"><button style="width:100%" style="height:30px" type="button">Add Employee</button></a>
                        <br>
                        <br>
                        <button type="button" style="width:100%" style="height:30px" onclick="deleteFunction()">Remove Employee</button>
                        <br>
                        <br>
                        <button style="width:100%" style="height:30px" type="submit" onclick="setEditUserFunction()">Edit Employee</button>
                    </div>
                    <select id="mySelect" size="10">
                        <c:forEach var="user" items="${requestScope.users}">
                            <option value="${user.userid}">${user.name}</option>
                        </c:forEach>
                    </select>
                    <input id="editUserID" type="number" name="edituserid" style="display: none">
                </form>
            </div>
        </div>
        <div align="center">
            <label id="deleteLabel" style="visibility: hidden">Are you SURE you want to delete the selected Employee?</label>
            <form id="deleteForm"   method="POST" action="ManageEmployeeController?action=deleteuser">
                
                <button id="delEmpBut" type="submit" value="delete" style="visibility: hidden" onclick="retrieveUserID()">Delete Employee</button>
                <button id="noDelEmpBut" type="button" value="notDelete" style="visibility: hidden" onclick="dontDeleteFunction()">Do not delete</button>
                <input id="useridInput" type="number" name="userid" style="display: none">
            </form>
        </div>
        <script>
            function retrieveUserID() {
                var x  = document.getElementById("mySelect").value;
                document.getElementById("useridInput").value = x;
            }
            function deleteFunction() {
                var x = document.getElementById("mySelect").value;
                if((x !== null) && (x !== "")) {
                document.getElementById("deleteLabel").style.visibility = "visible";
                document.getElementById("delEmpBut").style.visibility = "visible";
                document.getElementById("noDelEmpBut").style.visibility = "visible";
            }
            }
            function dontDeleteFunction() {
                document.getElementById("deleteLabel").style.visibility = "hidden";
                document.getElementById("delEmpBut").style.visibility = "hidden";
                document.getElementById("noDelEmpBut").style.visibility = "hidden";
            }
            function setEditUserFunction() {
                var x  = document.getElementById("mySelect").value;
                document.getElementById("editUserID").value = x;
            }
        </script>
    </body>
</html>

