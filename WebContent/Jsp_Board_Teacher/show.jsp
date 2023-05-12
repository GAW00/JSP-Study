<%@page import="java.text.SimpleDateFormat"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//넘어오는 페이지 번호를 변수에 저장
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	int bid = Integer.parseInt(request.getParameter("b_id"));
	
	BoardDBBean db=BoardDBBean.getInstance();
// 	board 객체에 게시글의 정보가 저장되어 있음
	BoardBean board = db.getBoard(bid, true);//조회수 증가로 true 추가
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="1" width="600" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">글번호</td>
				<td width="200">
<%-- 					<%= bid %> --%>
					<%= board.getB_id() %>
				</td>
				<td width="100">조회수</td>
				<td width="200">
					<%= board.getB_hit() %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">작성자</td>
				<td width="200">
					<%= board.getB_name() %>
				</td>
				<td width="100">작성일</td>
				<td width="200">
<%-- 					<%= board.getB_date() %> --%>
					<%= sdf.format(board.getB_date()) %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="110">파&nbsp;&nbsp;일</td>
				<td colspan="3">
					&nbsp;
					<%
						if(board.getB_fname() != null){
					%>
							<img src="./images/zip.gif">
							<a href="./upload/<%= board.getB_fname() %>">
								원본파일 : <%= board.getB_fname() %>
							</a>
					<%
						}
					%>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">글제목</td>
				<td width="200" align="left">
					<%= board.getB_title() %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">글내용</td>
				<td width="200" align="left">
					<%= board.getB_content() %>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="글수정" onclick="location.href='edit.jsp?b_id=<%= board.getB_id() %>&pageNum=<%= pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글삭제" onclick="location.href='delete.jsp?b_id=<%= board.getB_id() %>&pageNum=<%= pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="답변글" onclick="location.href='write.jsp?b_id=<%= board.getB_id() %>&pageNum=<%= pageNum %>'">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>
















