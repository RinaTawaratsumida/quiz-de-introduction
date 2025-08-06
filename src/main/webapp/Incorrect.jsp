<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>不正解画面</title>
</head>
<body class="result-page">
	<%
	// セッションに保存された「解説文」を取得
	// この画面では正解の答えは使わず、解説だけ表示
	String explanation = (String) session.getAttribute("explanation");
	%>

	<div class="container">
		<!-- 不正解の見出しを表示（CSSクラスwrongで赤色などの装飾想定） -->
		<h1 class="result-title wrong">不正解</h1>

		<!-- 解説文を表示するブロック -->
		<div class="result-explanation">
			<%=explanation%>  <!-- JSPで解説文を出力 -->
		</div>

		<!-- 次の問題に進むボタン（QuizServletにGET送信） -->
		<form action="QuizServlet" method="get">
			<button type="submit" class="next-btn">次の問題へ</button>
		</form>
	</div>
</body>
</html>
