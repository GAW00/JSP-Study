<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDBBean manager = BoardDBBean.getInstance();
	ArrayList<BoardBean> board = manager.listBoard();
	
	int b_level = 0;
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h1 align="center">게시판에 등록된 글 목록 보기</h1>
		<table width="80%">
			<tr height="25">
				<td width="5%"></td>
				<td colspan="2" width="75%"></td>
				<td width="20%">
					<a href="T_write.jsp">글 쓰 기</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="2" cellspacing="0">
			<tr height="25">
				<th width="5%">번호</th>
				<th width="55%">글제목</th>
				<th width="15%">작성자</th>
				<th width="15%">작성일</th>
				<th width="10%">조회수</th>
			</tr>
			<%
				for(int i = 0; i < board.size(); i++){
					BoardBean data = board.get(i);
					int b_id = data.getB_id();
					String b_title = data.getB_title();
					String b_name = data.getB_name();
					String b_email = data.getB_email();
					String b_date = data.getB_date2();
					int b_hit = data.getB_hit();
					b_level = data.getB_level();
					
					%>
			
					<tr height="25" onmouseover="this.style.background = '#ccc'" onmouseout="this.style.background = 'white'">
						<td align="center">
							<%= b_id %>
						</td>
						<td>
							<%
// 								b_level 기준으로 댓글용 화살표 이미지를 들여쓰기로 출력
								if(b_level > 0) { // 답변글
									for(int j = 0; j < b_level; j++){ // b_level 기준으로 들여쓰기의 길이를 결정
										%>
											&nbsp;
										<%
									}
	// 								들여쓰기 적용된 후 => 이미지 추가
									%>
										<img src="../images/AnswerLine.gif" width="16" height="16">
									<%
								}
							%>
							<a href="T_show.jsp?index=<%= b_id %>"><%= b_title %></a>
						</td>
						<td align="center">
							<a href="mailto: <%= b_email %>"><%= b_name %></a>
						</td>
						<td align="center">
							<%= b_date %>
						</td>
						<td align="center">
							<%= b_hit %>
						</td>
					</tr>
					<%
				}
			%>
		</table>
	</body>
</html>