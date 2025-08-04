<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>クイズ結果</title>
</head>
<body class="result-page">
<%
    Integer correctCount = (Integer) session.getAttribute("correctCount");
    Integer incorrectCount = (Integer) session.getAttribute("incorrectCount");
    Integer quizCount = (Integer) session.getAttribute("quizCount");

    double accuracy = 0;
    if (quizCount != null && quizCount > 0) {
        accuracy = ((double) correctCount / quizCount) * 100;
    }
%>

<div class="container">
    <p class="result-title">お疲れ様でした！</p>

    <p>正解数: <strong><%= correctCount != null ? correctCount : 0 %></strong></p>
    <p>誤答数: <strong><%= incorrectCount != null ? incorrectCount : 0 %></strong></p>
    <p>正答率: <strong><%= String.format("%.1f", accuracy) %> %</strong></p>

    <form action="ResetServlet" method="get">
        <button type="submit" class="result-btn">リセットして最初に戻る</button>
    </form>
</div>
</body>
</html>
