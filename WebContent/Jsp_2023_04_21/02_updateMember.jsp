<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.SQLException"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
			Connection conn = null;
// 		 	쿼리문 이용을 위한 인터페이스
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			DataSource ds = null;
			
// 			String sql = "SELECT * FROM MEMBER2";
		%>
		<%
			try{
// 				InitialContext : dbcp 사용하기 위한 객체 생성
				Context ctx = new InitialContext();
// 				jav:comp/env/ : sever.xml 에서 Resource 태그에 name 을 찾아감
				ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
				conn = ds.getConnection();
				System.out.println("DBCP 연동 성공");
				
// 				조회하기 위해서 StringBuffer 객체를 생성해서 쿼리 실행
// 				※. 회원정보를 가지고 오는 방법 2가지(1번 선택)
// 				1. id 를 가지고 회원정보를 가지고 옴(select 쿼리 작업이 추가로 필요함)
// 				2. viewMember.jsp에서 직접 값들을 가지고 옴(다른 화면에서 수정시 값들이 반영 안됨)
				StringBuffer selectQuery = new StringBuffer();
				selectQuery.append("SELECT NAME, CLASS, TEL FROM MEMBER2 WHERE ID = ?");
				String id = request.getParameter("id");				
// 				conn : dbcp 연결 정보 객체를 가지고, PreparedStatement 메소드 호출해서
// 				PreparedStatement 객체 생성해서 쿼리 사용
				pstmt = conn.prepareStatement(selectQuery.toString());
// 				setString() : 쿼리 파라미터 값 저장(n번째 파라미터, 값)
				pstmt.setString(1, id);
// 				executeQuery() : Select 쿼리 실행해서 결과값을 ResultSet 객체로 받음
				rs = pstmt.executeQuery();
				
				if(rs.next()){
// 					쿼리 결과값 출력(SELECT NAME, CLASS, TEL FROM MEMBER2 WHERE ID = ?)
					%>
<!-- 					결과값을 가지고 update 하기 위한 jsp로 이동(form action 태그 추가) -->
						<form method="post" action="02_updateProcess.jsp">
							아이디 : <input type="text" value="<%= id %>" name="id"><br>
							이름 : <input type="text" value="<%= rs.getString("NAME") %>" name="name"><br>
							회원등급 : <input type="text" value="<%= rs.getString("CLASS") %>" name="mclass"><br>
							전화번호 : <input type="text" value="<%= rs.getString("TEL") %>" name="tel"><br>
							<input type="submit" value="수정">
							<button onclick="history.back(); return false;">목록보기</button >
						</form>
					<%
				}
				else{
					%>
						<font color="red">해당 아이디 존재하지 않음</font>
						<a href="02_viewMember.jsp">목록보기</a>
					<%
				}
			} catch(NamingException ne) {
				ne.printStackTrace();
			} catch(SQLException se) {
				se.printStackTrace();
			} finally {
				try{
					if(rs != null) rs.close();
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(SQLException se){
					se.printStackTrace();
				}
			}
		%>
	</body>
</html>