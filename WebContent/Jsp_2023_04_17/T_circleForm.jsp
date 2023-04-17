<%@page import="area.Circle2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int r = Integer.parseInt(request.getParameter("radius"));
	Circle2 circle = new Circle2();
	circle.setRadius(r);
%>
<h2>당신이 입력한 정보입니다.</h2>
<p>반지름이 <%= r %>인 원의 면적은 <%= circle.process() %></p>