<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>김엘론 페이지</h1>
	<p> 너무신기하다.<p>
	<h3> 선언문 </h3>	
	<%
		int cnt = 5;
	%>
	<h3>스크립트릿</h3>
	<%
		for (int i=0; i<5; i++){
			out.print("<h4> Hello Jsp!!!</h4>");
		}
	%>
	<h3>출력문</h3>
	<h1><%= "변수나 문장 전부 가능" %></h1>
</body>
</html>