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
	if(session.getAttribute("m_id")!=null){
%>
	<%@ include file="./dbconn.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String bm_num = request.getParameter("bm_num");
	String bm_subject = request.getParameter("bm_subject");
	String bm_contents = request.getParameter("bm_contents");
	String m_id = (String)session.getAttribute("m_id");
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	try{
		sql = "select count(bm_num) from board_main where bm_num = ? and m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bm_num);
		pstmt.setString(2, m_id);
		rs = pstmt.executeQuery();
		rs.next();
		cnt = rs.getInt(1);
		if(cnt == 1){
			rs.close();
			pstmt.close();
			sql = "update board_main set bm_subject =?,";
			sql += "bm_contents = ? where bm_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bm_subject);
			pstmt.setString(2, bm_contents);
			pstmt.setInt(3, Integer.parseInt(bm_num));
			pstmt.executeUpdate();
		}else{
%>
		<script>
				alert("게시판을 수정할수 없습니다..");
				history.back();
		</script>
<%
		}
	}catch(Exception e){
		System.out.println(e.toString());
%>
		<script>
				alert("게시판을 수정할수 없습니다..");
				history.back();
		</script>
<%
	}finally{
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
		//response.sendRedirect("./view.jsp?bm_num="+bm_num);
	}
%>
<%
	}else{
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>