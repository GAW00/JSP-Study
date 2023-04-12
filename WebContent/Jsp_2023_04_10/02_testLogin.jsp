<%@page import="java.net.URLEncoder"%>
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
		String s_id = "hong";
		String s_pw = "1234";
		String s_name = "홍길동";
		s_name = URLEncoder.encode(s_name, "utf-8");
		
	// 	아이디, 비밀번호 일치하면 main.jsp 로 자동 이동
		if(s_id.equals(request.getParameter("id")) && 
				s_pw.equals(request.getParameter("pw"))){
	// 		"main.jsp?name=" : main.jsp 로 name 값을 넘김
	// 		한글처리 인코딩 방식 utf-8
			response.sendRedirect("main.jsp?name=" + s_name);// 쿼리스트링에 s_name을 보냄
		}else{
			response.sendRedirect("login.html");
		}
	%>
	</body>
</html>