<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.member.MemberBean" id="mb"></jsp:useBean>
<!-- 폼 양식에서 전달되는 파라미터 값 얻어와서 -->
<!-- mb 객체의 프로퍼티 값으로 저장 -->
<jsp:setProperty property="*" name="mb"/>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			MemberDBBean manager = MemberDBBean.getInstance();
// 			<jsp:setProperty > 를 통해 완료
// 			mb.setMem_uid(request.getParameter("mem_uid"));
// 			mb.setMem_pwd(request.getParameter("mem_pwd"));
// 			mb.setMem_name(request.getParameter("mem_name"));
// 			mb.setMem_email(request.getParameter("mem_email"));
// 			mb.setMem_addr(request.getParameter("mem_addr"));
			
// 			객체의 프로퍼티 값으로 저장
			if(manager.confirmID(mb.getMem_uid()) == 1){
				%>
					<script>alert("중복되는 아이디가 존재합니다."); history.back()</script>
				<%
			}
			else{
				int re = manager.insertMember(mb);
				if(re == 1){  
					%>
						<script>alert("회원가입을 축하드립니다!\n회원으로 로그인 해주세요!")</script>
<!-- 					document.location.href="T_login.jsp"; -->
						<button type="button" onclick="location.href='T_login.jsp'">로그인</button>
					<%
				}
				else{
					%>
						<script>alert("회원가입에 실패했습니다..")</script>
						<button type="button" onclick="location.href='T_login.jsp'">돌아가기</button>
					<%
				}
			}
		%>
	</body>
</html>