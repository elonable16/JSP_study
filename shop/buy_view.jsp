<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.math.*" %>
<%@ page import ="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./member.css">
</head>
<body>
<%@include file ="./dbconn.jsp" %>
<%
	if(session.getAttribute("m_id")!=null){
%>
	<div id="top_nav">
		<div id="login_info">
			<ul>
			<%
				if(session.getAttribute("m_id") != null){
			
			%>
					<li><a><%=(String)session.getAttribute("m_id") %></a></li>
					<li><a href="../member/logout.jsp">logout</a></li>
			<%
				}else{
			%>
					<li><a href="./member/login.jsp">login</a></li>
					<li><a href="./member/insert.jsp">회원가입</a></li>
			<%
				}
			%>
			</ul>
		</div>
		<div id="main_gnb">
			<ul>
				<li><a href="../main.jsp">초기화면</a></li>
				<li><a href="../guestbook/list.jsp">방명록</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
	<div id="header">
		<img src="http://placeimg.com/960/150/nature" alt="">
		<h1>ELON의 JSP 웹</h1>
	</div>
	<div id="nav">
		<div id="main_lnb">
			<ul>
				<li><a href="#">메뉴1</a></li>
				<li><a href="#">메뉴2</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="aside">
			<p>
				<a href="#">메뉴1</a>
			</p>
			<p>
				<a href="#">메뉴2</a>
			</p>
			<p>
				<a href="#">메뉴3</a>
			</p>
			<p>
				<a href="#">메뉴4</a>
			</p>
		</div>
<%
	request.setCharacterEncoding("UTF-8");
	String m_id = (String)session.getAttribute("m_id");
	String am_code = request.getParameter("am_code");
	String sql ="";
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	DecimalFormat comma = new DecimalFormat("###,###");
	
	 
	try{
		sql = "select m.m_name, m.m_addr, m.m_phone ";
		sql +="from member m ";
		sql +="where m.m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		rs.next();
		String m_name = rs.getString("m_name");
		String m_addr = rs.getString("m_addr");
		String m_phone = rs.getString("m_phone");
		rs.close();
		pstmt.close();
%>
		<div id="section">
			<div id="article">
				<table>
					<tr>
						<td colspan="2" class="td_title_long">주문자 세부정보</td>
					</tr>
					<tr>
						<td class="td_title_base">이름</td>
						<td class="td_contents"><%=m_name%></td>
					</tr>
					<tr>
						<td class="td_title_base">주소</td>
						<td class="td_contents"><%=m_addr%></td>
					</tr>
					<tr>
						<td class="td_title_base">핸드폰 번호</td>
						<td class="td_contents"><%=m_phone%></td>
					</tr>
				</table>
				<table>
					<tr>
						<td class="td_title_long">주문코드</td>
						<td class="td_contents"><%=am_code%></td>
					</tr>

<%
	sql = "select sum(p.p_price * acs.as_cnt) ";
	sql += "from account_sub acs, product p ";
	sql += "where p.p_code = acs.p_code and ";
	sql += "acs.am_code = ?";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(am_code));
	rs = pstmt.executeQuery();
	rs.next();
	int order_total = rs.getInt(1);
	rs.close();
	pstmt.close();
%>
					<tr>
						<td colspan="2" class="td_title_long">주문 금액 합계 : <%=comma.format(order_total)+"원" %></td>
					</tr>
				</table>
			
			
				<p class="title">주문자 주문 상품</p>
				<span class="item_title1">주문코드</span>
				<span class="item_title2">주문세부코드</span>
				<span class="item_title3">제품명</span>
				<span class="item_title4">제품가격</span>
				<span class="item_title5">제품수량</span>
				<span class="item_title6">상태</span>
				<br>
<%
		sql = "select acs.as_code, p.p_name, p.p_price, acs.as_cnt,am.am_stat ";
		sql +="from member m, account_main am, account_sub acs, product p ";
		sql +="where am.am_code=? and m.m_id = ? and m.m_id = am.m_id and am.am_code = acs.am_code and acs.p_code = p.p_code";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(am_code));
		pstmt.setString(2, m_id);
		rs = pstmt.executeQuery();
		while(rs.next()){
			int as_code = rs.getInt("as_code");
			String p_name = rs.getString("p_name");
			int p_price = rs.getInt("p_price");
			int as_cnt = rs.getInt("as_cnt");
			String am_stat = rs.getString("am_stat");
						
%>
				<span class="item_contents1"><%=am_code %></span>
				<span class="item_contents2"><%=as_code %></span>
				<span class="item_contents3"><%=p_name %></span>
				<span class="item_contents4"><%=p_price %></span>
				<span class="item_contents5"><%=as_cnt %></span>
				<span class="item_contents6"><%=am_stat %></span>
				<br>
						
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
				<br>				
				<p><a href = "./insert.jsp"></a></p>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹 프로그래밍</p>
		<p>Copyright(c) 김엘론. All Right Reserved</p>
	</div>
<%
	}else{
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>