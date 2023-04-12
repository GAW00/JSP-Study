<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%@ include file = "T_header.jsp" %>
		현재 시간은 : <%= Calendar.getInstance().getTime() %>
	</body>
</html>