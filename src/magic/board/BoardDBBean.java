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
		
		String sql2 = "INSERT INTO BOARDT(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT, B_DATE)"
					+ "VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), ?, ?, ?, ?, ?)";
		int re = -1;  // 초기값 -1, insert 정상 작동시 1
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss", Locale.KOREA);
		
		board.setB_date(Timestamp.valueOf(sdf.format(calendar.getTime())));
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			
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
		String sql = "SELECT * FROM BOARDT ORDER BY B_ID";
	
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
				tmp.setB_date(rs.getTimestamp("B_DATE"));
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
		
		String sql = "SELECT * FROM BOARDT WHERE B_ID = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardBean();
				
				board.setB_id(index);
				board.setB_name(rs.getString("B_NAME"));
				board.setB_email(rs.getString("B_EMAIL"));
				board.setB_title(rs.getString("B_TITLE"));
				board.setB_content(rs.getString("B_CONTENT"));
				board.setB_date(rs.getTimestamp("B_DATE"));
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}
}
