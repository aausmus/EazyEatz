<%-- 
    Document   : listinventory
    Created on : Apr 9, 2018, 7:57:39 PM
    Author     : Andrew FEAT. George
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Show All Inventory</title>
</head>
<body>
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
                    <td><a href="InventoryController?action=edit&inventoryid=<c:out value="${inventoryItem.inventoryid}"/>">Update</a></td>
                    <td><a href="InventoryController?action=delete&inventoryid=<c:out value="${inventoryItem.inventoryid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="InventoryController?action=insert">Add Inventory</a></p>
    <p><a href="UserController?action=insert">Add User</a></p>
    <p><a href="UserController?action=listUser">List User</a></p>
</body>
</html>

