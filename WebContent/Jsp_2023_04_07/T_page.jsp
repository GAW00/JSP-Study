<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
<%-- 	<%@ page import="java.util.Date"%> --%>
<%-- 	<%@ page import="java.lang.Math"%> --%>
		<%@ page import="java.util.Date, java.lang.Math"%>
		현재 날짜 : <%= new Date() %>
		<br>
		5의 제곱 : <%= Math.pow(5, 2) %>
	</body>
</html>