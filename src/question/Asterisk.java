package question;

public class Asterisk {
	private int n;

	public int getN() {
		return n;
	}

	public void setN(int n) {
		this.n = n;
	}
	
	public String process(int n) {
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < n; i++){
			for(int j = i; j < n; j++) {
				sb.append("*");
			}
			sb.append("<br>");
		}
		return sb.toString();
	}
}
