<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 오류 발생시 보내는 페이지 -->
<!-- '03_error02.jsp' 파일 없으면 HTTP 상태 404 - 찾을 수 없음 -->
<%@ page errorPage="03_error02.jsp" %>
<%!
	String s_name;
	int age;
%>
<%
// 	요청들어오는 값을 UTF-8 인코딩으로 한글 처리
	request.setCharacterEncoding("utf-8");
	s_name = request.getParameter("name");
// 	request.getPArameter() : 반환 타입은 String
// 	한글이 넘어오면(스물) HTTP 상태 500 - 내부 서버 오류
	age = Integer.parseInt(request.getParameter("age"));
%>
<h3>회원 정보 출력</h3>
당신의 이름은 <%= s_name %> 입니다.<br>
당신의 나이는 <%= age %> 살 입니다.<br>