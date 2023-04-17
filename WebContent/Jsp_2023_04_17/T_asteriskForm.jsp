<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Asterisk" id="ast"></jsp:useBean>
<jsp:setProperty property="n" name="ast"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>입력된 정수 <%= ast.getN() %>는</h4><br>
		<%
			out.print(ast.process(ast.getN()));
		%>
	</body>
</html>