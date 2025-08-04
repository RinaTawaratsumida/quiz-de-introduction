<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>クイズ開始</title>
</head>
<body class="start-page">
	<!-- 画面中央コンテナ -->
	<div id="start">
	    <!-- タイトル追加 -->
	    <h1 class="start-title">だれのクイズを始めますか？</h1>
	    
	    <!-- ボタン群 -->
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="yasuda" class="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="tsumi" class="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="okuyama" class="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="shibukawa" class="startBtn">
		</form>
	</div>
</body>
</html>
