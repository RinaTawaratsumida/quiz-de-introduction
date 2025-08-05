<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>クイズ開始</title>
</head>
<<<<<<< HEAD
<body class="start-page">
	<!-- 画面中央コンテナ -->
	<div id="start">
	    <!-- タイトル追加 -->
	    <h1 class="start-title">だれのクイズを始めますか？</h1>
	    
	    <!-- ボタン群 -->
=======
<!-- ページ全体に適用するクラスを設定（CSSでデザイン変更可能） -->
<body class="start-page">

	<div id="start">
		<!-- 1つ目のボタン（yasuda） -->
>>>>>>> branch 'feature_yasuda_ver2' of https://github.com/RinaTawaratsumida/quiz-de-introduction.git
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="yasuda" class="startBtn">
		</form>

		<!-- 2つ目のボタン（tsumi） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="tsumi" class="startBtn">
		</form>

		<!-- 3つ目のボタン（okuyama） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="okuyama" class="startBtn">
		</form>

		<!-- 4つ目のボタン（shibukawa） -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="shibukawa" class="startBtn">
		</form>

	</div>
	<!-- ★ここまでクイズ開始画面のボタン配置★ -->

</body>
</html>
