<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>クイズ開始</title>
</head>
<!-- ページ全体に適用するクラスを設定（CSSでデザイン変更可能） -->
<body class="start-page">

	<div id="start">
		<!-- 1つ目のボタン（yasuda） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="yasuda" id="startBtn">
		</form>

		<!-- 2つ目のボタン（tsumi） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="tsumi" id="startBtn">
		</form>

		<!-- 3つ目のボタン（okuyama） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="okuyama" id="startBtn">
		</form>

		<!-- 4つ目のボタン（shibukawa） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="shibukawa" id="startBtn">
		</form>

	</div>
	<!-- ★ここまでクイズ開始画面のボタン配置★ -->

</body>
</html>