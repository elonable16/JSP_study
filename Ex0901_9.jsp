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
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set name = ?, passwd = ? where id =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, passwd);			
			pstmt.setInt(3,iid);
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