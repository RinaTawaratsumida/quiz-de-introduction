<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<link rel="stylesheet" href="style.css">
<title>クイズ結果</title>
=======
<title>結果画面</title>
<link rel="stylesheet" href="style.css">
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
</head>
<<<<<<< HEAD
<body class="result-page">
<%
    Integer correctCount = (Integer) session.getAttribute("correctCount");
    Integer incorrectCount = (Integer) session.getAttribute("incorrectCount");
    Integer quizCount = (Integer) session.getAttribute("quizCount");
=======
<!-- 結果画面のデザイン用クラスを適用 -->
<body class="result-page">
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git

<<<<<<< HEAD
    double accuracy = 0;
    if (quizCount != null && quizCount > 0) {
        accuracy = ((double) correctCount / quizCount) * 100;
    }
%>
=======
    <%
        // セッションから正解数・不正解数・出題数を取得
        Integer correctCount = (Integer) session.getAttribute("correctCount");   // 正解数
        Integer incorrectCount = (Integer) session.getAttribute("incorrectCount"); // 不正解数
        Integer quizCount = (Integer) session.getAttribute("quizCount");         // 総問題数
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git

<<<<<<< HEAD
<div class="container">
    <p class="result-title">お疲れ様でした！</p>

    <p>正解数: <strong><%= correctCount != null ? correctCount : 0 %></strong></p>
    <p>誤答数: <strong><%= incorrectCount != null ? incorrectCount : 0 %></strong></p>
    <p>正答率: <strong><%= String.format("%.1f", accuracy) %> %</strong></p>

    <form action="ResetServlet" method="get">
        <button type="submit" class="result-btn">リセットして最初に戻る</button>
    </form>
</div>
=======
        // 正答率を計算（小数点1桁までに整形予定）
        double accuracy = 0;
        accuracy = ((double) correctCount / quizCount) * 100;
    %>

    <div class="result-container">
        <!-- 結果メッセージとスコア表示 -->
        <p>お疲れ様でした</p>
        <p>正解数: <%= correctCount %></p>
        <p>誤答数: <%= incorrectCount %></p>
        <p>正答率: <%= String.format("%.1f", accuracy) %>%</p>

        <!-- クイズをリセットして最初に戻るボタン -->
        <form action="RisetServlet" method="get">
            <input type="submit" value="reset" id="startBtn">
        </form>
    </div>

>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
</body>
</html>
