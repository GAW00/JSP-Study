<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="T_loginOk.jsp">
			<center>
				<table border="1" align="center">
					<tr height="30">
						<td with="100" align="center">사용자 ID</td>
						<td with="100">
							<input type="text" name="id">
						</td>
					</tr>
					<tr height="30">
						<td with="100" align="center">비밀번호</td>
						<td with="100">
							<input type="password" name="pw">
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="로 그 인">
							<input type="button" value="회원가입" onclick="javascript:window.location='T_register.jsp'">
<!-- 						<button onclick="location.href='T_register.jsp'">회원가입</button> -->
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>