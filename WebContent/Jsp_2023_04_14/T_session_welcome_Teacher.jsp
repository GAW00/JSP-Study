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
		String s_name = (String)session.getAttribute("userID");
		
		if(s_name.equals(null)) response.sendRedirect("T_session_out_Teacher.jsp");
		%>
		
		<h5>세션 생성 성공</h5>
		<hr>
		<h4><%= s_name %>님 반갑습니다.
		<p><a href="T_session_out.jsp">로그아웃</a></p>
	</body>
</html>