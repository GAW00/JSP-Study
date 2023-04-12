<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String s_id = "admin";
	String s_pw = "admin1234";
%>
<%
	if(s_id.equals(request.getParameter("id")) &&
	   s_pw.equals(request.getParameter("pw"))){
		out.print("전송된 요청 파라미터 : ");
		out.print("id=" + s_id + "&password=" + s_pw);
	}
	
%>