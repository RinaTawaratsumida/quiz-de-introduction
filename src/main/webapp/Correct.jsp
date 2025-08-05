<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>正解画面</title>
</head>
<<<<<<< HEAD
<body class="result-page">
	<div class="container">
		<h1 class="result-title">正解！</h1>
=======
<body>

	<!-- 正解のメッセージを表示 -->
	<div>正解</div>

	<%
		// セッションから解説文を取得
		String explanation = (String) session.getAttribute("explanation");
	%>
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git

<<<<<<< HEAD
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
=======
	<!-- 正解の解説を表示 -->
	<p><%= explanation %></p>

	<!-- 次の問題へ進むボタン -->
	<form action="QuizServlet" method="get">
		<p>
			<input type="submit" value="next" id="nextBtn">
		</p>
	</form>

>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
</body>
</html>
