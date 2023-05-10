<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	is 객체 생성 : 2진 데이터로 받기 위해
	InputStream is = request.getInputStream();

// 	채팅 프로그램과 동일 방식
	BufferedReader br = new BufferedReader(new InputStreamReader(is));
	String str = null;
	
// 	readLine() : 문자열을 읽어오는 메소드
	while((str = br.readLine()) != null){
		%>
			<%= str %>
		<%
	}
%>