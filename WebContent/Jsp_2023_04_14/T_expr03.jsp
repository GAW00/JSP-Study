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
			Calendar cal = Calendar.getInstance();
			
			return (cal.get(Calendar.YEAR) - 1) + "-"
					+ (cal.get(Calendar.MONTH)+ 1 - 2) +  "-"
					+ (cal.get(Calendar.DATE) - 3);
		}
		%>
		오늘부터 1년 2달 3일전 날짜 = <%= calDate() %>
	</body>
</html>