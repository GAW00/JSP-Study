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
		int id = board.getB_id();
		int ref = board.getB_ref();
		int step = board.getB_step();
		int level = board.getB_level();
		
		try {
			conn = getConnection();
//			글번호 최대값+1을 구함: null 일때는 1, 아니면 +1
			String sql2="SELECT max(b_id) FROM boardT";
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
//			
			if (rs.next()) {
				number = rs.getInt(1)+1;
			} else {
				number = 1;
			}
			
//			1.글번호를 가지고 오는 경우(답변)
//			2.글번호를 가지고 오지 않는 경우(신규글)
			if (id != 0) {//글번호를 가지고 오는 경우(답변)
//				특정 조건에 step+1 로 업데이트
				sql="UPDATE boardT SET b_step=b_step+1 WHERE b_ref=? and b_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step=step+1;
				level=level+1;
			} else {//글번호를 가지고 오지 않는 경우(신규글)
				ref=number;
				step=0;
				level=0;
			}
			sql="INSERT INTO boardT(b_id, b_name, b_email, b_title, b_content"
//					+ ", b_date, b_pwd, b_ip, b_ref, b_step, b_level) "
					+ ", b_date, b_pwd, b_ip, b_ref, b_step, b_level, b_fname, b_fsize) "
//					+ "VALUES(?,?,?,?,?)";
//					+ "VALUES((SELECT nvl(max(b_id),0)+1 FROM boardT),?,?,?,?,?,?,?)";
					+ "VALUES((SELECT nvl(max(b_id),0)+1 FROM boardT),?,?,?,?,?,?,?"
//					+ ",?,?,?)";
					+ ",?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, number);
			
			System.out.println("@@@### getB_name ===>"+board.getB_name());
			System.out.println("@@@### getB_title ===>"+board.getB_title());
			System.out.println("@@@### getB_content ===>"+board.getB_content());
			
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
			pstmt.setString(11, board.getB_fname());
			pstmt.setInt(12, board.getB_fsize());
			re = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("추가 실패");
		}
		return re;
	}
	
