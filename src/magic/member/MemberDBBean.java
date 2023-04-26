package magic.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

// 회원정보 처리 빈 객체
public class MemberDBBean {
//	jsp 소스에서 빈(Bean)객체 생성을 위한 참조 변수
	private static MemberDBBean instance = new MemberDBBean();
	
//	1) MemberDBBean 객체 레퍼런스를 리턴하는 메소드
	public static MemberDBBean getInstance() {
		return instance;
	}
	
//	2) 쿼리작업에 사용할 커넥션 객체를 리턴하는 메호드(dbcp 기법)
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();	//	InitialContext : dbcp 사용하기 위한 객체 생성
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");  // jav:comp/env/ : sever.xml 에서 Resource 태그에 name 을 찾아감
		return ds.getConnection();  // dbcp 객체 정보
	}
	
//	3) 전달인자로 받은 member를 memberT 테이블에 삽입하는 메소드
	public int insertMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBERT VALUES(?, ?, ?, ?, ?)";  // 매개변수로 받은 MEMBER 객체를 ? 인 쿼리 파라미터에 맵핑
		int re = -1;  // 초기값 -1, insert 정상 작동시 1
		
		try {
			conn = getConnection();  // dbcp 기법으로 된 연결 객체
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMem_uid());
			pstmt.setString(2, member.getMem_pwd());
			pstmt.setString(3, member.getMem_name());
			pstmt.setString(4, member.getMem_email());
			pstmt.setString(5, member.getMem_addr());
			
			pstmt.executeUpdate();  // INSERT 문은 executeUpdate 메소드 호출
			re = 1;
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("추가 실패");
			e.printStackTrace();
		}
		return re;
	}
	
//	4) 회원 가입시 아이디 중복 확인할 때 사용하는 메소드
	public int confirmID(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
//		매개변수로 받아온 id = ? 안 쿼리 파라미터에 맵핑
		String sql = "SELECT mem_uid FROM MEMBERT WHERE mem_uid = ?";
		int re = -1;  // 초기값 -1, 아이디가 중복되면 1
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();  // SELECT 문은 executeQuery 메소드 호출
			
			if(rs.next()) {  // 이이디가 일치하는 튜플 존재 => 아이디 중복
				re = 1;
			}
			else {  // 아이디 중복 X
				re = -1;
			}
//			순서대로 반환
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
//	5) 사용자 인증시 검증에 사용하는 메소드
	public int userCheck(String id, String pw) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
//		매개변수로 받아온 id = ? 안 쿼리 파라미터에 맵핑
		String sql = "SELECT mem_pwd FROM memberT WHERE mem_uid = ?";
		int re = -1;  // 초기값 -1, 비밀번호가 일치하면 1, 불일치하면 0
		String db_mem_pw="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();  // SELECT 문은 executeQuery 메소드 호출
			
			if(rs.next()) {  // 이이디가 일치하는 튜플 존재
				db_mem_pw = rs.getString("mem_pwd");
				if(db_mem_pw.equals(pw)) {  // 패스워드도 일치
					re = 1;
				}
				else {  // 패스워드 불일치
					re = 0;
				}
			}
			else {  // 아이디 중복 X
				re = -1;
			}
//			순서대로 반환
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	
//	6) 아이디와 일치하는 멤버의 정보를 얻어오는 메소드
	public MemberBean getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
//		매개변수로 받아온 id = ? 안 쿼리 파라미터에 맵핑
//		String sql = "SELECT * FROM MEMBERT WHERE mem_uid = ?";
		String sql = "SELECT mem_uid, mem_pwd, mem_name, mem_email, mem_addr "
				   + "FROM memberT WHERE mem_uid = ?";
		
//		member : 쿼리결과에 해당하는 회원정보를 담는 객체
		MemberBean member = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();  // SELECT 문은 executeQuery 메소드 호출
			
			if(rs.next()) {
				member = new MemberBean();
				member.setMem_uid(rs.getString("mem_uid"));
				member.setMem_pwd(rs.getString("mem_pwd"));
				member.setMem_name(rs.getString("mem_name"));
				member.setMem_email(rs.getString("mem_email"));
				member.setMem_addr(rs.getString("mem_addr"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int updateMember(MemberBean member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE MEMBERT SET mem_pwd = ?, mem_email = ?, mem_addr=? WHERE mem_uid = ?";
		int re = -1;  // 초기값 -1, 변경된 튜플 개수 1
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
//			값 확인
			System.out.println("@@@### get Mem_pwd ===> " + member.getMem_pwd());
			System.out.println("@@@### get Mem_email ===> " + member.getMem_email());
			System.out.println("@@@### get Mem_addr ===> " + member.getMem_addr());
			System.out.println("@@@### get Mem_uid ===> " + member.getMem_uid());
			
			pstmt.setString(1,  member.getMem_pwd());
			pstmt.setString(2,  member.getMem_email());
			pstmt.setString(3,  member.getMem_addr());
			pstmt.setString(4,  member.getMem_uid());
			re = pstmt.executeUpdate();  // Update 문은 executeUpdate 메소드 호출
			
//			오류나도 출력됨
//			System.out.print("변경 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("변경 실패");
		}
		
		return re;
	}
}
