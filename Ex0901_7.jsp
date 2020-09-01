<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@ include file="dbconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		int iid = Integer.parseInt(id);
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		out.print(id + name + passwd);
		Statement stmt = null;
		try {
			String sql = "update member set id ="
						+ iid +", name = '" + name + "',passwd ='"
						+ passwd+"' where id ="+ iid;
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
		} catch (Exception e) {
			System.out.println(e.toString());//오류사항 콘솔 출력
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
			response.sendRedirect("./Ex0901_5.jsp");
		}
	%>
</body>
</html>