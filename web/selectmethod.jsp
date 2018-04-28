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
        
        <table align="center" width="100%">
            <tr>
                <td><a href="POSController?action=cash"><button class="btn-primary btn-lg">Cash</button></a></td>
                <td><a href="POSController?action=credit"><button class="btn-primary btn-lg">Credit</button></a></td>
            </tr>
        </table>
    </body>
</html>
