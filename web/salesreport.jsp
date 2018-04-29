<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Apr 27, 2018, 3:04:09 PM
    Author     : blake
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Sales Report</title>

        <link rel="stylesheet" href="styles.css" type="text/css">
        <%
            SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
            String date = sdf.format(new Date());
        %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div class="salesreport">
            <h1>Sales Report Panel</h1></br>
            <p>Today's Date: <%=date%></p></br>
            <form NAME="salesReport" METHOD="POST" class="form-control-lg">
                <INPUT TYPE="submit" NAME="report" VALUE="Weekly">
                <INPUT TYPE="submit" NAME= "report" VALUE= "Monthly">
                <INPUT TYPE="submit" NAME= "report" VALUE="Quarterly">
                <INPUT TYPE="submit" NAME= "report" VALUE="Yearly">
            </form>
            </br></br></br>
            <div class="report">
                <sql:setDataSource var = "eazyeatz" driver = "com.mysql.jdbc.Driver"
                                   url = "jdbc:mysql://localhost:3306/EazyEatz"
                                   user = "admin"  password = "admin"/>
                <c:choose>
                    <c:when test="${param.report == 'Weekly'}"> 
                        <sql:query var="week" dataSource="${eazyeatz}">
                            SELECT * FROM EazyEatz.OrderLog WHERE `OrderLog_Timestamp` BETWEEN DATE_SUB( CURDATE( ) ,INTERVAL 10 DAY ) AND CURDATE( )
                        </sql:query>
                        <table border="1" align="center">

                            <tr>
                            <c:forEach var="columnName" items="${week.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                            </tr>

                            <c:forEach var="row" items="${week.rowsByIndex}">
                                <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>
                    <c:when test="${param.report == 'Monthly'}"> 
                        <sql:query var="week" dataSource="${eazyeatz}">

                            SELECT * FROM EazyEatz.OrderLog WHERE `OrderLog_Timestamp` >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
                        </sql:query>
                        <table border="1" align="center">

                            <tr>
                            <c:forEach var="columnName" items="${week.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                            </tr>

                            <c:forEach var="row" items="${week.rowsByIndex}">
                                <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when> 
                    <c:when test="${param.report == 'Quarterly'}"> 
                        <sql:query var="week" dataSource="${eazyeatz}">

                            SELECT * FROM EazyEatz.OrderLog WHERE `OrderLog_Timestamp` BETWEEN DATE_SUB( CURDATE( ) ,INTERVAL 3 MONTH ) AND DATE_SUB( CURDATE( ) ,INTERVAL 0 MONTH )
                        </sql:query>
                        <table border="1" align="center">

                            <tr>
                            <c:forEach var="columnName" items="${week.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                            </tr>

                            <c:forEach var="row" items="${week.rowsByIndex}">
                                <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when> 
                    <c:when test="${param.report == 'Yearly'}"> 
                        <sql:query var="week" dataSource="${eazyeatz}">

                            SELECT * FROM EazyEatz.OrderLog WHERE `OrderLog_Timestamp` >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
                        </sql:query>
                        <table border="1" align="center">

                            <tr>
                            <c:forEach var="columnName" items="${week.columnNames}">
                                <th><c:out value="${columnName}"/></th>
                            </c:forEach>
                            </tr>

                            <c:forEach var="row" items="${week.rowsByIndex}">
                                <tr>
                                <c:forEach var="column" items="${row}">
                                    <td><c:out value="${column}"/></td>
                                </c:forEach>
                                </tr>
                            </c:forEach>
                        </table>
                    </c:when>             
                </c:choose>
            </div>
        </div> 
    </body>
</html>