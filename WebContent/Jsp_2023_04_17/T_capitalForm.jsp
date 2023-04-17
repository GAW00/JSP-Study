<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Capital" id="capital"></jsp:useBean>
<jsp:setProperty property="cap" name="capital"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			try{
				out.print("입력된 알파벳 " + capital.getCap() + "에 관한 문자열은<br>"
						+ capital.process(capital.getCap()));
			} catch (Exception e){
				out.print("잘못된 문자입니다.<br>다시 입력해 주세요.<br>");
				%>
					<button onclick=history.back()>뒤로가기</button>
				<%
			}
		%>
	</body>
</html>