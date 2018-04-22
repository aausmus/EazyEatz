<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Employee Clock In Panel</title>
<link rel="stylesheet" href="style.css">

<%
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  String date = sdf.format(new Date());
%>
</head>
<body>
	<script type="text/javascript">
		function GetClock(){
		var d=new Date();
		var nmonth=d.getMonth(),ndate=d.getDate(),nyear=d.getFullYear();
		var nhour=d.getHours(),nmin=d.getMinutes(),nsec=d.getSeconds();
		var status = '${status}';
		if(nmin<=9) nmin="0"+nmin
		if(nsec<=9) nsec="0"+nsec;
		document.getElementById('clockbox').innerHTML="Current DTG: "+nyear+"-"+(nmonth+1)+"-"+ndate+" "+nhour+":"+nmin+":"+nsec+" "+status+"";
			}
				window.onload=function(){
				GetClock();
				setInterval(GetClock,1000);
			}
		</script>
	<h1>Employee Clock In Panel</h1>
	<table style="width:100%">
            	<caption id = "clockbox"> 
            	 
				</caption>
				<c:if test="${status == 'Clocked Out'}">
				<tr>
				<td><a href="ClockInController?action=clockin&userId=<c:out value="${user.userid}"/>"><button>Clock In</button></a></td>
				</tr>
				</c:if>
				<c:if test="${(status == 'Clocked In') || (status == 'On Break')}">
				<tr>
				<td><a href="ClockInController?action=clockout&userId=<c:out value="${user.userid}"/>"><button>Clock Out</button></a></td>
				</tr>
				</c:if>
				<c:if test="${status == 'Clocked In'}">
				<tr>
				<td><a href="ClockInController?action=startbreak&userId=<c:out value="${user.userid}"/>"><button>Start Break</button></a></td>
				</tr>
				</c:if>
				<c:if test="${status == 'On Break'}">
                <tr>                    
                <td><a href="ClockInController?action=endbreak&userId=<c:out value="${user.userid}"/>"><button>End Break</button></a></td>
                </tr>
                </c:if>
                
    </table>
    <p><a href="UserController?action=insert">Add User</a></p>
    <p><a href="UserController?action=listUser">Logout</a></p>
</body>
</html>
