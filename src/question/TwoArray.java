package question;

public class TwoArray {
	private int num;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
	
	public String process(int n) {
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < n; i++) {
			for(int j = 0; j < n; j++) {
				sb.append((int)(Math.random() * 10) + 1 + "&nbsp;&nbsp;&nbsp;");
			}
			sb.append("<br>");
		}
		return sb.toString();
	}
}
