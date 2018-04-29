<%-- 
    Document   : inventory
    Created on : Apr 9, 2018, 7:55:13 PM
    Author     : Andrew FEAT. George
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
   
    
    <div id="mainLayOutTable">
        <table>
            <tr>
                <!--- Top --->
                <td>
                    <div id="inventoryEntryForm">
                    <form method="POST" action='InventoryController' name="frmAddInventory">
                        Inventory ID : <input type="text" readonly="readonly" name="inventoryid"
                            value="<c:out value="${inventoryItem.inventoryid}" />" /> <br />
                        Item Stock : <input type="text" name="stock"
                                value="<c:out value="${inventoryItem.stock}" />" /> <br />
                        Item Cost : <input type="text" name="cost"
                                value="<c:out value="${inventoryItem.cost}" />" /> <br />
                        Item Name : <input type="text" name="item"
                                value="<c:out value="${inventoryItem.item}" />" /> <br /> <input
                                type="submit" value="Submit" />
                    </form>
                    </div>
                      </td>
            </tr>
            <tr>
                <!--- bottom --->
                <td>
            <div id="display">
                <h2>Current Inventory</h2>
                <table border=1>
        <thead>
            <tr>
                <th>Item</th>
                <th>Stock</th>
                <th>Cost</th>
                <th colspan=2>Action</th> 
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${inventoryItems}" var="inventoryItem">
                <tr>
                    <td><c:out value="${inventoryItem.item}" /></td>
                    <td><c:out value="${inventoryItem.stock}" /></td>
                    <td><c:out value="${inventoryItem.cost}" /></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
                              
                          </div>
                      </td>
                  </tr>
                </table>
              </div>


</body>
</html>