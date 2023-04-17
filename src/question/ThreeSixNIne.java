package question;

public class ThreeSixNIne {
	private int n;

	public int getN() {
		return n;
	}

	public void setN(int n) {
		this.n = n;
	}
	
	public String process() {
		int count = 0;
		String result = "";
		
		if(n / 10 != 0 && n / 10 % 3 == 0) count++;
		if(n % 3 % 3 != 0 && n % 3 % 3 == 0) count++;
		
		switch(count) {
			case 0: result = "박수 없음"; break;
			case 1: result = "박수짝"; break;
			case 2: result = "박수짝짝"; break;
			default: result = "잘못된 숫자 값입니다.";
		}
		return result;
	}
}
