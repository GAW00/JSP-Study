<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Array3" id="a3"></jsp:useBean>
<jsp:setProperty property="num" name="a3"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			out.print("입력된 정수의 개수는 " + a3.getNum() + "는<br>"
					+ a3.process(a3.getNum()));
		%>
	</body>
</html>