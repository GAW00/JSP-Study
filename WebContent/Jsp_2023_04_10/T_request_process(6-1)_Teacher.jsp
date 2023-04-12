<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
// 		1)) get 방식으로 쿼리스트링 가져와 출력하기
// 			String value = request.getQueryString();
// 			out.print("전송된 요청 파라미터 : " + value);

			
// 		2)) post 방식으로 쿼리스트링 가져와 출력하기
			int length = request.getContentLength(); // 요청정보의 body 안에 들어있는 내용의 길이 값 추출
			byte[] buffer = new byte[length];
			ServletInputStream input = request.getInputStream();
	
			input.readLine(buffer, 0, length);
			out.println(new String(buffer));
			
			out.close();
		%>
	</body>
</html>