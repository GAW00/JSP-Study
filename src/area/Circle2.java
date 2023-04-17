package area;

public class Circle2 {
	private int radius; // 프로퍼티
	
	public double process() {
		return radius * radius * 3.14;
	}
	
	public int getRadius() {
		return radius;
	}
	
	public void setRadius(int radius) {
		this.radius = radius;
	}
}
