<%-- 
    Document   : selectmethod
    Created on : Apr 28, 2018, 11:37:43 AM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Payment Method</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="btn-group">
            <button class="btn-primary btn-lg"><a href="MenuController?action=cash">Cash</a></button>
            <button class="btn-primary btn-lg"><a href="MenuController?action=credit">Credit</a></button>
        </div>
    </body>
</html>
