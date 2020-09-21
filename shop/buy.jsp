<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
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
		
		String cm_code = request.getParameter("cm_code");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		try{
			sql = "insert into account_main values(";
			sql += "seq_am_code.nextval,?,?,'A')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,(String)session.getAttribute("m_id"));
			pstmt.setString(2,MyDate.getDate());
			pstmt.executeUpdate();
			pstmt.close();
			
			sql = "insert into account_sub ";
			sql += "select seq_as_code.nextval,";
			sql+= "seq_am_code.currval, p_code, cs_cnt from cart_sub where cm_code =?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cm_code));
			pstmt.executeUpdate();
			System.out.print("ok");
			pstmt.close();
			
			sql = "delete from cart_sub where cm_code=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cm_code));
			pstmt.executeUpdate();
			System.out.print("ok");
			pstmt.close();
			
			sql = "delete from cart_main where cm_code=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(cm_code));
			pstmt.executeUpdate();
			System.out.print("ok");
			pstmt.close();
			
		}catch(Exception e){
			System.out.println(e.toString());
%>
			<script>
			alert("구매에 실패했습니다.");
			location.href = "./cart_list.jsp";
			</script>
<%
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			System.out.println("정상적으로 구매완료");
			%>
			<script>
			alert("구매요청 되었습니다.");
			location.href = "./list.jsp";
			</script>
<%
		}
%>
<%

	}else{
		response.sendRedirect("../member/login.jsp");
	}

%>
</body>
</html>