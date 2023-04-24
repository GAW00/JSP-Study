<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script language="JavaScript" src="script2.js"></script>
	</head>
	<body>
	<%
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
	%>
		<form method="post" name="upd_frm" action="">
			<table border="1" align="center">
				<tr height="50">
					<td colspan="2" align="center">
						<h1>회원 정보 수정</h1>
						'*' 표시 항목은 필수 입력 항목입니다.
					</td>
				</tr>
				<tr height="30">
					<td width="80">User ID</td>
					<td>
						<%= id %>
					</td>
				</tr>
				<tr height="30">
					<td width="80">암 호</td>
					<td>
						<input type="password" name="mem_pwd" size="20">*
					</td>
				</tr>
				<tr height="30">
					<td width="80">암호확인</td>
					<td>
						<input type="password" name="pwd_check" size="20">*
					</td>
				</tr>
				<tr height="30">
					<td width="80">이 름</td>
					<td>
						<%= name %>
					</td>
				</tr>
				<tr height="30">
					<td width="80">E-mail</td>
					<td>
						<input type="text" name="mem_email" size="30">*
					</td>
				</tr>
				<tr height="30">
					<td width="80">주 소</td>
					<td>
						<input type="text" name="mem_addr" size="40">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정" onclick="update_check_ok()">
						<input type="reset" value="다시입력">
						<input type="button" value="수정안함" onclick="location.href='T_login.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>