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
    
                    <tr class="ticket-bottom">
                        <td>Subtotal</td><td><c:out value="${subtotal}" /></td>
                    </tr>
                    <tr class="ticket-bottom">
                        <td>Tax</td><td><c:out value="${tax}" /></td>
                    </tr>
                    <tr class="ticket-bottom">    
                        <td>Total</td><td><c:out value="${total}" /></td>
                    </tr>
                    <tr>
                         <td><button id="pos-buttons" class="btn-success btn-md"><a href="MenuController?action=selectmethod">Checkout</a></button></td>
                         <td><button id="pos-buttons" class="btn-danger btn-md"><a href="MenuController?action=orders">Reset</a></button></td>
                    </tr>
            </table>
        </div>
        
        <table align="right" width="55%">
        <tr>
        <c:forEach items="${menuItems}" var="menuItem" begin="0" end="3">
            <form action="MenuController?action=orders" method="post">
            
                <input type="hidden" name="menuItem" value="${menuItem.menuItemId}" >
                <td><input type="submit" class="btn-lg btn-primary" value="<c:out value="${menuItem.menuItemName}" />" ></td>
            
            </form>
        </c:forEach>
        </tr>
        <tr>
        <c:forEach items="${menuItems}" var="menuItem" begin="4" end="7">
            <form action="MenuController?action=orders" method="post">
            
                <input type="hidden" name="menuItem" value="${menuItem.menuItemId}" >
                <td><input type="submit" class="btn-lg btn-primary" value="<c:out value="${menuItem.menuItemName}" />" ></td>
            
            </form>
        </c:forEach>
        </tr>
        <tr>
        <c:forEach items="${menuItems}" var="menuItem" begin="8" end="11">
            <form action="MenuController?action=orders" method="post">
            
                <input type="hidden" name="menuItem" value="${menuItem.menuItemId}" >
                <td><input type="submit" class="btn-lg btn-primary" value="<c:out value="${menuItem.menuItemName}" />" ></td>
            
            </form>
        </c:forEach>
        </tr>
        <tr>
        <c:forEach items="${menuItems}" var="menuItem" begin="12" end="15">
            <form action="MenuController?action=orders" method="post">
            
                <input type="hidden" name="menuItem" value="${menuItem.menuItemId}" >
                <td><input type="submit" class="btn-lg btn-primary" value="<c:out value="${menuItem.menuItemName}" />" ></td>
            
            </form>
        </c:forEach>
        </tr>
        </table>
    </body>
</html>
