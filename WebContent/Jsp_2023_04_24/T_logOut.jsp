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
			session.invalidate();
			%>
				<script>
					alert("로그아웃 되었습니다!");
					location.href = "T_login.jsp"; // 그냥 이거 써라 sendredirect쓰지 말고 10년 늙는다..
				</script>
			<%
		%>
	</body>
</html>