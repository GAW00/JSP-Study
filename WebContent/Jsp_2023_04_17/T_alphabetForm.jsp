<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="question.Alphabet" id="alphabet"></jsp:useBean>
<jsp:setProperty property="alphabet" name="alphabet"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			try{
				out.print("입력된 알파벳은 " + alphabet.getAlphabet()
						+ "이고 연결된 문자열은 " + alphabet.process(alphabet.getAlphabet()));
			} catch (Exception e){
				out.print("잘못된 문자 입니다.<br>다시 입력해주세요<br>");
				%>
					<button onclick="history.back()">뒤로가기</button>
				<%
			}
		%>
	</body>
</html>