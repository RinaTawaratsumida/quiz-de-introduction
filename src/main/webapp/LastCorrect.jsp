<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト正解画面</title>
</head>
<<<<<<< HEAD
<body class="result-page">
	<div class="container">
		<!-- 正解表示 -->
		<h1 class="result-title">正解！</h1>
		<%
		String answer = (String) session.getAttribute("answer");
		String explanation = (String) session.getAttribute("explanation");
		%>
		<!-- 解説 -->
		<div class="result-explanation">
			<%=explanation%>
		</div>
		<!-- 結果へボタン -->
		<form action="ResultServlet" method="get">
			<button type="submit" class="next-btn" value="result">結果画面へ</button>
		</form>
	</div>
=======
<body>

    <!-- 最後の問題に正解したときのメッセージ -->
    <div>正解</div>

    <%
        // セッションから解説文を取得
        String explanation = (String) session.getAttribute("explanation");
    %>

    <!-- 解説文を表示 -->
    <p><%= explanation %></p>

    <!-- 最終結果ページ（ResultServlet）へ進むボタン -->
    <form action="ResultServlet" method="get">
        <p>
            <input type="submit" value="result" id="resultBtn">
        </p>
    </form>

>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
</body>
</html>