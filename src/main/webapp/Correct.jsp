<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>正解画面</title>
</head>
<body>
	<%
		String explanation = request.getAttribute("explanation");
	%>
<p><%>explanation<%></p>
</body>
</html>