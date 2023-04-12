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
		<%
			response.setIntHeader("Refresh", 5);
			Calendar cal = Calendar.getInstance();
			String ap;
			int h = cal.get(Calendar.HOUR);
			int m = cal.get(Calendar.MINUTE);
			int s = cal.get(Calendar.SECOND);
			if(cal.get(Calendar.AM_PM) == 0){	// 0일때 오전
				ap = "AM";
			}
			else{
				ap = "PM";
			}
		String CT = h + ":" + m + ":" + s + " " + ap;
		out.print("현재 시간은 " + CT + "\n");
		%>
		<br>
		<p><a href="T_response_data(6-2).jsp">Google 홈페이지로 이동하기</a></p>
	</body>
</html>