<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%
// 	응답이 정상적으로 된 상태로 설정
	response.setStatus(HttpServletResponse.SC_OK);
%>
에러 발생
<br>
<!-- 오류에 대한 기본 메세지 -->
<!-- isErrorPage="true"여야만 사용 가능 -->
<%= exception.getMessage() %>