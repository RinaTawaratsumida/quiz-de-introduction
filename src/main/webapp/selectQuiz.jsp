<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<script src="js/countdown_time.js"></script>
<title>Question</title>
</head>
<body>

	<%
	int format = (int) request.getAttribute("format");
	String question_text = (String) request.getAttribute("question_text");
	String answer = (String) request.getAttribute("answer");
	String explanation = (String) request.getAttribute("explanation");
	String choice1 = (String) request.getAttribute("choice1");
	String choice2 = (String) request.getAttribute("choice2");
	String choice3 = (String) request.getAttribute("choice3");
	String choice4 = (String) request.getAttribute("choice4");
	%>

	<h2>
		問題形式:
		<%=format%></h2>
	<p>
		<b>問題:</b>
		<%=question_text%></p>
	<p>
		<b>選択肢:</b>
	</p>
	<form action="JudgeServlet" method="get">
		<p>
			<button type="submit" name="choice" id="choice1" value = 1><%=choice1%></button>
		</p>
		<p>
			<button type="submit" name="choice" id="choice2" value = 2><%=choice2%></button>
		</p>
		<p>
			<button type="submit" name="choice" id="choice3" value = 3><%=choice3%></button>
		</p>
		<p>
			<button type="submit" name="choice" id="choice4" value = 4><%=choice4%></button>
		</p>

	</form>

	<!-- <ul>
		<li><%=choice1%></li>
		<li><%=choice2%></li>
		<li><%=choice3%></li>
		<li><%=choice4%></li>
			<p>
		<b>正解:</b>
		<%=answer%></p>
	<p>
		<b>解説:</b>
		<%=explanation%></p>
	</ul>
	 -->


</body>
</html>
