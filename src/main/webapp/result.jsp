<%@ page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String age = request.getParameter("age");
	
	String result = "未実施";
	int userAge = 0;
	int flag[] = {0,0,0};
	String userData[] = new String[5];
	int count = 0;
	
	//セッションの初期化
	for(int i = 0; i > 5; i++){
		if(session.getAttribute(userData[i]) == null){
			session.setAttribute("userData", userData[i]);
		}
	}
	
	
	if(session.getAttribute("dataCount") == null){
		session.setAttribute("dataCount", 0);
	}
	
	
	
	if (userId != null && !userId.isEmpty()) {
		flag[0] = 1;
	}
	if (userName != null && !userName.isEmpty()) {
		flag[1] = 1;
	}
	if (age != null && !age.isEmpty()) {
		flag[2] = 1;
		userAge = Integer.parseInt(age);
	}
	
	if(flag[0] == 1 && flag[1] == 1 && flag[2] == 1){
		count = (int)session.getAttribute("dataCount");
		if(count < 5){
			User user = new User(userId, userName, userAge);
			userData[count] = user.returnUserInfo();
			session.setAttribute("userData", userData[count]);
			result = userData[count];
			count++;
			session.setAttribute("dataCount", count);
			
		}else{
			result = "これ以上ユーザーを登録できません";
		}
		
		
		
	}
 	//String result = (String)session.getAttribute("userData");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Java応用_演習問題1(発展)</title>
<style>
body {
    border: solid 2px #000080;
    padding: 5px;
}

.result {
    background: #fffacd;
    display: inline-block;
    margin: 5px;
    padding: 10px;
}

a.button {
    background-color: #ddeeff;
    border: 1px solid #ccc;
    padding: 5px;
    cursor: pointer;
}
</style>
</head>
<body>

  <h1>Java応用 - 演習問題1(発展)</h1>

  <h2>登録結果</h2>

  <div class="result">
    <h3>実行結果</h3>
    <p><%=result%></p>
  </div>

  <p>

    <span>現在の登録ユーザー</span><br>

    <%
        // 現在のユーザー情報を表示
        //for (User tempUser : users) {
            //if (tempUser != null) {
                // ユーザー情報を取得
                // todo:
                // 現在は変数のみ定義している。
                // Userクラスの情報取得用メソッドを呼んだ値をセットするように修正。
                //String msg = "";

                // ユーザー情報表示
                //out.println(msg);
                //out.println("<br>");
            //}
        //}
    	for(int i = 0; i > 5; i++){
    		String msg = (String)session.getAttribute("userData");
    		out.println(msg);
    		out.println("<br>");
    	}
    %>
  </p>

  <form action="input.jsp">
    <button type="submit" name="btn" value="back">戻る</button>
    <button type="submit" name="btn" value="reset">リセット</button>
  </form>
</body>
</html>