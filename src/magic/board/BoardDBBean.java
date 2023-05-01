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
		
		String sql2 = "INSERT INTO BOARDT(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, B_DATE, B_PWD) "
//					+ "VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), ?, ?, ?, ?, TO_CHAR(B_DATE, 'YYYY-MM-DD HH24:MM'))";
					+ "VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), ?, ?, ?, ?, ?, ?)";
		int re = -1;  // 초기값 -1, insert 정상 작동시 1
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			pstmt.setString(6, board.getB_pwd());
			
			re = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 작성 실패");
			e.printStackTrace();
		}
		return re;
	}
	public ArrayList<BoardBean> listBoard(){
		ArrayList<BoardBean> result = new ArrayList<BoardBean>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD FROM BOARDT ORDER BY B_ID";
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardBean tmp = new BoardBean();
				tmp.setB_id(rs.getInt("B_ID"));
				tmp.setB_name(rs.getString("B_NAME"));
				tmp.setB_email(rs.getString("B_EMAIL"));
				tmp.setB_title(rs.getString("B_TITLE"));
				tmp.setB_content(rs.getString("B_CONTENT"));
				tmp.setB_date2(rs.getString("B_DATE"));
				tmp.setB_hit(rs.getInt("B_HIT"));
				tmp.setB_pwd(rs.getString("B_PWD"));
				result.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public BoardBean getBoard(int index) {
		BoardBean board = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		
		String sql = "UPDATE BOARDT SET B_HIT = B_HIT + 1 WHERE B_ID = ?";
//		String sql2 = "SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD FROM BOARDT WHERE B_ID = ?";
		String sql2 = "SELECT rownum, a.* FROM(SELECT B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, TO_CHAR(B_DATE,'YYYY-MM-DD HH24:MM') B_DATE, B_HIT, B_PWD FROM BOARDT WHERE B_ID = ?) a";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			re = pstmt.executeUpdate();
			
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
}
