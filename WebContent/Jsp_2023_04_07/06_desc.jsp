<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<center>
			<h3>[선언부(declaration)에 대한 예제]</h3>
		</center>
		<hr>
		<%!
		String str = "안녕하세요!";
		int a = 5, b = -5;
		
		public int abs(int n){
			if(n < 0) return -n;
			return n;
		}
		%>
		<%
		out.println(str + "<br>");
		out.println(a + "의 절대값은 => " + abs(a) + "<br>");
		out.println(b + "의 절대값은 => " + abs(b) + "<br>");
		%>
	</body>
</html>