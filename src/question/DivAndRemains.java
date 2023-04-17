package question;

public class DivAndRemains {
	private int n;
	
	public int getN() {
		return n;
	}
	
	public void setN(int n) {
		this.n = n;
	}
	
	public String process(int n) {
		String str = "";
		if(n % 10 == n / 10) str += "같습니다.";
		else str += "다릅니다.";
		
		return str;
	}
}
