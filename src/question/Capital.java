package question;

public class Capital {
	private char cap;

	public char getCap() {
		return cap;
	}

	public void setCap(char cap) {
		this.cap = Character.toUpperCase(cap);
	}
	
	public String process(char cap) throws Exception {
		StringBuilder sb = new StringBuilder();
		if(cap >= 'A' && cap <= 'Z') {
			for(int i = cap; i >= 'A'; i--) {
				for(int j = 'A'; j <= i; j++) {
					sb.append((char)j);
				}
				sb.append("<br>");
			}
			return sb.toString();
		}
		else {
			throw new Exception();
		}
	}
}
