<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト不正解画面</title>
</head>
<<<<<<< HEAD
<body class="result-page">
	<%
	// セッションに保存された explanation を取得
	String explanation = (String) session.getAttribute("explanation");
	%>

	<div class="container">
		<!-- 不正解表示 -->
		<h1 class="result-title wrong">不正解</h1>

		<!-- 解説（存在する場合のみ表示） -->
		<div class="result-explanation">
			<%=explanation%>
		</div>

		<!-- 結果画面へボタン -->
		<form action="ResultServlet" method="get">
			<button type="submit" class="result-btn">結果画面へ</button>
		</form>
	</div>
=======
<body>

    <!-- 最後の問題で不正解だった場合のメッセージ -->
    <div>不正解</div>

    <!-- 最終結果ページ（ResultServlet）へ進むボタン -->
    <form action="ResultServlet" method="get">
        <p>
            <input type="submit" value="result" id="resultBtn">
        </p>
    </form>

>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
</body>
</html>
