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
	String id = request.getParameter("id");
	String name = request.getParameter("name");
%>
	<jsp:useBean id="person" class = "com.cbnu.Person" scope="request"/>
	<jsp:setProperty property="id" name ="person" value="<%=Integer.parseInt(id)%>"></jsp:setProperty>
	<jsp:setProperty property="name" name="person" value="<%=name %>"></jsp:setProperty>
	<p> 아이디: <%=person.getId() %></p>
	<p> 이 름: <%=person.getName() %></p>
</body>
</html>