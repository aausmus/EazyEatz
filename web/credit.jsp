<%-- 
    Document   : credit
    Created on : Apr 28, 2018, 2:25:13 PM
    Author     : Andrew
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Transaction</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <table align="center" width="50%">
            <tr>
                <td><label>Total:<label></td>
                <td><h4><c:out value="${total}"/></h4></td>
            </tr>
        </table>
        <table align="center" width="80%">
            <form action="POSController?action=credit" method="post">
            <tr>
                <td><label>Credit Card Number: </label></td>
                <td><input type="text" name="creditCardNum"></td>
                <td><label>Expiration Date: </label></td>
                <td><input type="text" name="expirDate"></td>
                <td><label>CCV: </label></td>
                <td><input type="text" name="ccv"></td>
                <td><input type="submit" value="Submit"></td>
            </tr>
        </form>
        </table>
        <table align="center" width="50%">
            <tr>
                <td><a href="POSController?action=orders"><button class="btn-default btn-lg">New Order</button></a></td>
                <td><h4><c:out value="${payment}"/></h4></td>
            </tr>
        </table>
    </body>
</html>
