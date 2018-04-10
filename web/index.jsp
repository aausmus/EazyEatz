<%-- 
    Document   : index
    Created on : Mar 28, 2018, 5:18:18 PM
    Author     : Andrew Ausmus
--%>

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Insert title here</title>
</head>
<body>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <jsp:forward page="/UserController?action=listUser" />
</body>
</html>