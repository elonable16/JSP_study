<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String p_code = request.getParameter("p_code");
%>
	<form method ="post" action ="./imageupload_ok.jsp" enctype="multipart/form-data">
	<input type ="hidden" name = "p_code" value = "<%=p_code %>">
	<input type = "file" name = "p_image"><br>
	<input type = "submit" value="이미지 저장">
	</form>
</body>
</html>