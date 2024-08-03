package Practice;

public class sample {

	public static void main(String[] args) {
		sample s1 = new sample();
		Object o1 = s1;
		System.out.println(o1);
	}

	@Override
	public String toString() {
		return "sample()";
	}
}