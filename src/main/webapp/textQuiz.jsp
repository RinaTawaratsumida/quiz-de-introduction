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
    Integer format = (Integer) request.getAttribute("format");
    String question_text = (String) request.getAttribute("question_text");
    String answer = (String) request.getAttribute("answer");
%>

<form action="JudgeServlet" method="get">
    <input type="text" name="answer">
    <input type="submit" value="送信">
</form>

</body>
</html>