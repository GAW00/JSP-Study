<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.ThreeSixNIne" id="tsn"></jsp:useBean>
<jsp:setProperty property="n" name="tsn"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>당신이 입력한 정보입니다.</h4>
		<%
			out.print("입력된 정수 " + tsn.getN() + " : " + tsn.process());
		%>
	</body>
</html>