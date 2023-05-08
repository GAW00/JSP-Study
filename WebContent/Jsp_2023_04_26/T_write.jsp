<%@page import="magic.board.BoardDBBean"%>
<%@page import="magic.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int b_id = 0, b_ref = 1, b_step = 0, b_level = 0;
	String b_title="";
	if(request.getParameter("p_index") != null){	// 답변글 : T_show.jsp에서 답변글 누를 시
		b_id = Integer.parseInt(request.getParameter("p_index"));
	}
	
	BoardDBBean manager = BoardDBBean.getInstance();
	BoardBean board = manager.getBoard(b_id, false);
	
	if(board != null){ // 답변글
// 		DB에 insert 하기 위한 로직
		b_ref = board.getB_ref();
		b_step = board.getB_step();
		b_level = board.getB_level();
		b_title = board.getB_title();
	}
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script language="JavaScript" src="board.js"></script>
	</head>
	<body>
		<form method="post" name="board_frm" action="T_write_ok.jsp">
			<input type="hidden" name="b_id" value=<%= b_id %>>
			<input type="hidden" name="b_ref" value=<%= b_ref%>>
			<input type="hidden" name="b_step" value=<%= b_step %>>
			<input type="hidden" name="b_level" value=<%= b_level %>>
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
<!-- 						<input type="text" name="b_title" size="55" maxlength="80"> -->
						<%
// 							[답변]: 의 존재여부
							if(b_id == 0){ // 신규 글
								%>
		 							<input type="text" name="b_title" size="55" maxlength="80">
								<%
							}
							else{		   // 답변 글
								%>
		 							<input type="text" name="b_title" size="55" maxlength="80" value="[답변]: <%= b_title %>">
								<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea cols="70" rows="10" name="b_content"></textarea>
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
						<input type="button" value="글쓰기" onclick="check_ok()">&nbsp;
						<input type="reset" value="다시작성">&nbsp;
						<input type="button" value="글목록" onclick="location.href='T_list.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>