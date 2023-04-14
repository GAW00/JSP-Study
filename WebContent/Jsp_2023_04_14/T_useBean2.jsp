<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="area.Circle" id="circle"></jsp:useBean>
<jsp:setProperty property="radius" name="circle"/>

<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>원의 면적 출력하기</h4>
		<h5>
			반지름이 
			<jsp:getProperty property="radius" name="circle"/>
			인 원의 면적은 
			<%
				out.print(circle.process());
			%>			
		</h5>
	</body>
</html>