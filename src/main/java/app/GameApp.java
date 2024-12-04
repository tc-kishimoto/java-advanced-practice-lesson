package app;

public class GameApp {
	public String item;
	
	public GameApp(String item) {
		this.item = item;
	}
	public GameApp() {
		
	}
	public String start(String a) {
		String result =(a +"さんと" + this.item + "でゲームを開始します。");
		return result;
	}
}