//	public ArrayList<BoardBean> listBoard(){
	public ArrayList<BoardBean> listBoard(String pageNumber){
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		ResultSet pageSet=null;//페이지에 관련된 결과값 받기위한 참조변수
		int dbCount=0;//게시글 총 갯수
		int absoulutePage=1;
		
//		String sql="SELECT b_id, b_name, b_email, b_title, b_content, b_date "
				String sql="SELECT b_id, b_name, b_email, b_title, b_content"
						+ ", TO_CHAR(b_date,'YYYY-MM-DD HH24:MI'), b_hit, b_pwd, b_ip"
//						ORDER BY b_ref desc, b_step asc => 최신글 순이고, 답글 순
//						+ ", b_ref, b_step, b_level FROM boardT "
						+ ", b_ref, b_step, b_level, b_fname, b_fsize FROM boardT "
						+ "ORDER BY b_ref desc, b_step asc";
		String sql2="SELECT count(b_id) FROM boardT";
		ArrayList<BoardBean> boardList=new ArrayList<BoardBean>();
		
		try {
			conn = getConnection();
//			stmt = conn.createStatement();
//			페이지 처리를 위한 메소드 파라미터 추가
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
//			rs = stmt.executeQuery(sql);
			pageSet = stmt.executeQuery(sql2);
			
			if (pageSet.next()) {//게시글 총 갯수 존재 여부
				dbCount = pageSet.getInt(1);//게시글 총 갯수
				pageSet.close();//자원 반납
			}
			
			//ex>84건인 경우 (84 % 10 = 4)
			//ex>80건인 경우 (80 % 10 = 0)
			if (dbCount % BoardBean.pageSize == 0) {
//				80/10 = 8 페이지
				BoardBean.pageCount = dbCount / BoardBean.pageSize;
			} else {//ex>84건인 경우
//				84/10+1 = 9 페이지
				BoardBean.pageCount = dbCount / BoardBean.pageSize + 1;
			}
			
			if(pageNumber != null) {//넘겨오는 페이지 번호가 있는 경우
				BoardBean.pageNum = Integer.parseInt(pageNumber);
//				ex>1: 0*10+1=1, 2: 1*10+1=11 => 1페이지는 1, 2페이지는 11(페이지의 기준 게시글)
				absoulutePage = (BoardBean.pageNum - 1) * BoardBean.pageSize + 1;
			}
			
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {//게시글이 있으면 참
				rs.absolute(absoulutePage);//페이지의 기준 게시글 셋팅
				int count=0;
				
				while (count < BoardBean.pageSize) {//게시글 갯수만큼 반복
					BoardBean board=new BoardBean();
					
//					쿼리 결과를 BoardBean 객체에 담아서 ArrayList 에 저장
					board.setB_id(rs.getInt(1));
					board.setB_name(rs.getString(2));
					board.setB_email(rs.getString(3));
					board.setB_title(rs.getString(4));
					board.setB_content(rs.getString(5));
//					board.setB_date(rs.getTimestamp(6));
					board.setB_date2(rs.getString(6));
					board.setB_hit(rs.getInt(7));
					board.setB_pwd(rs.getString(8));
					board.setB_ip(rs.getString(9));
					board.setB_ref(rs.getInt(10));
					board.setB_step(rs.getInt(11));
					board.setB_level(rs.getInt(12));
					board.setB_fname(rs.getString(13));
					board.setB_fsize(rs.getInt(14));
//					여기까지가 1행을 가져와서 저장
					
//					행의 데이터를 ArrayList 에 저장
					boardList.add(board);
					
//					페이지 변경시 처리위한 로직
					if (rs.isLast()) {
						break;
					} else {
						rs.next();
					}
					
					count++;
				}
			}
			/*
			while (rs.next()) {
				BoardBean board=new BoardBean();
				
//				쿼리 결과를 BoardBean 객체에 담아서 ArrayList 에 저장
				board.setB_id(rs.getInt(1));
				board.setB_name(rs.getString(2));
				board.setB_email(rs.getString(3));
				board.setB_title(rs.getString(4));
				board.setB_content(rs.getString(5));
//				board.setB_date(rs.getTimestamp(6));
				board.setB_date2(rs.getString(6));
				board.setB_hit(rs.getInt(7));
				board.setB_pwd(rs.getString(8));
				board.setB_ip(rs.getString(9));
				board.setB_ref(rs.getInt(10));
				board.setB_step(rs.getInt(11));
				board.setB_level(rs.getInt(12));
//				여기까지가 1행을 가져와서 저장
				
//				행의 데이터를 ArrayList 에 저장
				boardList.add(board);
			}
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return boardList;
	}
	
//	hitadd : 참일때만 조회수 증가
	public BoardBean getBoard(int bid, boolean hitadd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
//		String sql="SELECT b_id, b_name, b_email, b_title, b_content, b_date "
//				   + "FROM boardT WHERE b_id=?";
		String sql="";
		BoardBean board=null;
		
		try {
			conn = getConnection();
			
			if (hitadd == true) {
	//			조회수 1증가 SQL
				sql = "UPDATE boardT SET b_hit=b_hit+1 WHERE b_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bid);
				pstmt.executeUpdate();
			}
			
//			글내용 보기
			sql="SELECT b_id, b_name, b_email, b_title, b_content, b_date, b_hit, b_pwd"
//					+ ", b_ip, b_ref, b_step, b_level "
					+ ", b_ip, b_ref, b_step, b_level, b_fname, b_fsize "
				   + "FROM boardT WHERE b_id=?";
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
				board.setB_hit(rs.getInt(7));
				board.setB_pwd(rs.getString(8));
				board.setB_ip(rs.getString(9));
				board.setB_ref(rs.getInt(10));
				board.setB_step(rs.getInt(11));
				board.setB_level(rs.getInt(12));
				board.setB_fname(rs.getString(13));
				board.setB_fsize(rs.getInt(14));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return board;
	}
	
	public int deleteBoard(int b_id, String b_pwd) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String pwd="";
		int re=-1;
		
		try {
			conn = getConnection();
//			글번호로 비밀번호 조회
			sql = "SELECT b_pwd FROM boardT WHERE b_id=?";
			//sql = "DELETE FROM boardT WHERE b_id=? AND b_pwd=?";
			pstmt = conn.prepareStatement(sql);
//			쿼리 파라미터는 메소드 매개변수
			pstmt.setInt(1, b_id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {//비밀번호가 있으면 참
//				쿼리결과에서 b_pwd 컬럼 데이터
				pwd = rs.getString(1);
				if (pwd.equals(b_pwd)) {//비밀번호가 일치
//					삭제 쿼리 실행
					sql = "DELETE FROM boardT WHERE b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					pstmt.executeUpdate();
					re=1;//정상적으로 삭제
				} else {
					re=0;//삭제 안됨
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return re;
	}
	
//	수정할 내용을 BoardBean 타입의 객체로 받는다.
	public int editBoard(BoardBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		String pwd="";
		int re=-1;
		
		try {
			conn = getConnection();
			sql = "SELECT b_pwd FROM boardT WHERE b_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getB_id());
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				pwd = rs.getString(1);
				if (pwd.equals(board.getB_pwd())) {
					sql = "UPDATE boardT SET b_name=?, b_email=?, b_title=?"
							+ ", b_content=? WHERE b_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, board.getB_name());
					pstmt.setString(2, board.getB_email());
					pstmt.setString(3, board.getB_title());
					pstmt.setString(4, board.getB_content());
					pstmt.setInt(5, board.getB_id());
					pstmt.executeUpdate();
					re=1;
				} else {
					re=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return re;
	}
}


















