package question;

public class Alphabet {
	private char alphabet;

	public char getAlphabet() {
		return alphabet;
	}

	public void setAlphabet(char alphabet) {
		this.alphabet = Character.toLowerCase(alphabet);
	}
	
	public String process(char a) throws Exception {
		StringBuilder sb = new StringBuilder();
		
		if(a >= 97 && a <= 122) {
			for(int i = 'a'; i <= a; i++) {
				sb.append((char)i);
			}
			return sb.toString();
		}
		else {
			throw new Exception();
		}
	}
}
