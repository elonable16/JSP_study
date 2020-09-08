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
	System.out.println("insert_ok connected");
	request.setCharacterEncoding("utf-8");
	
	String guest_subject = request.getParameter("guest_subject");
	String guest_name = request.getParameter("guest_name");
	String guest_passwd = request.getParameter("guest_passwd");
	String guest_contents = request.getParameter("guest_contents");
	Calendar cal = Calendar.getInstance(); //싱글톤
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH)+1;
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	String guest_date = String.format("%4d-%02d-%02d %02d:%02d:%02d",yy,mm,dd,hh,ms,ss);
	//String guest_date = yy + "-" + mm + "-" + dd + " " + hh + ":" + ms + ":" + ss;
	
	PreparedStatement pstmt = null;
	String sql = "";
	try{
		sql = "insert into guestbook values(auto_num.nextval,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guest_name);
		pstmt.setString(2, guest_subject);
		pstmt.setString(3, guest_contents);
		pstmt.setString(4, guest_passwd);
		pstmt.setString(5, guest_date);
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
</body>
</html>