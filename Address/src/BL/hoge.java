package BL;

public class hoge {

	public static void main(String[] args) {
		// TODO 自動生成されたメソッド・スタブ
		String tel = "123-4567-8900";
		if (!(tel.length() > 0 && tel.matches("^\\d{3}-\\d{4}-\\d{4}$"))) {
			System.out.println("OK");
		} else {
			System.out.println("NO");
		}
		String tel2 = "";
		if (!(tel2.length() > 0 && tel2.matches("^\\d{3}-\\d{4}-\\d{4}$"))) {
			System.out.println("OK");
		} else {
			System.out.println("NO");
		}
	}

}
