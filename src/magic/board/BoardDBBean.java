package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Locale;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	
	private static BoardDBBean instance = new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}
	public Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	public int insertBoard(BoardBean board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		
		int re = -1;  // 초기값 -1, insert 정상 작동시 1
		
		int number;
		int id = board.getB_id();
		int ref = board.getB_ref();
		int step = board.getB_step();
		int level = board.getB_level();
		
		try {
			conn = getConnection();
			sql = "SELECT MAX(B_ID) FROM BOARDT";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1) + 1;
			}
			else {
				number = 1;
			}
//			경우 1) 글 번호를 가지고 오는 경우(답변)
//			경우 2) 글 번호를 가지고 오지 않는 경우(신규글)
			if(id != 0) { // 글번호를 가지고 오는 경우(답변)
//				특정 조건에 step + 1 로 업데이트
				 sql = "UPDATE BOARDT SET B_STEP = B_STEP + 1 WHERE B_REF = ? AND B_STEP > ?";
				 pstmt = conn.prepareCall(sql);
				 pstmt.setInt(1, ref);
				 pstmt.setInt(2, step);
				 pstmt.executeUpdate();
				 
				step += 1;
				level += 1;
			}
			else {		  // 글번호를 가지고 오지 않는 경우(신규글)
				ref = number;
				step = 0;
				level = 0;
			}
			
			sql = "INSERT INTO BOARDT(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, B_DATE, B_PWD, B_IP, B_REF, B_STEP, B_LEVEL) "
					+ "VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), ?, ?, ?, ?, ?, ?, ?"
					+ ", ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			pstmt.setString(6, board.getB_pwd());
			pstmt.setString(7, board.getB_ip());
			pstmt.setInt(8, ref);
			pstmt.setInt(9, step);
			pstmt.setInt(10, level);
			
			re = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 작성 실패");
			e.printStackTrace();
		}
		return re;
	}
