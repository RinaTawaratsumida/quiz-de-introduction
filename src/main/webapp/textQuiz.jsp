<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>記述式クイズ</title>
</head>
<body class="text-page">
<%
    String question_text = (String) request.getAttribute("question_text");
    Integer quizCount = (Integer) session.getAttribute("quizCount");
%>

<div class="quiz-container">
    <!-- 問題番号 -->
    <div class="quiz-counter">
        <%= quizCount + 1 %>問目
    </div>

    <!-- 問題文 -->
    <div class="quiz-question">
        <%= question_text %>
    </div>

    <!-- 記述式回答フォーム -->
    <form class="quiz-answer-form text-form" action="JudgeServlet" method="get">
        <input class="quiz-answer-input" type="text" name="answer" placeholder="ここに回答を入力">
        <button type="submit" class="quiz-submit">送信</button>
    </form>
</div>

</body>
</html>
