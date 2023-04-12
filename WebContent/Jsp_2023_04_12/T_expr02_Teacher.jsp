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
			
			return cal.get(Calendar.YEAR) + "-"
				 + (cal.get(Calendar.MONTH) + 2) + "-"	// cal.get한 값은 String이니까, cal.month에서 1월 = 0
				 + cal.get(Calendar.DATE);
		}
		%>
		다음달 = <%= calDate()
		%>
	</body>
</html>