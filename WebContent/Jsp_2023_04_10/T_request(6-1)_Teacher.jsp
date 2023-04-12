<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
<!-- 		1)) get 방식으로 쿼리 스트링 가져오기 -->
<!-- 		<form method="get" action="T_request_process(6-1)_Teacher.jsp"> -->
<!-- 		2)) post 방식으로 쿼리 스트링 가져오기 -->
		<form method="post" action="T_request_process(6-1)_Teacher.jsp">
			<p>
				아 이 디 : <input type="text" name="id"  size=20 maxlength=20>
			</p>
			<p>
				비밀번호 : <input type="password" name="pw"  size=20 maxlength=20> 
			</p>
			<p>
				<input type="submit" value="전송">
			</p>
		</form>
	</body>
</html>