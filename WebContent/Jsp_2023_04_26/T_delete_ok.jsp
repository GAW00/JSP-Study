<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Object obj_getdata = session.getAttribute("index");
// 	String str_getdata = (String)obj_getdata;
// 	int index = Integer.parseInt(str_getdata);
	int index = (Integer)obj_getdata;
	String val = request.getParameter("validation");
	BoardDBBean manager = BoardDBBean.getInstance();
	
	if(manager.deleteBoard(index, val)){
		%>
			<script>
				alert("글이 삭제되었습니다!!");
				location.href="T_list.jsp";
			</script>
		<%
	}
	else{
		%>
			<script>
				alert("글 삭제에 실패했습니다..");
				history.back();
			</script>
		<%
	}
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		
	</body>
</html>