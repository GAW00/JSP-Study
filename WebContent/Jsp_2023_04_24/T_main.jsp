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
			if(session.getAttribute("Member") == null){
				%>
					<jsp:forward page="T_login.jsp"></jsp:forward>
				<%
			}
		%>
		<%
// 			sission : jsp 내장 객체, 객체의 getAttribute 메소드로 세션이름으로 값을 가져옴
// 			다운캐스팅 Object -> String
			String userid = (String)session.getAttribute("id");
			String username = (String)session.getAttribute("name");
		%>
		<form method="post" action="T_memberUpdate.jsp" name="main_frm">
			<table border="1">
				<tr>
					<td>
						안녕하세요. <%= username %>(<%= userid %>)님!
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="로그아웃" onclick="javascript:window.location='T_logOut.jsp'">
						<input type="submit" value="회원정보변경">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>