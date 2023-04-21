<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<style>
		table{
			width: 450px;
		}
		#cen{
			text-align: center;
		}
	</style>
	<script language="JavaScript" src="script.js" charset="utf-8"></script>
	<body>
		<form method="post" name="form" action="">
			<table border="1">
				<tr>
					<td colspan="2" id="cen">
						<h1>회원 가입 신청</h1><br>
						'*' 표시 항목은 필수 입력 항목입니다.
					</td>
				</tr>
				<tr>
					<td>User ID</td>
					<td>
						<input type="text" name="id">*
					</td>
				</tr>
				<tr>
					<td>암 호</td>
					<td>
						<input type="password" name="pw">*
					</td>
				</tr>
				<tr>
					<td>암호 확인</td>
					<td>
						<input type="password" name="pw_check">*
					</td>
				</tr>
				<tr>
					<td>이 름</td>
					<td>
						<input type="text" name="name">*
					</td>
				</tr>
				<tr>
					<td>E-mail</td>
					<td>
						<input type="text" name="email" size="30">*
					</td>
				</tr>
				<tr>
					<td>주 소</td>
					<td>
						<input type="text" name="address" size="40">
					</td>
				</tr>
				<tr>
					<td colspan="2" id="cen">
						<input type="submit" value="등록" onclick="form_check()">&nbsp&nbsp
<!-- 						<button onclick="form_check()">등록</button> -->
						<input type="reset" value="다시입력">&nbsp&nbsp
						<button type="button" onclick="location.href='T_login.jsp'">가입안함</button>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>