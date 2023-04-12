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
		<p>
			Today's date:
<%-- 		<%=  %> : 표현식으로 출력(세메콜론 추가하면 오류) --%>
			<%= new Date() %>
		</p>
	</body>
</html>