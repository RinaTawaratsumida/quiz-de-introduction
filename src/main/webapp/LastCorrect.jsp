<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト正解画面</title>
</head>
<body class="result-page">
	<div class="container">
		<!-- 最後の問題で正解した場合の見出し -->
		<h1 class="result-title">正解！</h1>

		<%
		// セッションから正解の答えと解説文を取得
		// ※この画面では解説文だけ使用
		String answer = (String) session.getAttribute("answer");
		String explanation = (String) session.getAttribute("explanation");
		%>

		<!-- 解説文を表示するブロック -->
		<div class="result-explanation">
			<%=explanation%>  <!-- JSPで解説文を出力 -->
		</div>

		<!-- 最終結果画面に進むボタン（ResultServletにGET送信） -->
		<form action="ResultServlet" method="get">
			<button type="submit" class="next-btn" value="result">結果画面へ</button>
		</form>
	</div>
</body>
</html>
