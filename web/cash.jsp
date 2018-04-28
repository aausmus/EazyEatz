<%-- 
    Document   : cash
    Created on : Apr 28, 2018, 12:12:41 PM
    Author     : Andrew
--%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Transaction</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <label>Total:<label>
        <h4><c:out value="${total}"/></h4>
        <label>Cash Received:<label>
        <h4><c:out value="${cashRecieved}"/></h4>
        <label>Change Due:<label>
        <h4><c:out value="${change}"/></h4>
        <form action="MenuController?action=cash" method="post">
            <label>Enter Cash Received: </label>
            <input type="text" name="cashRecived">
            <input type="submit" value="Submit">
        </form>
        <button class="btn-default btn-lg"><a href="MenuController?action=orders">New Order</a>"</button>
    </body>
</html>
