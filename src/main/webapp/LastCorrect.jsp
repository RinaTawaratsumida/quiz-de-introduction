<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト正解画面</title>
</head>
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
</body>
</html>