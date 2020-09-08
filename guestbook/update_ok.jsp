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
	String guest_name = request.getParameter("guest_name");
	String guest_subject = request.getParameter("guest_subject");
	String guest_contents = request.getParameter("guest_contents");
	String guest_date = request.getParameter("guest_date");
	
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
		if(cnt == 1){//값까지는 정확하게 알수 없음
			sql = "update guestbook set guest_name = ?, guest_subject = ?, guest_contents =? where guest_num = ?";
			pstmt = conn.prepareStatement(sql); // 재사용해서... 노란색이 뜸.
			pstmt.setString(1, guest_name);
			pstmt.setString(2, guest_subject);
			pstmt.setString(3, guest_contents);
			pstmt.setInt(4, Integer.parseInt(guest_num));
			pstmt.executeUpdate();
			response.sendRedirect("./view.jsp?guest_num="+guest_num);
			System.out.println("selected data update ok");
		}else{//수정 오류
			System.out.println("update fail");
			/* out.print("<script>");
			out.print("alert('암호를 확인하세요');");
			out.print("history.back();"); // 뒤로 가기
			out.print("</script>"); // 아래의 코드는 그대로 전부 실행한다. */
		%>
			<script>
				alert("암호를 확인하세요");
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