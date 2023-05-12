<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
// 	넘어오는 페이지 번호를 변수에 저장
// 	String pageNum = request.getParameter("pageNum");

// 	넘어오는 페이지 번호가 없으면 1페이지
// 	out.print("01");
// 	if(pageNum == null){
// 		out.print("02");
// 		pageNum = "1";
// 	}

	BoardDBBean db=BoardDBBean.getInstance();
// 	호출된 메소드의 반환 타입으로 받아주면 됨
// 	ArrayList<BoardBean> boardList = db.listBoard();
	ArrayList<BoardBean> boardList = db.listBoard(pageNum);
	int b_id=0, b_hit=0, b_level=0, b_fsize=0;
	String b_name, b_email, b_title, b_content;
// 	Timestamp b_date;
	String b_date;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>게시판에 등록된 글 목록 보기</h1>
		<table width="600">
			<tr>
				<td align="right">
<!-- 					<a href="write.jsp">글 쓰 기</a> -->
					<a href="write.jsp?pageNum=<%= pageNum %>">글 쓰 기</a>
				</td>
			</tr>
		</table>
	</center>
	<center>
		<table border="1" width="800" cellspacing="0">
			<tr height="25">
				<td width="40" align="center">번호</td>
				<td width="80" align="center">첨부파일</td>
				<td width="450" align="center">글제목</td>
				<td width="120" align="center">작성자</td>
				<td width="130" align="center">작성일</td>
				<td width="60" align="center">조회수</td>
			</tr>
			<%
	// 			boardList 에 있는 오라클 데이터를 가져옴
				for(int i=0; i<boardList.size(); i++){
	// 				ArrayList 데이터의 BoardBean 객체를 가져온다.
					BoardBean board = boardList.get(i);
	// 				board 객체에 있는 컬럼의 데이터를 가져온다.
					b_id = board.getB_id();
					b_name = board.getB_name();
					b_email = board.getB_email();
					b_title = board.getB_title();
					b_content = board.getB_content();
// 					b_date = board.getB_date();
					b_date = board.getB_date2();
					b_hit = board.getB_hit();
					b_level = board.getB_level();
					b_fsize = board.getB_fsize();
			%>
			<tr bgcolor="#f7f7f7"
				onmouseover="this.style.backgroundColor='#eeeeef'"
				onmouseout="this.style.backgroundColor='#f7f7f7'">
	<!-- 			표현식으로 컬럼의 데이터를 출력 -->
				<td align="center"><%= b_id %></td>
				<td>
					<%
						if(b_fsize > 0){
					%>
							<img src="./images/zip.gif">
					<%
						}
					%>
				</td>
				<td>
					<%
// 						b_level 기준으로 화살표 이미지를 들여쓰기로 출력
						if(b_level > 0){//답변글
							for(int j=0; j<b_level; j++){//for 기준으로 들여쓰기를 얼마만큼 할것인지 정함
					%>
								&nbsp;
					<%
							}
// 							들여쓰기가 적용된 시점->이미지 추가
					%>
							<img src="./images/AnswerLine.gif" width="16" height="16">
					<%
						}
					%>
<!-- 					글번호를 가지고 글내용 보기 페이지로 이동 -->
<%-- 					<a href="show.jsp?b_id=<%= b_id %>"> --%>
					<a href="show.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>">
						<%= b_title %>
					</a>
				</td>
				<td align="center">
					<a href="mailto:<%= b_email %>">
						<%= b_name %>
					</a>
				</td>
				<td align="center">
					<%= b_date %>
<%-- 					<%= sdf.format(b_date) %> --%>
				</td>
				<td align="center">
					<%= b_hit %>
				</td>
			</tr>
			<%
				}
			%>
		</table>
<!-- 		페이지 표시 4개씩 -->
		<%= BoardBean.pageNumber(4) %>
	</center>
</body>
</html>














