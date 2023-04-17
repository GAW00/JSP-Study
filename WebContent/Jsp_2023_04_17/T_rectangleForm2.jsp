<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Rectangle" id="rectangle"></jsp:useBean>
<jsp:setProperty property="width" name="rectangle"/>
<jsp:setProperty property="height" name="rectangle"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>사각형의 면적 출력하기</h4>
		<%
			out.print("가로 " + rectangle.getWidth() + ", 세로 " + rectangle.getHeight()
						+ "인 사각형의 면적은 " + rectangle.process(rectangle.getWidth(), rectangle.getHeight()));
		%>
	</body>
</html>