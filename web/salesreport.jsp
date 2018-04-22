<%-- 
    Document   : salesReport
    Created on : Apr 20, 2018, 8:16:37 PM
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
