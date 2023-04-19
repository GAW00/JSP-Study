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
	
	String url = "jdbc:mysql://localhost:3306/jspdb";
	String user = "root";
	String password = "1234";
	String sql = "SELECT * FROM MEMBER2";
%>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<table width="400" border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>등급</td>
				<td>전화번호</td>
			</tr>
			<%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(url, user, password);
// 					createStatement() 메소드를 호출해서 쿼리를 이용하는 Statement 객체 생성
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql); // 해당 쿼리 실행 요청하고 ResultSet으로 받는다
					
// 					next() : 쿼리 결과가 있으면 참
					while(rs.next()){
						%>
							<tr>
<!-- 							getString : 문자타입의 컬럼 값 받을때 사용 -->
								<td><%= rs.getString("id") %></td>
								<td><%= rs.getString("name") %></td>
<!-- 							getInt : 숫자타입의 컬럼 값 받을때 사용 -->
								<td>
									<% 
										int n_class = rs.getInt("class");
										if(n_class ==1){
											out.print("일반회원");
										}
										else {
											out.print("교수님");
										}
								 	%>
								</td>
								<td><%= rs.getString("tel") %></td>
							</tr>
						<%
					}
				} catch(SQLException se) {
// 					printStackTrace() : 기본 오류 메세지
					se.printStackTrace();
				} finally {
// 					자원 반납할때 오류 발생시 처리
					try{
						if(rs != null) rs.close();
						if(stmt != null) stmt.close();
						if(conn != null) conn.close();
					}catch(SQLException se){
						se.printStackTrace();
					}
				}
			%>
		</table>
	</body>
</html>