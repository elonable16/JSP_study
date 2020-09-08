<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
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
<%@ include file = "./dbconn.jsp" %>
<%
	System.out.println("update_sub_ok_connected");
	request.setCharacterEncoding("utf-8");
	String m_id = (String)session.getAttribute("m_id");
	String bm_num = request.getParameter("bm_num");
	String bs_num = request.getParameter("bs_num");
	String bs_contents = request.getParameter("bs_contents");
	Calendar cal = Calendar.getInstance(); //싱글톤
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH)+1;
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	String bs_date = String.format("%4d-%02d-%02d %02d:%02d:%02d",yy,mm,dd,hh,ms,ss);
	//String guest_date = yy + "-" + mm + "-" + dd + " " + hh + ":" + ms + ":" + ss;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	try{
		sql = "select count(*) from board_sub where m_id = ? and bm_num = ? and bs_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setInt(2, Integer.parseInt(bm_num));
		pstmt.setInt(3, Integer.parseInt(bs_num));
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1);
		if(cnt == 1){
			rs.close();
			pstmt.close();
			sql = "update board_sub set bs_contents = ?, bs_date = ? where bm_num = ? and bs_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bs_contents);
			pstmt.setString(2, bs_date);
			pstmt.setInt(3, Integer.parseInt(bm_num));
			pstmt.setInt(4, Integer.parseInt(bs_num));
			pstmt.executeUpdate();
		}else{
%>
		<script>
				alert("댓글을 수정할 수 없습니다.");
				//history.back();
				location.href = "./view.jsp?bm_num=<%=bm_num%>";
		</script>
<%
		}
	}catch(Exception e){
		System.out.println(e.toString());
%>
		<script>
		alert("댓글 저장에 실패했습니다.");
		location.href = "./view.jsp?bm_num=<%=bm_num%>";
		</script>
<%
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
		System.out.println("정상적으로 저장완료");
		response.sendRedirect("./view.jsp?bm_num="+bm_num);
	}
	
%>
<%
	}else{
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>