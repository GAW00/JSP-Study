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
				<td width="75%"></td>
				<td width="20%">
					<a href="T_write.jsp">글 쓰 기</a>
				</td>
			</tr>
		</table>
		<table width="100%" border="2" cellspacing="0">
			<tr height="25">
				<th width="5%">번호</th>
				<th width="55%">글제목</th>
				<th width="20%">작성자</th>
				<th width="20%">작성일</th>
			</tr>
			<%
				Iterator<BoardBean> iterator = board.iterator();
				while(iterator.hasNext()){
// 				for(int i = 0; i < board.size(); i++){
					BoardBean tmp = iterator.next();
					%>
						<tr height="25" onmouseover="this.style.background = '#ccc'" onmouseout="this.style.background = 'white'">
							<td align="center">
								<%= tmp.getB_id() %>
							</td>
							<td>
								<a href="T_show.jsp?index=<%= tmp.getB_id() %>"><%= tmp.getB_title() %></a>
							</td>
							<td align="center">
								<a href="mailto: <%= tmp.getB_email() %>"><%= tmp.getB_name() %></a>
							</td>
							<td>
								<%= tmp.getB_date() %>
							</td>
						</tr>
					<%
				}
			%>
		</table>
	</body>
</html>