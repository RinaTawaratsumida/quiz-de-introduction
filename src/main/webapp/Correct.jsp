<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>正解画面</title>
</head>
<body>

	<!-- 正解のメッセージを表示 -->
	<div>正解</div>

	<%
		// セッションから解説文を取得
		String explanation = (String) session.getAttribute("explanation");
	%>

	<!-- 正解の解説を表示 -->
	<p><%= explanation %></p>

	<!-- 次の問題へ進むボタン -->
	<form action="QuizServlet" method="get">
		<p>
			<input type="submit" value="next" id="nextBtn">
		</p>
	</form>

</body>
</html>