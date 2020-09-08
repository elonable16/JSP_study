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
<%@ include file = "./dbconn.jsp" %>
<%
	if(session.getAttribute("m_id")!=null){
%>
<%
		System.out.println("insert_ok connected");
		request.setCharacterEncoding("utf-8");
		
		String m_id = request.getParameter("m_id");
		String bm_subject = request.getParameter("bm_subject");
		String bm_contents = request.getParameter("bm_contents");

		Calendar cal = Calendar.getInstance(); //싱글톤
		int yy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		int hh = cal.get(Calendar.HOUR);
		int ms = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		String bm_date = String.format("%4d-%02d-%02d %02d:%02d:%02d",yy,mm,dd,hh,ms,ss);
		//String guest_date = yy + "-" + mm + "-" + dd + " " + hh + ":" + ms + ":" + ss;
		String bm_ip = request.getRemoteAddr();
		
		PreparedStatement pstmt = null;
		String sql = "";
		try{
			sql = "insert into board_main values(bm_autonum.nextval,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, bm_subject);
			pstmt.setString(3, bm_contents);
			pstmt.setString(4, bm_date);
			pstmt.setString(5, bm_ip);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println(e.toString());
			
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