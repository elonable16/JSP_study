<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>세션에대한 정보를 얻어오는 예시</h1>
	<p>정보를 받는 페이지와 별도의 페이지.<p>
	<%
		String id = (String)session.getAttribute("id");
		String passwd = (String)session.getAttribute("passward");
		out.print(id + passwd);
		if(request.isRequestedSessionIdValid() == true){
			out.print("세션유효<br>");
		}else {
			out.print("세션 유효하지 않음<br>");
		}
		if(id != null){
			out.print("로그인 됨");
		}else {
			out.print("로그아웃 됨");
		}
	%>
	<%
		Cookie[] cookies = request.getCookies();
		out.print(cookies.length + "<br>");
		for(int i = 0; i<cookies.length; i++){
			out.print(cookies[i].getName() + ":");
			out.print(cookies[i].getValue() + "<br>");
		}
	%>
	
</body>
</html>