<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
// 	데이터베이스 연결을 위한 인터페이스
	Connection conn = null;
// 	쿼리문 이용을 위한 인터페이스
	Statement stmt = null;
// 	쿼리 결과를 받기 위한 인터페이스
	ResultSet rs = null;
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			String id="", pw="", name="", sclass="", p1="", p2="", p3="";
			id = request.getParameter("id");
			pw = request.getParameter("pw");
			name = request.getParameter("name");
			sclass = request.getParameter("mclass");
			p1 = request.getParameter("phone1");
			p2 = request.getParameter("phone2");
			p3 = request.getParameter("phone3");
			try{
// 				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection(url, user, password);
				stmt = conn.createStatement();
				StringBuilder insertQuery = new StringBuilder();
// 				insert 쿼리 조립
				insertQuery.append("INSERT INTO MEMBER2 VALUES('");
				insertQuery.append(id + "','");
				insertQuery.append(pw + "','");
				insertQuery.append(name + "','");
				insertQuery.append(sclass + "','");
				insertQuery.append(p1 + "-" + p2 + "-" + p3 + "')");
				
// 				조립한 쿼리 확인
				System.out.println(insertQuery.toString());
// 				executeUpdate() : insert 할때 사용
				int re = stmt.executeUpdate(insertQuery.toString());

				if(re == 1){
					%>
					추가 성공
					<br>
					<a href="05_addForm.html">추가작업</a>
					<a href="03_viewMember.jsp">검색작업</a>
					<%
				}
				else{
					%>
					<font color="red">추가 실패 ㅠ.ㅠ</font>
					<%
				}
			}catch(SQLException se){
				se.printStackTrace();
			}
		%>
	</body>
</html>