<%-- 
    Document   : orders
    Created on : Mar 28, 2018, 6:07:38 PM
    Author     : Andrew
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
         <link href="styles.css" rel="stylesheet" type="text/css">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <div id="one" class="papers">
            <h1>Guest Check</h1>
            <table id="check" width="100%"></table>
        </div>
        <table align="right" width="55%">
        <tr>
            <td><button class="btn-lg btn-default" id="burger">Burger</button></td>
            <td><button class="btn-lg btn-default" id="cheese_burger">Cheese Burger</button></td>
            <td><button class="btn-lg btn-default" id="chicken_tenders">Chicken Tenders</button></td>
            <td><button class="btn-lg btn-default" id="fries">Fries</button></td>
        </tr>
        </table>
        
            <script>

                $("#burger").click(function () {
                    $("#check").append('<tr>');
                    $("#check").append('<td align="left">Burger</td>');
                    $("#check").append('<td align="right">$ 2.50</td>');
                    $("#check").append('<td align="right"><button class="btn-sm btn-danger" id="remove">-</button></td>');
                    $("#check").append('</tr>');
                });
                $("#cheese_burger").click(function () {
                    $("#check").append('<tr>');
                    $("#check").append('<td align="left">Cheese Burger</td>');
                    $("#check").append('<td align="right">$ 2.80</td>');
                    $("#check").append('<td align="right"><button class="btn-sm btn-danger" id="remove">-</button></td>');
                    $("#check").append('</tr>');
                });
                $("#chicken_tenders").click(function () {
                    $("#check").append('<tr>');
                    $("#check").append('<td align="left">Chicken Tenders</td>');
                    $("#check").append('<td align="right">$ 3.10</td>');
                    $("#check").append('<td align="right"><button class="btn-sm btn-danger" id="remove">-</button></td>');
                    $("#check").append('</tr>');
                });
                $("#fries").click(function () {
                    $("#check").append('<tr>');
                    $("#check").append('<td align="left">Fries</td>');
                    $("#check").append('<td align="right">$1 .00</td>');
                    $("#check").append('<td align="right"><button class="btn-sm btn-danger" id="remove">-</button></td>');
                    $("#check").append('</tr>');
                });

            </script>
    </body>
</html>
