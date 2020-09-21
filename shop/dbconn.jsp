<%@ page import = "java.sql.*" %>
<%
	Connection conn = null;
	String url = "jdbc:oracle:thin:@192.168.0.225:1521:oracle1";
	String user = "elon";
	String password = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url,user,password);
	System.out.println("connect to datebase");
%>
