<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String guest_num = request.getParameter("guest_num");
	String guest_passwd = request.getParameter("guest_passwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	try{
		sql = "select count(guest_num) from guestbook where guest_num = ? and guest_passwd =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(guest_num));
		pstmt.setString(2, guest_passwd);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); // alias를 하는 경우에는 이름으로 가능
		if(cnt == 1){//삭제
			sql = "delete from guestbook where guest_num = ? and guest_passwd =?";
			pstmt = conn.prepareStatement(sql); // 재사용해서... 노란색이 뜸.
			pstmt.setInt(1, Integer.parseInt(guest_num));
			pstmt.setString(2, guest_passwd);
			pstmt.executeUpdate();
			response.sendRedirect("./list.jsp");
			System.out.println("selected data delete ok");
		}else{//삭제 불가능
			response.sendRedirect("./view.jsp?guest_num="+guest_num);
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