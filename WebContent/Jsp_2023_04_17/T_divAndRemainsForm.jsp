<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.DivAndRemains" id="dr"></jsp:useBean>    
<jsp:setProperty property="n" name="dr"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>당신이 입력한 정보입니다</h4>
		<p>
			<%
				out.print("입력된 정수 " + dr.getN() + "은 10의 자리와 1의 자리가 "
						  + dr.process(dr.getN()));
			%>
		</p>
	</body>
</html>