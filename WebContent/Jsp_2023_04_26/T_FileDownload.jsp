<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bid = Integer.parseInt(request.getParameter("fileN"));
	BoardDBBean manager =  BoardDBBean.getInstance();
	BoardBean board = manager.getFileName(bid);
	
	String fileName = "";
	String realFileName = "";
	
	// 첨부파일 있으면 참
	if(board != null){
		fileName = board.getB_fname();
		realFileName = board.getB_rfname();
	}
	
	// 실제 업로드된 경로
	String saveDirectory = application.getRealPath("/upload");
	// File.separator() : 디렉토리명과 파일명을 연결하는 구분자(운영체제별로 상이할수 있음)
 	// fileName : 넘버링 처리된 파일명
	String path = saveDirectory + File.separator + fileName;
	
	// file : 다운로드 대상 파일
	File file = new File(path);
	long length = file.length();
	// jsp 기본 한글 처리
	realFileName = new String(realFileName.getBytes("ms949"), "8859_1");
	
	// response 객체에 필요한 내용들을 담아서 전송
	// octet-stream : 기본 Content Type
	response.setContentType("application/octet-stream");
	response.setContentLength((int)length);
	// Content-Disposition : 브라우저에 실제 파일명 컨텐츠가 있음을 알림
	response.setHeader("Content-Disposition", "attachment;filename=" + realFileName);
	
	// 파일 다운로드할때 버퍼를 사용
	BufferedInputStream bis =  new BufferedInputStream(new FileInputStream(file));
	
	// 기존 파일이 남아 있는 경우 초기화
	out.clear();
	// 다운로드 준비
	out = pageContext.pushBody();
	
	// 다운로드로 파일을 내보낼때 사용
	BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
	
// 	------------------
// 	bis로 읽어서 bos에 쓰기
// 	------------------

	int data;
	while((data = bis.read()) != -1){
		bos.write(data);
	}
	
	bis.close();
	bos.close();
%>