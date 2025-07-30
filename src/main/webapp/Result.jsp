<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結果画面</title>
</head>
<body>
<%
    Integer correctCount = (Integer) session.getAttribute("correctCount");
    Integer incorrectCount = (Integer) session.getAttribute("incorrectCount");
    Integer quizCount = (Integer) session.getAttribute("quizCount");

    double accuracy = 0;
    accuracy = ((double) correctCount / quizCount) * 100;
%>

<p>お疲れ様でした</p>
<p>正解数: <%= correctCount %></p>
<p>誤答数: <%= incorrectCount %></p>
<p>正答率: <%= String.format("%.1f", accuracy) %>%</p>

</body>
</html>