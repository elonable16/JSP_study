<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.cbnu.MyDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "./dbconn.jsp" %>
<%
	if(session.getAttribute("m_id")!=null){
%>
<%
		request.setCharacterEncoding("utf-8");
		
		String am_code = request.getParameter("am_code");
		String am_stat = request.getParameter("am_stat");
		
		PreparedStatement pstmt = null;
		String sql = "";
		try{
			sql = "update account_main set am_stat =? where am_code =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, am_stat);
			pstmt.setInt(2, Integer.parseInt(am_code));
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println(e.toString());
%>
			<script>
			alert("상태변경에 실패했습니다.");
			location.href = "./order_list.jsp";
			</script>
<%
		}finally{
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			response.sendRedirect("./order_list.jsp");
		}
		
%>
<%

	}else{
		response.sendRedirect("../member/login.jsp");
	}

%>
</body>
</html>