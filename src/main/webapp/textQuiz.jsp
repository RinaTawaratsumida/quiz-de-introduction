<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>記述式クイズ</title>
</head>
<<<<<<< HEAD
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
=======
<body>

	<%
		// サーブレットから渡されたデータを取得
		String question_text = (String) request.getAttribute("question_text"); // 問題文
		Integer quizCount = (Integer) session.getAttribute("quizCount");      // 現在の問題番号
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

		<!-- 記述式の回答フォーム（テキスト入力） -->
		<form class="quiz-answer-form" action="JudgeServlet" method="get">
			<!-- ユーザーの回答を入力 -->
			<input class="quiz-answer-input" type="text" name="answer">
			<!-- 回答を送信するボタン -->
			<input class="quiz-submit" type="submit" value="送信">
		</form>

	</div>
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git

</body>
</html>