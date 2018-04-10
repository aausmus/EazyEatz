<%-- 
    Document   : user
    Created on : Apr 9, 2018, 8:00:13 PM
    Author     : Andrew
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css"
    href="css/ui-lightness/jquery-ui-1.8.18.custom.css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.18.custom.min.js"></script>
<title>Add new user</title>
</head>
<body>
    <script>
        $(function() {
            $('input[name=dob]').datepicker();
        });
    </script>

    <form method="POST" action='UserController' name="frmAddUser">
        User ID : <input type="text" readonly="readonly" name="userid"
            value="<c:out value="${user.userid}" />" /> <br />
        First Name : <input
            type="text" name="firstName"
            value="<c:out value="${user.firstName}" />" /> <br />
        Last Name : <input
            type="text" name="lastName"
            value="<c:out value="${user.lastName}" />" /> <br />
        Address : <input
            type="text" name="address"
            value="<c:out value="${user.address}" />" /> <br />
        Phone Number : <input
            type="text" name="phone"
            value="<c:out value="${user.phone}" />" /> <br />
        Pay Rate : <input
            type="text" name="payrate"
            value="<c:out value="${user.payrate}" />" /> <br />
        Job Title : <input
            type="text" name="jobtitle"
            value="<c:out value="${user.jobtitle}" />" /> <br />
        Role : <input
            type="text" name="role"
            value="<c:out value="${user.role}" />" /> <br /> <input
            type="submit" value="Submit" />
    </form>
</body>
</html>
