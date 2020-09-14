<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class = "com.cbnu.Person" scope="request"/>
	<p> 아이디 : <%=person.getId()%></p>
	<p> 이름: <%=person.getName() %></p>
	<%
		person.setId(111111);
		person.setName("감사감사");
	%>
	<jsp:include page="./Ex0914_1.jsp"/>
</body>
</html>