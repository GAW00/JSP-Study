<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
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
// 				날짜의 일에  + 1
				cal.add(Calendar.DATE, 1);

				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH) + 2;
				int days = cal.get(Calendar.DATE);
				
				return year + "-" + month + "-" + days;
			}
		
		%>
		내일 = <%= calDate() %>
	</body>
</html>