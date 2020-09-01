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
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into member values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,iid);
			pstmt.setString(2,name);
			pstmt.setString(3,passwd);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());//오류사항 콘솔 출력
		} finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
			response.sendRedirect("./Ex0901_5.jsp");
		}
	%>
</body>
</html>