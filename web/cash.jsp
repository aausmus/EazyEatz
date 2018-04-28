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
        <table align="center" width="50%">
            <tr>
                <td><label>Total:<label></td>
                <td><h4><c:out value="${total}"/></h4></td>
                <td><label>Cash Received:<label></td>
                <td><h4><c:out value="${cashRecieved}"/></h4></td>
                <td><label>Change Due:<label></td>
                <td><h4><c:out value="${change}"/></h4></td>
            </tr>
        </table>
        <table align="center" width="50%">
            <form action="POSController?action=cash" method="post">
            <tr>
                <td><label>Enter Cash Received: </label></td>
                <td><input type="text" name="cashRecieved"></td>
                <td><input type="submit" value="Submit"></td>
            </tr>
        </form>
        </table>
        <table align="center" width="50%">
            <tr>
                <td></td>
                <td><a href="POSController?action=orders"><button class="btn-default btn-lg">New Order</button></a></td>
            </tr>
        </table>
        
    </body>
</html>
