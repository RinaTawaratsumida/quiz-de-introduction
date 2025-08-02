<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Question</title>
</head>
<body class="select-page">
	<!-- javaで取得した問題形式と選択式を取得-->
	<%
	int format = (int) request.getAttribute("format");
	String question_text = (String) request.getAttribute("question_text");
	String choice1 = (String) request.getAttribute("choice1");
	String choice2 = (String) request.getAttribute("choice2");
	String choice3 = (String) request.getAttribute("choice3");
	String choice4 = (String) request.getAttribute("choice4");
	Integer quizCount = (Integer) session.getAttribute("quizCount");
	%>

	<h2>
		問題数:
		<%=quizCount + 1%>
	</h2>
	<p>
		<b>問題:</b>
		<%=question_text%>
	</p>

	<form class="quiz-answer-form choice-buttons" action="JudgeServlet"
		method="get">
		<button type="submit" name="answer" id="choice1" class="choice-btn"
			value="1"><%=choice1%></button>
		<button type="submit" name="answer" id="choice2" class="choice-btn"
			value="2"><%=choice2%></button>
		<button type="submit" name="answer" id="choice3" class="choice-btn"
			value="3"><%=choice3%></button>
		<button type="submit" name="answer" id="choice4" class="choice-btn"
			value="4"><%=choice4%></button>
	</form>

</body>
</html>
