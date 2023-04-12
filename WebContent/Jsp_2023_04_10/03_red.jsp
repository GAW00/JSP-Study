<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body bgcolor="red">
		<center>
			<h3>[ jsp:forward 액션 태그에 대한 예제 ]</h3>
		</center>
		<hr>
		이 파일은 red.jsp 입니다.<br>
		웹 브라우저에 배경색이 빨간색으로 나타날까요?<br>
		노란색으로 나타날까요?<br>
		forward 액션 태그가 실행되면 이 페이지의 내용은 출력되지 않습니다.<br>
<!-- 		response.sendRedirect("URL")의 경우 도메인의 url 또는 jsp 파일명 또한 바뀌지만 -->
<%-- 		 <jsp:forward page="JSP"></jsp:forward> 액션 태그의 경우 바뀌지않고 기존을 유지한다 --%>
<%-- 		<jsp:forward page="03_yellow.jsp"></jsp:forward> --%>
		<jsp:forward page="https://www.google.com"></jsp:forward>
	</body>
</html>