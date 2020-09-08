<%@ page import = "java.sql.*" %>
<!-- 삽입되는 문장이기 때문에 불필요한 내용 전부 제거  -->
<%
	Connection conn = null;
	String url = "jdbc:oracle:thin:@192.168.0.225:1521:oracle1";
	String user = "elon";
	String password = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,password);
	System.out.println("connect to datebase");
%>
