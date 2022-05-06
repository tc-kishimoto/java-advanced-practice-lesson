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
	for(int i = 0; i < 5; i++){
		if(session.getAttribute("userData" + i) == null){
			session.setAttribute("userData" + i, userData[i]);
		}
	}
	
	if(session.getAttribute("dataCount") == null){
		session.setAttribute("dataCount", 0);
	}
	
	result = "";
	
	if (userId != null && !userId.isEmpty()) {
		flag[0] = 1;
		
	}else{
		result += "userIdが未入力です。<br>";
	}
	if (userName != null && !userName.isEmpty()) {
		flag[1] = 1;
		
	}else{
		result += "userNameが未入力です。<br>";
	}
	if (age != null && !age.isEmpty()) {
		flag[2] = 1;
		
		userAge = Integer.parseInt(age);
	}else{
		result += "ageが未入力です。";
	}
	
	if(flag[0] == 1 && flag[1] == 1 && flag[2] == 1){
		count = (int)session.getAttribute("dataCount");
		if(count < 5){
			User user = new User(userId, userName, userAge);
			userData[count] = user.returnUserInfo();
			session.setAttribute("userData" + count, userData[count]);
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
    	for(int i = 0; i < 5; i++){
    		String msg = (String)session.getAttribute("userData" + i);
    		if(msg == null){
    			break;
    		}
    		out.println(msg);
    		out.println("<br>");
//     		
    	}
    %>
  </p>

  <form action="input.jsp">
    <button type="submit" name="btn" value="back">戻る</button>
    <button type="submit" name="btn" value="reset">リセット</button>
  </form>
</body>
</html>