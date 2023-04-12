<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			Date tmd = new Date();
			out.println(tmd.getYear() + 1900 + "-" +
						(tmd.getMonth() + 1) + "-" +
						(tmd.getDate() + 1));
		%>
	</body>
</html>