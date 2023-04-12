<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="T_request_process(6-1).jsp">
			<table>
				<tr>
					<td align="right">아 이 디 : </td>
					<td align="left">
						<input type="text" name="id"  size=20 maxlength=20>
					</td>
				</tr>
				<tr>
					<td align="right">비밀번호 : </td>
					<td align="left">
						<input type="password" name="pw"  size=20 maxlength=20>
					</td>
				</tr>
				<tr>
					<td align="right">
						<input type="submit" value="전송">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>