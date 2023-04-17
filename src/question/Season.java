package question;

public class Season {
	private int season;

	public int getSeason() {
		return season;
	}

	public void setSeason(int season) {
		this.season = season;
	}
	
	public String process(int s) {
		StringBuilder sb = new StringBuilder();
		switch(s) {
			case 3:
			case 4:
			case 5: sb.append("봄"); break;
			case 6:
			case 7:
			case 8: sb.append("여름"); break;
			case 9:
			case 10:
			case 11: sb.append("가을"); break;
			case 12:
			case 1:
			case 2: sb.append("겨울");
			default: sb.append("잘못된 숫자 입력입니다.");
		}
		return sb.toString();
	}
}
