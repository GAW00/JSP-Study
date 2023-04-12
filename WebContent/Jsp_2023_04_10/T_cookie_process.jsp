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
			String user_id = request.getParameter("id");
			String user_pw = request.getParameter("passwd");
			
			if(user_id.equals("admin") && user_pw.equals("admin1234")){
				Cookie cookie_id = new Cookie("userID", user_id);
				cookie_id.setMaxAge(60 * 60);
				cookie_id.setPath("/");
				response.addCookie(cookie_id);
				response.sendRedirect("T_cookie_welcome.jsp");
			}
			else{
				out.print("아이디와 비밀번호를 확인해 주세요.");
			}
		%>
	</body>
</html>