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
		<h1 class="result-title">正解！</h1>

		<%
		String answer = (String) session.getAttribute("answer");
		String explanation = (String) session.getAttribute("explanation");
		%>
		<!-- 解説 -->
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
