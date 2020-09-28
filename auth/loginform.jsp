<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="LoginServlet" method="post">
		<input type="hidden" name="cmd" value="loginok">
		<input type="text" name="ma_id"><br>
		<input type = "password" name = "ma_passwd">
		<input type ="submit" value="확인">
	</form>
</body>
</html>