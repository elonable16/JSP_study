<%@page import="com.sun.net.httpserver.Authenticator.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.cbnu.MyDate" %>
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
		request.setCharacterEncoding("utf-8");
		
		String p_code = request.getParameter("p_code");
		String cs_cnt = request.getParameter("cs_cnt");
		String m_id = (String)session.getAttribute("m_id");
		int cm_code =0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		try{
			sql = "select count(cm_code) from cart_main where m_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt_cm_code = rs.getInt(1);
			if(cnt_cm_code > 0){ // 기존에 있는지 여부 확인
				rs.close();
				pstmt.close();
				sql = "select * from cart_main where m_id = ? order by cm_date desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				rs.next();
				cm_code = rs.getInt("cm_code");
				rs.close();
				pstmt.close();
			}else{//신규 cart_main 레코드 추가
				rs.close();
				pstmt.close();
				sql = "insert into cart_main values(seq_cm_code.nextval,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,m_id);
				pstmt.setString(2,MyDate.getDate());
				pstmt.executeUpdate();
				pstmt.close();
				// cm_code 확인
				sql = "select * from cart_main where m_id = ? order by cm_date desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, m_id);
				rs = pstmt.executeQuery();
				rs.next();
				cm_code = rs.getInt("cm_code");
				rs.close();
				pstmt.close();
			}
			
			sql = "select count(cs_code) from cart_sub where cm_code = ? and p_code = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cm_code);
			pstmt.setInt(2, Integer.parseInt(p_code));
			rs = pstmt.executeQuery();
			rs.next();
			int cnt_cs_code = rs.getInt(1);
			rs.close();
			pstmt.close();
			if(cnt_cs_code > 0) // 수량 업데이트 
			{
				sql = "update cart_sub set cs_cnt = cs_cnt +? where cm_code = ? and p_code = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,Integer.parseInt(cs_cnt));
				pstmt.setInt(2,cm_code);
				pstmt.setInt(3,Integer.parseInt(p_code));
				pstmt.executeUpdate();
			}else { // 생성
				sql = "insert into cart_sub values(seq_cs_code.nextval,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,cm_code);
				pstmt.setInt(2,Integer.parseInt(p_code));
				pstmt.setInt(3,Integer.parseInt(cs_cnt));
				pstmt.executeUpdate();
			}
		}catch(Exception e){
			System.out.println(e.toString());
%>
			<script>
			alert("장바구니 담기에 실패했습니다.");
			location.href = "./view.jsp?p_code=<%= p_code%>";
			</script>
<%
		}finally{
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			System.out.println("정상적으로 저장완료");
			response.sendRedirect("./cart_list.jsp");
		}
%>
<%

	}else{
		response.sendRedirect("../member/login.jsp");
	}

%>
</body>
</html>