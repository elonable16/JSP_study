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
	request.setCharacterEncoding("utf-8");
	String m_id = request.getParameter("m_id");
	String m_name = request.getParameter("m_name");
	String m_addr = request.getParameter("m_addr");
	String m_phone = request.getParameter("m_phone");
	String m_passwd = request.getParameter("m_passwd");
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH)+1;
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	String m_date = String.format("%4d-%02d-%02d %02d:%02d:%02d",yy,mm,dd,hh,ms,ss);
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	try{
		sql = "select count(m_id) from member where m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); // alias를 하는 경우에는 이름으로 가능
		if(cnt == 0){//중복안됨.
			sql = "insert into member values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql); // 재사용해서... 노란색이 뜸.
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_addr);			
			pstmt.setString(4, m_phone);
			pstmt.setString(5, m_passwd);
			pstmt.setString(6, m_date);
			pstmt.setString(7, "y");
			pstmt.executeUpdate();
%>
			<script>
				alert("회원가입이 되었습니다.");
				//location.href = "./login.jsp";
			</script>
<%
			response.sendRedirect("./login.jsp");
			System.out.println("sign-up ok");
		}else{//수정 오류
			System.out.println("sign-up fail");
%>
			<script>
				alert("아이디가 중복되었습니다.");
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