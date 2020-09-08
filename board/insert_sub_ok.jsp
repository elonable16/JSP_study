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
	System.out.println("insert_sub_ok_connected");
	request.setCharacterEncoding("utf-8");
	String m_id = (String)session.getAttribute("m_id");
	String bm_num = request.getParameter("bm_num");
	String bs_contents = request.getParameter("bs_contents");
	String bs_ip = request.getRemoteAddr();
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
	String sql = "";
	try{
		sql = "insert into board_sub values(bs_autonum.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bm_num));
		pstmt.setString(2, m_id);
		pstmt.setString(3, bs_contents);
		pstmt.setString(4, bs_date);
		pstmt.setString(5, bs_ip);
		pstmt.executeUpdate();
		
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