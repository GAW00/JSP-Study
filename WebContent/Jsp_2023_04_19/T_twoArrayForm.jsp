<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.TwoArray" id="ta"></jsp:useBean>
<jsp:setProperty property="num" name="ta"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			out.print(ta.getNum() + " * " + ta.getNum() + " 은/는<br>"
					+ ta.process(ta.getNum()));
		%>
	</body>
</html>