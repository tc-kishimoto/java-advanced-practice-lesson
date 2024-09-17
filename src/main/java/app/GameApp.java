package app;

public class GameApp {
	public static String item = "何か";
	
	public GameApp(String item){
		this.item = item;
	}
	public GameApp() {
		
	}
	
	public String start(String name){
		String mes = "";
		mes = name + "さんと" + item + "でゲームを開始します";
		return mes;
	}

}
