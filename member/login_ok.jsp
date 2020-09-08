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
	<%@ include file="./dbconn.jsp"%>
	<%
	request.setCharacterEncoding("utf-8");
	String m_id = request.getParameter("m_id");
	String m_passwd = request.getParameter("m_passwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	try{
		sql = "select count(m_id) from member where m_id = ? and m_passwd =? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setString(2, m_passwd);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1);
		//String m_name = rs.getString("m_name");
		if (cnt == 1) {//아이디 패스워드 일치.
			session.setAttribute("m_id",m_id);
			//session.setAttribute("m_name",m_name);
			response.sendRedirect("../main.jsp");
			System.out.println("log-in ok");
		}else{//수정 오류
			System.out.println("log-in fail");
%>
			<script>
				alert("아이디 또는 패스워드가 틀립니다.");
				history.back();
			</script>
<%
		}
	}catch(Exception e){
		System.out.println(e.toString());
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	}
%>
</body>
</html>