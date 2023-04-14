<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 2. HTTP 상태 404 - 찾을 수 없음 -->
<%@ page errorPage="02_errorPage_error.jsp" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		name 파라미터:
<!-- 	1. HTTP 상태 500 - 내부 서버 오류 -->
		<%= request.getParameter("name").toUpperCase() %>
	</body>
</html>