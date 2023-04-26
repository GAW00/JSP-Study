<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script language="JavaScript" src="board.js"></script>
	</head>
	<body>
		<form method="post" name="board_frm" action="T_write_ok.jsp">
			<table align="center">
				<tr height="50">
					<td colspan="4" align="center">
						<h1>글 올 리 기</h1>
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input type="text" name="b_name" size="10" maxlength="20">
					</td>
					<td width="80">
						이메일
					</td>
					<td width="240">
						<input type="text" name="b_email" size="24" maxlength="50">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						글제목
					</td>
					<td colspan="3" width="460">
						<input type="text" name="b_title" size="55" maxlength="80">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="70" rows="10" name="b_content"></textarea>
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>