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
			session.removeAttribute("userID");
			String s_name = (String)session.getAttribute("userID");
			System.out.println(s_name);
			response.sendRedirect("T_session.jsp");
		%>
		
	</body>
</html>