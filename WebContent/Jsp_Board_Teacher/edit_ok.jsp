<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
	//넘어오는 페이지 번호를 변수에 저장
	String pageNum = request.getParameter("pageNum");

// 	b_id, b_pwd 를 edit.jsp 에서 받는다.
// 	int b_id = Integer.parseInt(request.getParameter("b_id"));
// 	String b_pwd = request.getParameter("b_pwd");
	
	BoardDBBean db=BoardDBBean.getInstance();
// 	int re = db.deleteBoard(b_id, b_pwd);
	int re = db.editBoard(board);

	if(re == 1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else if(re == 0){
%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
<%
	}else if(re == -1){
%>
		<script>
			alert("수정에 실패하였습니다..");
			history.go(-1);
		</script>
<%
	}
%>




