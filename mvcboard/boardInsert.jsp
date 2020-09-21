<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method ="post" action = "BoardServlet">
		<input type = "hidden" name = "cmd" value = "board_insert">
		<p><input type = "text" name = "b_subject"></p>
		<p><input type = "submit" value = "글쓰기"></p>
	</form>
</body>
</html>