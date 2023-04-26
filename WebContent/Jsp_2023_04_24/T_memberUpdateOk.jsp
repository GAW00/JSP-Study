<!-- 데이터 update 처리하는 jsp -->
<%@page import="magic.member.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 	한글 안 깨지게(주소 etc..)
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean class="magic.member.MemberBean" id="member"></jsp:useBean>
<!-- name="mem_pwd" -->
<!-- name="mem_check" -->
<!-- name="mem_pwd" -->
<!-- name="mem_pwd" -->
<!-- 넘어온 값을 세팅 -->
<!-- 	private String mem_uid; -->
<!-- 	private String mem_pwd; -->
<!-- 	private String mem_name; -->
<!-- 	private String mem_email; -->
<!-- 	private String mem_addr; -->
<jsp:setProperty property="*" name="member"/>
<!-- 오류 발생시 데이터 확인할때 -->
<!-- 1. db 쪽에 로그 추가해서 확인 -->
<!-- 2. debugging -->
<%
	MemberDBBean manager = MemberDBBean.getInstance();
	String id = (String)session.getAttribute("id");
	member.setMem_uid(id);
	int re = manager.updateMember(member);
	
	if(re == 1){
		%>
			<script>
				alert("입력하신 대로 회원 정보가 수정되었습니다.");
				document.location.href="T_main.jsp";
			</script>
		<%
	}
	else{
		%>
			<script>
				alert("수정에 실패했습니다.");
				history.go(-1);
			</script>
		<%
	}
%>