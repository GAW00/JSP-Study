<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<style>
		td{
			text-align: center;
		}
	</style>
	<body>
		<form method="post" action="T_register.jsp">
			<center>
				<table border="1">
					<tr>
						<td text>사용자 ID</td>
						<td>
							<input type="text" name="id">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" name="pw">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로 그 인">
							<button onclick="location.href='T_register.jsp'">회원가입</button>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>