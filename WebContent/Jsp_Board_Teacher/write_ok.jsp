<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean class="magic.board.BoardBean" id="board"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<%
// 	out.print("@# getB_name 01 ===>"+board.getB_name());
	String test1 = board.getB_name();

// 	파일업로드 처리
	SmartUpload upload=new SmartUpload();
	upload.initialize(pageContext);
	upload.upload();
	String fName="";
	int fileSize=0;
	
	File file = upload.getFiles().getFile(0);
	
	if(!file.isMissing()){
		fName = file.getFileName();
		file.saveAs("/upload/"+file.getFileName());
		fileSize = file.getSize();
	}
%>
<%
// 	자바 클래스 이용해서 ip 추가
	InetAddress address = InetAddress.getLocalHost();
// 	getHostAddress() : ip 주소 가져오는 메소드
	String ip = address.getHostAddress();

// 	ip 추가(0:0:0:0:0:0:0:1)
// 	board.setB_ip(request.getRemoteAddr());
	board.setB_ip(ip);//192.168.70.28
	
	//오늘날짜 추가
	board.setB_date(new Timestamp(System.currentTimeMillis()));
	
// 	out.print("@# getB_name 02 ===>"+board.getB_name());
	String test2 = board.getB_name();
	
// 	board.setB_title(test1);
// 	board.setB_content(test2);
// 	파일 업로드 처리
	board.setB_name(upload.getRequest().getParameter("b_name"));
	board.setB_email(upload.getRequest().getParameter("b_email"));
	board.setB_title(upload.getRequest().getParameter("b_title"));
	board.setB_content(upload.getRequest().getParameter("b_content"));
	board.setB_pwd(upload.getRequest().getParameter("b_pwd"));
	
	board.setB_fname(fName);
	board.setB_fsize(fileSize);

	BoardDBBean db=BoardDBBean.getInstance();
// 	db.insertBoard(board);

	if(db.insertBoard(board) == 1){//글쓰기가 정상적으로 완료시
		response.sendRedirect("list.jsp");
	}else{//글쓰기가 실패시
		response.sendRedirect("write.jsp");
	}
%>















