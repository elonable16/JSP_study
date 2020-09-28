<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="BoardServlet">
	<input type = "hidden" name = "cmd" value ="board_check_ok">
	<input type = "hidden" name = "b_type" value ="${param.b_type}">	
	<input type = "hidden" name = "b_num" value="${param.b_num}" >
	<p>[${param.b_type}]</p>
	<p>비밀번호를 입력하세요</p>
	<input type="password" name ="b_passwd">
	<input type="submit"	value="다음">
</form>
</body>
</html>