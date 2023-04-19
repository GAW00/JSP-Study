<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Money" id="mny"></jsp:useBean>
<jsp:setProperty property="money" name="mny"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			int[] unit = mny.process(mny.getMoney());
			out.print("입력된 금액 " + mny.getMoney() + "는<br>"
					+ "50000원 짜리 : " + unit[0] + "개<br>"
					+ "10000원 짜리 : " + unit[1] + "개<br>"
					+ "1000원 짜리 : " + unit[2] + "개<br>"
					+ "100원 짜리 : " + unit[3] + "개<br>"
					+ "10원 짜리 : " + unit[4] + "개<br>"
					+ "1원 짜리 : " + unit[5] + "개<br>");
		%>
	</body>
</html>