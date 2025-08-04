<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>クイズ開始</title>
</head>
<body class = "start-page">
	<!-- ボタンの作成　選択ボタンで出題する問題を選別する-->
	<div id=start>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="yasuda" id="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="tsumi" id="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="okuyama" id="startBtn">
		</form>
		<form action="QuizServlet" method="get">
			<input type="submit" name="name" value="shibukawa" id="startBtn">
		</form>
	</div>
</body>
</html>