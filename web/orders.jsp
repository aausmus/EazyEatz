<%-- 
    Document   : orders
    Created on : Mar 28, 2018, 6:07:38 PM
    Author     : Andrew Ausmus
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
         <link href="styles.css" rel="stylesheet" type="text/css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <div class="papers">
            <h1>Guest Check</h1>
            <table id="check" width="100%">
                <c:forEach items="${orderItems}" var="orderItem">
                    <tr>
                        <td><c:out value="${orderItem.menuItemName}" /></td>
                        <td><c:out value="${orderItem.menuItemPrice}" /></td>
                    </tr>
                </c:forEach>
                    <tr>
                        <td>Subtotal</td><td><c:out value="${subtotal}" /></td>
                    </tr>
                    <tr>
                        <td>Tax</td><td><c:out value="${tax}" /></td>
                    </tr>
                    <tr>    
                        <td>Total</td><td><c:out value="${total}" /></td>
                    </tr>
                    
                
               
            </table>
        </div>
        
        <div class="btn-group-vertical"> align="right" width="55%">
        
        <c:forEach items="${menuItems}" var="menuItem">
            <form action="MenuController?action=orders" method="post">
                <input type="hidden" name="menuItem" value="${menuItem.menuItemId}" >
                <input type="submit" class="btn-md btn-primary" value="<c:out value="${menuItem.menuItemName}" />" >
            </form>
        </c:forEach>
        </div>
    </body>
</html>
