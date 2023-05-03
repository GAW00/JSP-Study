<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int index = Integer.parseInt(request.getParameter("index"));
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script language="JavaScript" src="board.js"></script>
	</head>
	<body>
		<center>
			<h1>글 삭 제 하 기</h1>
			<b>>> 암호를 입력하세요. <<</b>
			<form method="post" name="dlt_frm" action="T_delete_ok.jsp?index=<%= index %>">
				<table >
					<tr height="50">
						<td width="80">암 호</td>
						<td>
							<input type="password" name="validation" size="10" maxlength="12">
						</td>
					</tr>
					<tr height="50">
						<td colspan="2">
							<input type="button" value="글삭제" onclick="delete_ok()">
							<input type="reset" value="다시작성">
							<input type="button" value="글목록" onclick="location.href='T_list.jsp'">
						</td>
					</tr>
				</table>
			</form>
		</center>
	</body>
</html>