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
		
		String p_name = request.getParameter("p_name");
		String p_price = request.getParameter("p_price");
		
		PreparedStatement pstmt = null;
		String sql = "";
		try{
			sql = "insert into product values(seq_p_code.nextval,?,?,'default','A')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p_name);
			pstmt.setString(2, p_price);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println(e.toString());
%>
			<script>
			alert("댓글 저장에 실패했습니다.");
			location.href = "./insert.jsp";
			</script>
<%
		}finally{
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			System.out.println("정상적으로 저장완료");
			response.sendRedirect("./list.jsp");
		}
		
%>
<%

	}else{
		response.sendRedirect("../member/login.jsp");
	}

%>
</body>
</html>