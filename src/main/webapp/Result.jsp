<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結果画面</title>
<link rel="stylesheet" href="style.css">
</head>
<!-- 結果画面のデザイン用クラスを適用 -->
<body class="result-page">

    <%
        // セッションから正解数・不正解数・出題数を取得
        Integer correctCount = (Integer) session.getAttribute("correctCount");   // 正解数
        Integer incorrectCount = (Integer) session.getAttribute("incorrectCount"); // 不正解数
        Integer quizCount = (Integer) session.getAttribute("quizCount");         // 総問題数

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

</body>
</html>