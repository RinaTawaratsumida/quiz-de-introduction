<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>正解画面</title>
</head>
<body>
<div>正解</div>
	<%
		String explanation = request.getAttribute("explanation");
	%>
	<p><%=explanation%></p>
	<form action="QuizServlet" method="get">
		<p>
			<button type="submit" name="select" id="choice1" value = 1><%=choice1%></button>
		</p>
	</form>
</body>
</html>