<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.math.*" %>
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
		<div id="section">
			<div id="article">
				<p class="title">나의 장바구니</p>
				<span class="cart_item_title1">상품코드</span>
				<span class="cart_item_title2">상품명</span>
				<span class="cart_item_title3">단가</span>
				<span class="cart_item_title4">이미지</span>
				<span class="cart_item_title5">수량</span>
				<span class="cart_item_title6">가격</span>
				<br>
<%
				PreparedStatement pstmt = null;
				ResultSet rs =null;
				String sql = "";
				int cm_code =0;
				int chk_cnt = 0; // 카트에 상품이 있는지 검사
				
				try{
					sql = "select m_name, cm.cm_code, cs_code, cs.p_code,p_name,p_price, cs_cnt, p_image ";
					sql += "from cart_main cm, cart_sub cs, product p, member m ";
					sql += "where cm.cm_code = cs.cm_code and cs.p_code = p.p_code  and m.m_id = cm.m_id and cm.m_id = ?";
					sql += "order by cs.cs_code asc";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, (String)session.getAttribute("m_id"));
					rs = pstmt.executeQuery();
					while(rs.next()){
						int p_code = rs.getInt("p_code");
						String p_name = rs.getString("p_name");
						int p_price = rs.getInt("p_price");
						String p_image = rs.getString("p_image");
						int cs_cnt = rs.getInt("cs_cnt");
						cm_code = rs.getInt("cm_code");
						
%>
						<span class="cart_item_contents1"><%=p_code %></span>
						<span class="cart_item_contents2"><%=p_name %></span>
						<span class="cart_item_contents3"><%=p_price %></span>
						<span class="cart_item_contents4"><img src="../product/images/<%=p_image%>.jpg" width = "50px" height ="50px"></span>
						<span class="cart_item_contents5"><%=cs_cnt %></span>
						<span class="cart_item_contents6"><%=cs_cnt*p_price %></span>
						<br>
						
<%
						chk_cnt++;//검사용 변수
					}
					rs.close();
					pstmt.close();
					
					if(chk_cnt>0) {
						sql = "select sum(p.p_price*cs.cs_cnt) ";
						sql += "from product p, cart_sub cs ";
						sql += "where cs.p_code = p.p_code and cm_code = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1,cm_code);
						rs = pstmt.executeQuery();
						rs.next();
						int total = rs.getInt(1);
%>
						<span class="cart_item_contents7">총 금액 :&nbsp <%=total%></span>
						<p>
							<form action="./buy.jsp" method="post">
								<input type ="hidden" name ="cm_code" value="<%=cm_code%>">
								<input type ="submit" value="상품 구매">
							</form>
							<a href="./list.jsp">shop page</a>
						</p>
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