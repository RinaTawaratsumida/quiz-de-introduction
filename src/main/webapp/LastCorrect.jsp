<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>ラスト正解画面</title>
</head>
<body>
<div>正解</div>
	<%
		String explanation = (String) request.getAttribute("explanation");
	%>
	<p><%=explanation%></p>
	<form action="ResultServlet" method="get">
		<p>
			<input type ="submit" value="result" id="resultBtn">
		</p>
	</form>
</body>
</html>