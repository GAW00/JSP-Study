package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	private static BoardDBBean instance=new BoardDBBean();
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		int re=-1;//초기값 -1, insert 정상적으로 실행되면 1
		int number;
		
		try {
			conn = getConnection();
//			글번호 최대값+1을 구함: null 일때는 1, 아니면 +1
//			String sql2="SELECT max(b_id) FROM boardT";
//			pstmt = conn.prepareStatement(sql2);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				number = rs.getInt(1)+1;
//			} else {
//				number = 1;
//			}
			
			sql="INSERT INTO boardT(b_id, b_name, b_email, b_title, b_content, b_date) "
//					+ "VALUES(?,?,?,?,?)";
					+ "VALUES((SELECT nvl(max(b_id),0)+1 FROM boardT),?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, number);
			pstmt.setString(1, board.getB_name());
			pstmt.setString(2, board.getB_email());
			pstmt.setString(3, board.getB_title());
			pstmt.setString(4, board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("추가 실패");
		}
		return re;
	}
	
	public ArrayList<BoardBean> listBoard(){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		String sql="SELECT b_id, b_name, b_email, b_title, b_content, b_date "
				   + "FROM boardT ORDER BY b_id";
		ArrayList<BoardBean> boardList=new ArrayList<BoardBean>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				BoardBean board=new BoardBean();
				
//				쿼리 결과를 BoardBean 객체에 담아서 ArrayList 에 저장
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_date(rs.getTimestamp(6));
//				여기까지가 1행을 가져와서 저장
				
//				행의 데이터를 ArrayList 에 저장
				boardList.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
	public BoardBean getBoard(int bid) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT b_id, b_name, b_email, b_title, b_content, b_date "
				   + "FROM boardT WHERE b_id=?";
		BoardBean board=null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board=new BoardBean();
				
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
				board.setB_date(rs.getTimestamp(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
}












