<%@page import="java.io.File"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전달받는 페이지 번호 저장
	String pageNum = request.getParameter("pageNum");
// 	Object obj_getdata = session.getAttribute("index");
// 	int index = (Integer)obj_getdata;
	int index = Integer.parseInt(request.getParameter("index"));
	String val = request.getParameter("validation");
	BoardDBBean manager = BoardDBBean.getInstance();
	
	// 파일 업로드 삭제를 위한 처리
	BoardBean board = manager.getBoard(index, false);
	String fName = board.getB_fname();
	String up = "D:\\Dev\\java_works\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\jspwork_230217\\upload\\";
	
	if(manager.deleteBoard(index, val)){
		%>
			<script>
// 				alert("글이 삭제되었습니다!!");
// 				location.href="T_list.jsp?pageNum=" + pageNum;
				
				<%
					if(fName != null){
						File file = new File(up + fName);
						file.delete();
					}
					response.sendRedirect("T_list.jsp?pageNum=" + pageNum);
				%>
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