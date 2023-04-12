<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
<!-- 	이건 액션 태그 -->
<%-- 		<jsp:include page="T_h01.jsp"></jsp:include> --%>
		<%@ include file="T_h01.jsp" %>
		<br><hr>
		<%
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int days = cal.get(Calendar.DATE) + 1;
		
		out.println(year + "-" + month + "-" + days);
		%>
		<br>
		<%
		out.println(cal.get(Calendar.YEAR) + "-"
				 + (cal.get(Calendar.MONTH) + 1) + "-"
				 + (cal.get(Calendar.DATE) + 1));
		%>
		
	</body>
</html>