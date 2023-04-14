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
		<%!
		public String calDate(){
			Calendar calendar = Calendar.getInstance();
			
			calendar.add(Calendar.YEAR, -1);
			calendar.add(Calendar.MONTH, -2);
			calendar.add(Calendar.DATE, -3);
			
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH) + 1;
			int days = calendar.get(Calendar.DATE);
			
			return year + "-" + month + "-" + days;
		}
		%>
		오늘부터 1년 2달 3일전 날짜 = <%= calDate() %>
	</body>
</html>