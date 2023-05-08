<%@page import="java.net.UnknownHostException"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<!-- 답글인 경우 board에는 작성한 답글의 자동글번호, 작성자, 이메일, 제목, 내용, 날짜(아래서 추가)
, 조회수, 비번, ip(아래서 추가), 부모의 ref, 부모의 step, 부모의 level 들어있음 -->
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			BoardDBBean manager = BoardDBBean.getInstance();
			board.setB_date(new Timestamp(System.currentTimeMillis()));
			
			InetAddress address = InetAddress.getLocalHost();
			String ip = address.getHostAddress();
			board.setB_ip(ip);
			
// 			1)
// 			board.setB_ip(request.getRemoteAddr());
			
// 			2)
// 			InetAddress local = null;
// 			try {
// 				local = InetAddress.getLocalHost();
// 			}
// 			catch ( UnknownHostException e ) {
// 				e.printStackTrace();
// 			}
				
// 			if( local == null ) {
// 				board.setB_ip("");
// 			}
// 			else {
// 				String ip = local.getHostAddress();
// 				board.setB_ip(ip);
// 			}

// 			System.out.println("** : " + request.getParameter("b_ref"));
// 			System.out.println("** : " + request.getParameter("b_step"));
// 			System.out.println("** : " + request.getParameter("b_level"));

// 			System.out.println("&& : " + board.getB_ref());
// 			System.out.println("&& : " + board.getB_step());
// 			System.out.println("&& : " + board.getB_level());
			
			int re = manager.insertBoard(board);
			if(re == 1){
		%>
					<script>
						alert("글이 등록되었습니다!\n게시판에서 확인해 주세요!");
						document.location.href="T_list.jsp";
					</script>
				<%
			}
			else{
				%>
					<script>
						alert("글 등록에 실패했습니다..");
						document.location.href="T_write.jsp";
					</script>
				<%
			}
		%>
	</body>
</html>