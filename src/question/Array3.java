package question;

public class Array3 {
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
			if(i == 0) {
				sb.append((int)(Math.random() * 100) + 1 + " ");
			}
			else if(i % 10 == 0) {
				sb.append((int)(Math.random() * 100) + 1 + "<br>");
			}
			sb.append((int)(Math.random() * 100) + 1 + " ");
		}
		return sb.toString();
	}
}
