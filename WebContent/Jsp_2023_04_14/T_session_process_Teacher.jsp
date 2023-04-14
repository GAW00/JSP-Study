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
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if(id.equals("admin") && pw.equals("admin1234")){
				session.setAttribute("userID", id);
				response.sendRedirect("T_session_welcome_Teacher.jsp");
			}
			else{
				out.print("아이디와 비밀번호를 입력하세요.");	
			}
		%>
	</body>
</html>