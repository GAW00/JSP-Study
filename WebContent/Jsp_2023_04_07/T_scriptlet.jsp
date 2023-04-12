<%@page import="java.text.SimpleDateFormat"%>
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
	Date d = new Date();
	String s = d.toString();
	SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
	out.println(ft.format(d));
	%>
	</body>
</html>