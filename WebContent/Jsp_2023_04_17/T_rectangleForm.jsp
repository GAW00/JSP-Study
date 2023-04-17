<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Rectangle" id="rectangle"></jsp:useBean>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>사각형의 면적 출력하기</h4>
		<%
			out.print("가로 " + 20 + ", 세로 " + 30
						+ "인 사각형의 면적은 " + rectangle.process(20, 30));
		%>
	</body>
</html>