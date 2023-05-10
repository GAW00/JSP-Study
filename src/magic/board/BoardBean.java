package magic.board;

import java.sql.Timestamp;

public class BoardBean {
	private int b_id;
	private String b_name;
	private String b_email;
	private String b_title;
	private String b_content;
	private Timestamp b_date;
	private String b_date2;
	private int b_hit;
	private String b_pwd;
	private String b_ip;
	private int b_ref = 0;
	private int b_step = 0;
	private int b_level = 0;
	
	public static int pageSize = 10; // 한 페이지당 10개의 게시물을 출력
	public static int pageCount = 1; // 총 페이지 수(초기화 1)
	public static int pageNum = 1; // 현재 페이지 번호
	
//	반환 : [이전] + 페이지 번호 + [다음]
//	limit : 페이지 화면 출력 개수 (ex> 4개 : [1] [2] [3] [4] 4개까지만 표시)
	public static String pageNumber(int limit) {
		String str = "";
		int temp = (pageNum - 1) % limit; // startPage를 구하기 위한 임시 변수
		int startPage = pageNum - temp;   // 페이지 리스트의 첫 리스트 숫자 (ex> [이전] [13] [14] [15] [16] [다음] 이면 '13')
		System.out.println(pageNum + " : " + temp + " && " + startPage);
		// [이전] 출력 여부
		if((startPage - limit) > 0) {
			str = "<a href='T_list.jsp?pageNum="+(startPage - 1)+"'>[이전]</a>&nbsp;&nbsp;";
		}
		
		// 페이지 번호 나열하기
		for (int i = startPage; i < (startPage + limit); i++) {
			if(i == pageNum) { // 페이지 리스트에서 현재 선택되어 있는 페이지는 하이퍼 링크 X 
				str += "[" + i + "]&nbsp;&nbsp;";
			}
			else {
				str += "<a href='T_list.jsp?pageNum=" + i + "'>" + "[" + i + "]</a>&nbsp;&nbsp;";
			}
			if(i >= pageCount) break;
		}
		
		// [다음] 출력 여부
		if((startPage + limit) <= pageCount) {
			str += "<a href='T_list.jsp?pageNum="+(startPage + limit)+"'>[다음]</a>";
		}
		
		return str;
	}
	
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_email() {
		return b_email;
	}
	public void setB_email(String b_email) {
		this.b_email = b_email;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Timestamp getB_date() {
		return b_date;
	}
	public void setB_date(Timestamp b_date) {
		this.b_date = b_date;
	}
	public String getB_date2() {
		return b_date2;
	}
	public void setB_date2(String b_date2) {
		this.b_date2 = b_date2;
	}
	public int getB_hit() {
		return b_hit;
	}
	public void setB_hit(int b_hit) {
		this.b_hit = b_hit;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_ip() {
		return b_ip;
	}
	public void setB_ip(String b_ip) {
		this.b_ip = b_ip;
	}
	public int getB_ref() {
		return b_ref;
	}
	public void setB_ref(int b_ref) {
		this.b_ref = b_ref;
	}
	public int getB_step() {
		return b_step;
	}
	public void setB_step(int b_step) {
		this.b_step = b_step;
	}
	public int getB_level() {
		return b_level;
	}
	public void setB_level(int b_level) {
		this.b_level = b_level;
	}
	
}
