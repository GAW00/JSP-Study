<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Arithmetic" id="arithmetic"></jsp:useBean>
<jsp:setProperty property="n1" name="arithmetic"/>
<jsp:setProperty property="n2" name="arithmetic"/>
<jsp:setProperty property="op" name="arithmetic"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<h4>당신이 입력한 정보입니다.</h4>	
		<%
			int n1 = arithmetic.getN1();
			int n2 = arithmetic.getN2();
			String op = arithmetic.getOp();
			out.print(n1 + "와/과 " + n2 + "의 " + op + "연산 결과는"
					  + arithmetic.process(n1, n2, op));
		%>
		<hr>
		<%
			out.print(n1 + "와/과 " + n2 + "의 " + op + "연산 결과는"
					  + arithmetic.process2(n1, n2, op));
		%>
	</body>
</html>