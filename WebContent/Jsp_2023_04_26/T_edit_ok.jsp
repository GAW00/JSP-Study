<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	int index = Integer.parseInt(request.getParameter("index"));
%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			BoardDBBean manager = BoardDBBean.getInstance();
			System.out.println("@@@ : " + index);
			System.out.println("@@@ : " + board.getB_name());
			System.out.println("@@@ : " + board.getB_email());
			System.out.println("@@@ : " + board.getB_title());
			System.out.println("@@@ : " + board.getB_content());
			System.out.println("@@@ : " + board.getB_pwd());
			
			if(manager.editBoard(index, board)){
				%>
					<script>
						alert("글 수정 성공!");
						document.location.href="T_list.jsp";
					</script>
				<%
			}
			else{
				%>
					<script>
							alert("글 수정 실패..");
							history.back();
					</script>
				<%
			}
		%>
	</body>
</html>