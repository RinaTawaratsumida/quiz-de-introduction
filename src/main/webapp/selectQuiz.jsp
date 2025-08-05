<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Question</title>
</head>
<!-- クイズの問題表示ページ -->
<body class="select-page">

<%
    // サーブレットから渡されたデータを受け取る
    int format = (int) request.getAttribute("format");       // 問題形式
    String question_text = (String) request.getAttribute("question_text"); // 問題文
    String choice1 = (String) request.getAttribute("choice1"); // 選択肢1
    String choice2 = (String) request.getAttribute("choice2"); // 選択肢2
    String choice3 = (String) request.getAttribute("choice3"); // 選択肢3
    String choice4 = (String) request.getAttribute("choice4"); // 選択肢4
    Integer quizCount = (Integer) session.getAttribute("quizCount"); // 現在の問題番号
%>

<div class="quiz-container">
    <!-- 現在の問題数を表示 -->
    <div class="quiz-counter">
        <%= quizCount + 1 %>問目
    </div>

    <!-- 問題文を表示 -->
    <div class="quiz-question">
        <%= question_text %>
    </div>

    <!-- 選択肢をボタンとして表示（押すとJudgeServletに送信） -->
    <form class="quiz-answer-form choice-buttons" action="JudgeServlet" method="get">
        <button type="submit" name="answer" id="choice1" class="choice-btn" value="1"><%= choice1 %></button>
        <button type="submit" name="answer" id="choice2" class="choice-btn" value="2"><%= choice2 %></button>
        <button type="submit" name="answer" id="choice3" class="choice-btn" value="3"><%= choice3 %></button>
        <button type="submit" name="answer" id="choice4" class="choice-btn" value="4"><%= choice4 %></button>
    </form>
</div>

</body>
</html>