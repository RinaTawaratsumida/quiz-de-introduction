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
	// セッションに保存された explanation を取得
	String explanation = (String) session.getAttribute("explanation");
	%>

	<div class="container">
		<!-- 不正解表示 -->
		<h1 class="result-title wrong">不正解</h1>

		<!-- 解説（存在する場合のみ表示） -->
		<div class="result-explanation">
			<%=explanation%>
		</div>


		<!-- 次へボタン -->
		<form action="QuizServlet" method="get">
			<button type="submit" class="next-btn">次の問題へ</button>
		</form>
	</div>
</body>
</html>
