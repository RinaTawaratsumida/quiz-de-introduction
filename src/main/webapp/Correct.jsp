<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>正解画面</title>
</head>
<body>
<div>正解</div>
	<%
		String explanation = (String) request.getAttribute("explanation");
	%>
	<p><%=explanation%></p>
	<form action="QuizServlet" method="get">
		<p>
			<input type ="submit" value="start" id="startBtn">
		</p>
	</form>
</body>
</html>