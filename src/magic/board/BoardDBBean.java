package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
//		ResultSet rs = null;
//		int max = 0;
//		String sql = "SELECT B_ID FROM BOARDT";
		String sql2 = "INSERT INTO BOARDT(B_ID, B_NAME, B_EMAIL, B_TITLE, B_CONTENT)"
					+ "VALUES((SELECT NVL(MAX(B_ID), 0) + 1 FROM BOARDT), ?, ?, ?, ?)";
		int re = -1;  // 초기값 -1, insert 정상 작동시 1
		
		try {
			conn = getConnection();
			
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				int bn = rs.getInt("B_ID");
//				if(max < bn) max = bn;
//			}
//			max += 1;
			
			pstmt = conn.prepareStatement(sql2);
//			pstmt.setInt(1, max);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			
			re = pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 작성 실패");
			e.printStackTrace();
		}
		return re;
	}
}
