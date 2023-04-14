<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean class="magic.MemberBean" id="memBean"></jsp:useBean>
<!-- magic.MemberBean.java의 public void setId(String id){} 사용함 -->
<!-- property="id" : 넘어오는 name="id"를 받아주고, jsp:sestProperty 할때 setter로 저장 -->
<%-- <jsp:setProperty property="id" name="memBean"/> --%>
<%-- <jsp:setProperty property="name" name="memBean"/> --%>

<!-- property="*" : 한번에 매핑을 모두 하려면 넘어오는 name 과 빈의 프로퍼티가 동일해야 한다 -->
<jsp:setProperty property="*" name="memBean"/>
<!-- 넘어온 id값을 무시하고 value="bbb"적용 됨 -->
<%-- <jsp:setProperty value="bbb" property="id" name="memBean"/> --%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		아래는 당신이 입력한 정보입니다.
		<hr>
		아 이 디 : 
<!-- 	public String getId() -->
		<jsp:getProperty property="id" name="memBean"/><br>
		이름 : 
		<jsp:getProperty property="name" name="memBean"/><br>
		회원구분 : 
		<%
			if(memBean.getMclass() == 1){
				out.print("일반회원");
			}
			else out.print("교수님");
		%><br>
<%-- 	<jsp:getProperty property="mclass" name="memBean"/><br> --%>
		<jsp:getProperty property="phone1" name="memBean"/> -
		<jsp:getProperty property="phone2" name="memBean"/> -
		<jsp:getProperty property="phone3" name="memBean"/><br>
	</body>
</html>