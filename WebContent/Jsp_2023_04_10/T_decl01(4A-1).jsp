<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%!
			int n = 337;
			
			int getInt(){ return n; };
		%>
		<%
			out.println(getInt());
		%>
	</body>
</html>