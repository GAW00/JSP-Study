<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int index = Integer.parseInt(request.getParameter("index"));
	BoardDBBean manager = BoardDBBean.getInstance();
	BoardBean board = manager.getBoard(index);
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h1 align="center">게시판에 등록된 글 목록 보기</h1>
		<center>
			<table width="80%" border="2" cellspacing="0">
				<tr height="30">
					<th width="20%">글번호</th>
					<th width="30%"><%= index %></th>
					<th colspan="2"></th>
				</tr>
				<tr height="30">
					<th align="center">
						작성자		
					</th>
					<td align="center">
						<%= board.getB_name() %>
					</td>
					<td width="20%" align="center" >
						작성일
					</td>
					<td width="30%" align="center">
						<%= board.getB_date() %>
					</td>
				</tr>
				<tr height="30">
					<th align="center">
						글제목
					</th>
					<td colspan="3">
						<%= board.getB_title() %>
					</td>
				</tr>
				<tr height="30">
					<th align="center">
						글내용
					</th>
					<td colspan="3">
						<%= board.getB_content() %>
					</td>
				</tr>
			</table>
		</center>
	</body>
</html>