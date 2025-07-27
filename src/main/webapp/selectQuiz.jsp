<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
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
	String choice4 = (String) request.getAttribute("choice4"); // 必要なら追加
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
	<ul>
		<li><%=choice1%></li>
		<li><%=choice2%></li>
		<li><%=choice3%></li>
		<li><%=choice4%></li>
	</ul>
	<p>
		<b>正解:</b>
		<%=answer%></p>
	<p>
		<b>解説:</b>
		<%=explanation%></p>

</body>
</html>
