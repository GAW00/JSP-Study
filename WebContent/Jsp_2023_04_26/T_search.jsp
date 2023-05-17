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
// 	전달받는 페이지 번호 저장
	String search = request.getParameter("search");
	String pageNum = request.getParameter("pageNum");

// 	전달받는 페이지 번호가 없는 경우 => 첫 페이지
	if(pageNum == null){
		pageNum = "1";
	}

	BoardDBBean manager = BoardDBBean.getInstance();
// 	ArrayList<BoardBean> board = manager.listBoard();
// 	pageNum = manager.searchTitle(search);
// 	String search_title = manager.searchTitle(search);
	ArrayList<BoardBean> board = manager.listBoard_s(search, pageNum);
	
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<center>
			<h1 align="center">검색한 글 목록 보기</h1>
			<form method="post" action="T_search.jsp">
				<table width="80%">
					<tr height="25">
						<td width="5%"></td>
	<!-- 					<td colspan="2" width="75%"></td> -->
						<td width="10%"></td>
						<td width="65%">
							<input type="text" name="search">  <input type="submit" value="검색">
						</td>
						<td width="20%">
		<!-- 					<a href="T_write.jsp">글 쓰 기</a> -->
							<a href="T_write.jsp?pageNum=<%= pageNum %>">글 쓰 기</a>
						</td>
					</tr>
				</table>
			</form>
			<table width="100%" border="2" cellspacing="0">
				<tr height="25">
					<th width="5%">번호</th>
					<th width="10%">첨부파일</th>
					<th width="55%">글제목</th>
					<th width="10%">작성자</th>
					<th width="15%">작성일</th>
					<th width="5%">조회수</th>
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
						int b_level = data.getB_level();
						int b_fsize = data.getB_fsize();
						
						%>
				
						<tr height="25" onmouseover="this.style.background = '#ccc'" onmouseout="this.style.background = 'white'">
							<td align="center">
								<%= b_id %>
							</td>
							<td>
								<%
									if(b_fsize > 0){
										%>
											<img alt="" src="../images/zip.gif">
										<%
									}
								%>
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
								<a href="T_show.jsp?index=<%= b_id %>&pageNum=<%= pageNum %>"><%= b_title %></a>
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
				<% if(board.size() == 0) %> <h3>검색 결과가 없습니다..</h3>
<!-- 			4 페이지씩 표시 -->
			<%= BoardBean.pageNumber(4) %>
		</center>
		<input type="button" value="글목록" onclick="location.href='T_list.jsp?pageNum=<%= pageNum %>'">
	</body>
</html>