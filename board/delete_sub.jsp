<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="./dbconn.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String bm_num = request.getParameter("bm_num");
	String bs_num = request.getParameter("bs_num");
	String m_id = (String)session.getAttribute("m_id");
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	try{
		sql = "select count(*) from board_sub where m_id = ? and bm_num = ? and bs_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setInt(2, Integer.parseInt(bm_num));
		pstmt.setInt(3, Integer.parseInt(bs_num));
		rs = pstmt.executeQuery();
		rs.next();
		cnt = rs.getInt(1);
		if(cnt == 1){
			rs.close();
			pstmt.close();
			sql = "delete from board_sub where m_id = ? and bm_num = ? and bs_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setInt(2, Integer.parseInt(bm_num));
			pstmt.setInt(3, Integer.parseInt(bs_num));
			pstmt.executeUpdate();
		}else{
%>
		<script>
				alert("댓글을 삭제할 수 없습니다.");
				//history.back();
				location.href = "./view.jsp?bm_num=<%=bm_num%>";
		</script>
<%
		}
	}catch(Exception e){
		System.out.println(e.toString());
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
		response.sendRedirect("./view.jsp?bm_num="+bm_num);
	}
%>
</body>
</html>