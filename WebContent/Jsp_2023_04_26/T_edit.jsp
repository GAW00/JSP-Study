<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	전달받는 페이지 번호 저장
	String pageNum = request.getParameter("pageNum");

	int index = Integer.parseInt(request.getParameter("index"));
	BoardDBBean manager = BoardDBBean.getInstance();
	BoardBean board = manager.getBoard(index, false);
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script language="JavaScript" src="board.js"></script>
	</head>
	<body>
		<form method="post" name="board_frm" action="T_edit_ok.jsp?index=<%= index %>&pageNum=<%= pageNum %>">
			<table align="center">
				<tr height="50">
					<td colspan="4" align="center">
						<h1>글 수 정 하 기</h1>
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						작성자
					</td>
					<td width="140">
						<input type="text" name="b_name" size="10" maxlength="20" value="<%= board.getB_name() %>">
					</td>
					<td width="80">
						이메일
					</td>
					<td width="240">
						<input type="text" name="b_email" size="24" maxlength="50" value="<%= board.getB_email() %>">
					</td>
				</tr>
				<tr height="30">
					<td width="80">
						글제목
					</td>
					<td colspan="3" width="460">
						<input type="text" name="b_title" size="55" maxlength="80" value="<%= board.getB_title() %>">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="70" rows="10" name="b_content" ><%= board.getB_content() %></textarea>
					</td>
				</tr>
				<tr>
					<td>
						암 호
					</td>
					<td>
						<input type="password" name="b_pwd" size="10" maxlength="12">
					</td>
				</tr>
				<tr height="50" align="center">
					<td colspan="4">
						<input type="button" value="글수정" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='T_list.jsp?pageNum=<%= pageNum %>'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>