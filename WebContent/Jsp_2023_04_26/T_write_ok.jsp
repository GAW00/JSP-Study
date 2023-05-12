<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
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
<%
	/*
	//파일 업로드 처리
	SmartUpload upload = new SmartUpload();
	upload.initialize(pageContext);
	upload.upload();
	String fName = "";
	int fileSize = 0;
	
	File file = upload.getFiles().getFile(0);
	
	if(!file.isMissing()){
		fName = file.getFileName();
		file.saveAs("/upload/" + file.getFileName());
		fileSize = file.getSize();
		
// 		System.out.println("!! : " + fName);
// 		System.out.println("!! : " + fileSize);
	}
	*/
	String path = request.getRealPath("upload");
	int size = 1024 * 1024; // 1 Mbyte(크기 제한)
	int fileSize = 0;
	String file = "";
	String orifile = "";
	
// 	DefaultFileRenamePolicy : 파일명 넘버링 처리
	MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
// 	파일명 가져오기
	Enumeration files = multi.getFileNames();
	String str = files.nextElement().toString();
// 	file : 넘버링 처리된 파일명
	file = multi.getFilesystemName(str);
	
	if(file != null){
// 		orifile : 실제 파일명
		orifile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			BoardDBBean manager = BoardDBBean.getInstance();
		
			// 오늘 날짜 추가
			board.setB_date(new Timestamp(System.currentTimeMillis()));
			
			// ip주소 추가
			InetAddress address = InetAddress.getLocalHost();
			String ip = address.getHostAddress();
			board.setB_ip(ip);
			
			// 파일 업로드 처리!!
// 			board.setB_id(Integer.parseInt(upload.getRequest().getParameter("b_id")));
// 			board.setB_name(upload.getRequest().getParameter("b_name"));
// 			board.setB_email(upload.getRequest().getParameter("b_email"));
// 			board.setB_title(upload.getRequest().getParameter("b_title"));
// 			board.setB_content(upload.getRequest().getParameter("b_content"));
// 			board.setB_pwd(upload.getRequest().getParameter("b_pwd"));
			
// 			board.setB_ref(Integer.parseInt(upload.getRequest().getParameter("b_ref")));
// 			board.setB_step(Integer.parseInt(upload.getRequest().getParameter("b_step")));
// 			board.setB_level(Integer.parseInt(upload.getRequest().getParameter("b_level")));
			
			board.setB_id(Integer.parseInt(multi.getParameter("b_id")));
			board.setB_name(multi.getParameter("b_name"));
			board.setB_email(multi.getParameter("b_email"));
			board.setB_title(multi.getParameter("b_title"));
			board.setB_content(multi.getParameter("b_content"));
			board.setB_pwd(multi.getParameter("b_pwd"));
			
			board.setB_ref(Integer.parseInt(multi.getParameter("b_ref")));
			board.setB_step(Integer.parseInt(multi.getParameter("b_step")));
			board.setB_level(Integer.parseInt(multi.getParameter("b_level")));
			
// 			board.setB_fname(fName);
// 			board.setB_fsize(fileSize);
			
			if(file != null){
				board.setB_fname(file);
				board.setB_fsize(fileSize);
				board.setB_rfname(orifile);
			}
			
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