<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>正解画面</title>
</head>
<body class="result-page">
	<div class="container">
		<!-- 正解の見出しを表示 -->
		<h1 class="result-title">正解！</h1>

		<%
		// セッションから「正解の答え」と「解説文」を取得
		String answer = (String) session.getAttribute("answer");
		String explanation = (String) session.getAttribute("explanation");
		%>
		
		<!-- 解説を表示するブロック -->
		<div class="result-explanation">
			<%=explanation%>  <!-- JSPで解説文を表示 -->
		</div>

		<!-- 次の問題に進むボタン（QuizServletにGET送信） -->
		<form action="QuizServlet" method="get">
			<button type="submit" class="next-btn">次の問題へ</button>
		</form>
	</div>
</body>
</html>
