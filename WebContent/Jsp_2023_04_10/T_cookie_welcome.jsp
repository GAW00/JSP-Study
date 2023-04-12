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
			Cookie[] cookies = request.getCookies();
		
			for(int i = 0; i < cookies.length; i++){
				if(cookies[i].getName().equals("userID")){
					%>
					<h4><%= cookies[i].getValue() %>님 반갑습니다.</h4>
					<%
				}
			}
		%>
		<p><a href="T_cookie_out.jsp">로그아웃</a></p>
	</body>
</html>