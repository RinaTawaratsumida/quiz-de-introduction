<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>

	<%
	int format = (int) request.getAttribute("format");
	String question_text = (String) request.getAttribute("question_text");
	String answer = (String) request.getAttribute("answer");
	%>
	<h2>
		問題形式:<%=format%>
	</h2>
	<p>
		<b>問題:</b><%=question_text%>
	</p>

</body>
</html>