//	public ArrayList<BoardBean> listBoard(){
	public ArrayList<BoardBean> listBoard(String pageNumber){
		ArrayList<BoardBean> result = new ArrayList<BoardBean>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		ResultSet pageSet = null; // 게시판 리스트 페이지 결과 값
		int dbCount = 0; // 게시글 총 개수
		int absolutePage = 1; // 게시글 리스트 페이지의 가장 처음 글 번호(B_ID) // 기준
		
		String sql = "SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD, B_IP"
				        + ", B_REF, B_STEP, B_LEVEL FROM BOARDT ORDER BY B_REF DESC, B_STEP"; // ref desc => 최신 순, step asc => 답글 순
		
		String sql2 = "SELECT COUNT(B_ID) FROM BOARDT"; 
		
		try {
			conn = getConnection();
//			stmt = conn.createStatement();
//			페이지 처리를 위한 메소드 파라미터 추가
//			TYPE_SCROLL_SENSITIVE : 위치 이동을 자유롭게 하고(rs.next()후 앞오로 다시 올 수 있음) 업데이트 내용 반영, 수정결과 바로 반영
//			CONCUR_UPDATABLE : 데이터 변경이 가능 하도록
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE); 
//			rs = stmt.executeQuery(sql);
			pageSet = stmt.executeQuery(sql2);
			
			if(pageSet.next()) { // 게시글 총 개수 존재 여부
				dbCount = pageSet.getInt(1);
				pageSet.close(); //자원 반납
			}
			
			// 필요한 페이지 수 계산
			// ex> 총 게시글 수가 84건인 경우
			// ==> 84 % 10 = 4 페이지(x)
			// ex> 총 게시글 수가 80건인 경우
			// ==> 80 % 10 = 8 페이지(o)
			if(dbCount % BoardBean.pageSize == 0) {
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			}
			// ==> 84 / 10 + 1 = 9 페이지
			else {
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
//			페이지별 기준 튜플 번호 설정(absolutePage)
			if(pageNumber != null) { // 넘겨오는 페이지 번호가 있는 경우
				BoardBean.pageNum = Integer.parseInt(pageNumber);
				// ex> 1: 0 * 10 + 1 = 1, 2: 1 * 10 + 1 = 11 => 1페이지는 1, 2페이지는 11
				absolutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {	// 게시글이 있으면 true
				rs.absolute(absolutePage); // 페이지 기준 게시글 세팅
				int count = 0;
			
				while(count < BoardBean.pageSize) { // 게시글 개수만큼 반복
					BoardBean tmp = new BoardBean();
					
					tmp.setB_id(rs.getInt("B_ID"));
					tmp.setB_name(rs.getString("B_NAME"));
					tmp.setB_email(rs.getString("B_EMAIL"));
					tmp.setB_title(rs.getString("B_TITLE"));
					tmp.setB_content(rs.getString("B_CONTENT"));
					tmp.setB_date2(rs.getString("B_DATE"));
					tmp.setB_hit(rs.getInt("B_HIT"));
					tmp.setB_pwd(rs.getString("B_PWD"));
					tmp.setB_ip(rs.getString("B_IP"));
					tmp.setB_ref(rs.getInt("B_REF"));
					tmp.setB_step(rs.getInt("B_STEP"));
					tmp.setB_level(rs.getInt("B_LEVEL"));
					
					result.add(tmp);
					
					// 페이지 변경 시 처리위한 로직
					// 페이지의 마지막 이면 빠져나옴
					if (rs.isLast()) { 
						break;
					} else {
						rs.next();
					}
					count++;
				}
			}
			
//			while(rs.next()) {
//				BoardBean tmp = new BoardBean();
//				tmp.setB_id(rs.getInt("B_ID"));
//				tmp.setB_name(rs.getString("B_NAME"));
//				tmp.setB_email(rs.getString("B_EMAIL"));
//				tmp.setB_title(rs.getString("B_TITLE"));
//				tmp.setB_content(rs.getString("B_CONTENT"));
//				tmp.setB_date2(rs.getString("B_DATE"));
//				tmp.setB_hit(rs.getInt("B_HIT"));
//				tmp.setB_pwd(rs.getString("B_PWD"));
//				tmp.setB_ip(rs.getString("B_IP"));
//				tmp.setB_ref(rs.getInt("B_REF"));
//				tmp.setB_step(rs.getInt("B_STEP"));
//				tmp.setB_level(rs.getInt("B_LEVEL"));
//				result.add(tmp);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public BoardBean getBoard(int index, boolean tf) {
		BoardBean board = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		
		String sql = "UPDATE BOARDT SET B_HIT = B_HIT + 1 WHERE B_ID = ?";
//		String sql2 = "SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD FROM BOARDT WHERE B_ID = ?";
		String sql2 = "SELECT rownum, a.* FROM(SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD"
						+ ", B_IP, B_REF, B_STEP, B_LEVEL FROM BOARDT WHERE B_ID = ?) a";
//		rownum 받아서 쓰면 글 번호 항상 1234 로 가능 할듯
		try {
			conn = getConnection();
			if(tf == true) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, index);
				re = pstmt.executeUpdate();
			}
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				board = new BoardBean();
				board.setB_id(index);
				board.setB_name(rs.getString("B_NAME"));
				board.setB_email(rs.getString("B_EMAIL"));
				board.setB_title(rs.getString("B_TITLE"));
				board.setB_content(rs.getString("B_CONTENT"));
				board.setB_date2(rs.getString("B_DATE"));
				board.setB_hit(rs.getInt("B_HIT"));
				board.setB_pwd(rs.getString("B_PWD"));
				board.setB_ip(rs.getString("B_IP"));
				board.setB_ref(rs.getInt("B_REF"));
				board.setB_step(rs.getInt("B_STEP"));
				board.setB_level(rs.getInt("B_LEVEL"));
				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
	public boolean deleteBoard(int index, String val) {
		try {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT B_PWD FROM BOARDT WHERE B_ID = ?";
			int re = -1;
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				System.out.println("#### : " + rs.getString(1));
				if(rs.getString(1).equals(val)) {
					sql = "DELETE FROM BOARDT WHERE B_ID = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, index);
					re = pstmt.executeUpdate();
					
					if(re == 1) {
						return true;
					}
					else {
						return false;
					}
				}
				else {
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	public boolean editBoard(int index, BoardBean board) {
		BoardBean board_origin = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE BOARDT SET B_NAME = ?, B_EMAIL = ?, B_TITLE = ?, B_CONTENT = ? WHERE B_ID = ?";
		
		try {
			conn = getConnection();
			board_origin = getBoard(index, false);
			
			
			if(board_origin.getB_pwd().equals(board.getB_pwd())) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, board.getB_name());
				pstmt.setString(2, board.getB_email());
				pstmt.setString(3, board.getB_title());
				pstmt.setString(4, board.getB_content());
				pstmt.setInt(5, index);
				pstmt.executeUpdate();

				pstmt.close();
				conn.close();
				
				return true;
			}
			else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
