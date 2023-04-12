<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	
	for(int i = 0; i < cookies.length; i++){
		out.print(i + "번째 쿠키 " + cookies[i].getName() + " 삭제<br>");
		cookies[i].setMaxAge(0);
		cookies[i].setPath("/");
// 		삭제 정보를 추가
		response.addCookie(cookies[i]);
	}
%>