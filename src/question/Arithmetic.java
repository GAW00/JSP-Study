package question;

public class Arithmetic {
	private int n1, n2;
	private String op;
	
	public String getOp() {
		return op;
	}

	public void setOp(String op) {
		this.op = op;
	}

	public int getN1() {
		return n1;
	}

	public void setN1(int n1) {
		this.n1 = n1;
	}

	public int getN2() {
		return n2;
	}

	public void setN2(int n2) {
		this.n2 = n2;
	}
	
	public String process(int n1, int n2, String op) {
		switch (op){
			case "+": return String.valueOf(n1 + n2);
			case "-": return String.valueOf(n1 - n2);
			case "*": return String.valueOf(n1 * n2);
			case "/": if(n2 == 0) {
						return "0으로 나눌 수 없습니다.";
					  }
					  return String.valueOf(n1 / n2);
			default: return "잘못된 연산자 입니다"; 
		}
	}
	
	public String process2(int n1, int n2, String op) {
		int d = 0;
		switch (op) {
		case "+":
			d = n1 + n2;
			break;
		case "-":
			d =  n1 - n2;
			break;
		case "*":
			d =  n1 * n2;
			break;
		case "/":
			if (n2 == 0) {
				return "0으로 나눌 수 없습니다!";
			}
			d =  n1 / n2;
			break;
		default:
			return "잘못된 연산자 입니다!";
		}
		return String.valueOf(d);
	}
	
}
