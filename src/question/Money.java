package question;

public class Money {
	private int money;

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
	
	public int[] process(int m) {
		int[] result = new int[6];
		int[] unit = {50000, 10000, 1000, 100, 10, 1};
		for(int i = 0; i < 6; i++) {
			result[i] = m / unit[i];
			m %= unit[i];
		}
		return result;
	}
}
