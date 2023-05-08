<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int index = Integer.parseInt(request.getParameter("index"));
	BoardDBBean manager = BoardDBBean.getInstance();
	BoardBean board = manager.getBoard(index, true);
// 	session.setAttribute("index", index);
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h1 align="center">글 내 용 보 기</h1>
		<center>
			<center>
				<table name="show_frm" width="80%" border="2" cellspacing="0">
					<tr height="30">
						<th width="20%">글번호</th>
						<th width="30%"><%= index %></th>
						<th width="20%">조회수</th>
						<th width="30%"><%= board.getB_hit() %></th>
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
							<%= board.getB_date2() %>
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
					<tr>
						<td colspan="4" align="right">
							<input type="button" value="글수정" onclick="location.href='T_edit.jsp?index=<%= index %>'">&nbsp&nbsp&nbsp
							<input type="button" value="글삭제" onclick="location.href='T_delete.jsp?index=<%= index %>'">&nbsp&nbsp&nbsp
							<input type="button" value="답변글" onclick="location.href='T_write.jsp?p_index=<%= index %>'">&nbsp&nbsp&nbsp
							<input type="button" value="글목록" onclick="location.href='T_list.jsp'">
						</td>
					</tr>
				</table>
			</center>
		</center>
	</body>
</html>