<%@ page import="entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String userId = request.getParameter("userId");
	String userName = request.getParameter("userName");
	String ageS = request.getParameter("age");
	String btn = request.getParameter("btn");
	
	String result ="";

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
		String msg;
    	
    	
    	if ((userName != null || !userName.isEmpty()) && (userId != null || !userId.isEmpty()) && (ageS != null || !ageS.isEmpty())){
    		
    		String [] userInfo;
    		userInfo = new String [4];
    		int age = Integer.parseInt(ageS);
    		
    		if (session.getAttribute("userInfo[]") != null){
    			userInfo = (String [])session.getAttribute("userInfo[]");
    		}
    		
    		int i =0;
    		
    		if (userInfo[userInfo.length-1] != null){
    			result = "これ以上ユーザーを登録できません。";
    		}else if (userInfo[userInfo.length-1] == null){
    		
    			for (i = 0; i < userInfo.length; i++){
    				if (userInfo[i] == null){
    					User user = new User(userName, userId, age);
    					String res = user.returnUserInfo();
    					userInfo[i] = res;
    	    			session.setAttribute("userInfo[]",userInfo);
    	    			result ="ユーザーを登録しました";
    	    			break;
    				}else {
    					msg = userInfo[i];
    					out.println(msg);
    					out.println("<br>");
    				}
    			}
    		}
    		
    	}
    
    	if (btn!= null && btn.equals("reset")) {
    		session.invalidate();
        }
    %>
	</p>

	<form action="input.jsp">
		<button type="submit" name="btn" value="back">戻る</button>
		<button type="submit" name="btn" value="reset">リセット</button>
	</form>
</body>
</html>