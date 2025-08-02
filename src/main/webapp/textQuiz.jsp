<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>記述式クイズ</title>
</head>
<body>
	<%
	String question_text = (String) request.getAttribute("question_text");
	Integer quizCount = (Integer) session.getAttribute("quizCount");
	%>
	<div class="quiz-container">
		<h2>
			問題数:
			<%=quizCount + 1%>
		</h2>
		<div class="quiz-title">記述式クイズ</div>
		<p class="quiz-question">
			<%=question_text%>
		</p>
		<form class="quiz-answer-form" action="JudgeServlet" method="get">
			<input class="quiz-answer-input" type="text" name="answer"> <input
				class="quiz-submit" type="submit" value="送信">
		</form>
	</div>
</body>
</html>
