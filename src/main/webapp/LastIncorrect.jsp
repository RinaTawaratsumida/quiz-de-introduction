<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト不正解画面</title>
</head>
<body>

    <!-- 最後の問題で不正解だった場合のメッセージ -->
    <div>不正解</div>

    <!-- 最終結果ページ（ResultServlet）へ進むボタン -->
    <form action="ResultServlet" method="get">
        <p>
            <input type="submit" value="result" id="resultBtn">
        </p>
    </form>

</body>
</html>