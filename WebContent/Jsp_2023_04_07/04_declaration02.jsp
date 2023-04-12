<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%!
			int sum(int a, int b){
				return a + b;
			}
		%>
		<%
// 			스크립트 릿은 메소드 선언 안됨!(변수는 됨)
// 			int sum2(int a, int b){
// 				return a + b + 5;
// 			}
			out.println("2 + 3 = " + sum(2, 3));
		%>
	</body>
</html>