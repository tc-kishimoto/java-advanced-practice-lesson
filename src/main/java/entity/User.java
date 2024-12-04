package entity;

public class User {
	public String userId;
	public String userName;
	public int age;
	
	public User(String userId, String userName, int age) {
		this.userId = userId;
		this.userName = userName;
		this.age = age;
	}
	public User() {
		
	}
	
	public String returnUserInfo() {
		String result = ("ユーザーID："+this.userId + "、ユーザー名：" + this.userName + "、年齢：" + age); 
		return result;
	}
}
