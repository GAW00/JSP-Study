<%@page import="magic.member.MemberBean"%>
<%@page import="magic.member.MemberDBBean"%>
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
			
			MemberDBBean manager = MemberDBBean.getInstance();
			int check = manager.userCheck(id, pw);
			MemberBean mb = manager.getMember(id);
			
			if(mb == null){
				%>
					<script>
						alert("존재하지 않는 회원입니다.");
						history.go(-1);
					</script>
				<%
			}
			else{
				String name = mb.getMem_name();
				if(check == 1){
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					session.setAttribute("Member", "yes");
					response.sendRedirect("T_main.jsp");
				}
				else if(check == 0){
					%>
						<script>
							alert("비밀번호가 맞지 않습니다.")
							history.go(-1);
						</script>
					<%
					System.out.println("check = 0");
				}
				else{
					System.out.println("hi");
					%>
						<script>
							alert("아이디가 맞지 않습니다.")
							history.go(-1);
						</script>
					<%
					System.out.println("check = -1");
				}
			}
			
		%>
	</body>
</html>