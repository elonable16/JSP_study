<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./member.css">
<script>
	function imgproc(p_code){
		window.open('./imageupload.jsp?p_code='+p_code,'','width=300px height=300px');
	}
</script>
</head>
<body>
<%
	if(session.getAttribute("m_id")!=null){
%>
<%@include file ="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String p_code = request.getParameter("p_code");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	String p_name = "";
	int p_price=0;
	String p_image ="";
	String p_stat ="";
		
	try{
		sql = "select * from product where p_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(p_code));

		rs = pstmt.executeQuery();
		
		rs.next();
		p_name = rs.getString("p_name");
		p_price = rs.getInt("p_price");
		p_image = rs.getString("p_image");
		p_stat = rs.getString("p_stat");
					
	}catch(Exception e){
		System.out.println(e.toString());
	}finally{
		if(rs!=null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
%>
		
	<div id="top_nav">
		<div id="main_gnb">
			<ul>
				<li><a href="#">메뉴1</a></li>
				<li><a href="#">메뉴2</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
	<div id="header">
		<img src="http://placeimg.com/960/150/nature" alt="">
		<h1>JSP 웹 프로그래밍</h1>
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
				<table>
					<tr>
						<td colspan="2" class = "td_title_long">상품 정보</td>
					</tr>
					<tr>
						<td class = "td_title_base">상품코드</td>
						<td class = "td_contents">
							<p><%= p_code%><p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">상품명</td>
						<td class = "td_contents">
							<p><%= p_name%><p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">가격</td>
						<td class = "td_contents">
							<p><%=p_price%><p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">상품이미지</td>
						<td class = "td_contents">
							<p><img src="./images/<%=p_image%>.jpg" width = "600",height ="600"><p>
							<p><input type="button" value="이미지업로드" onclick="imgproc('<%=p_code%>');"></p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">상태</td>
						<td class = "td_contents">
							<p><%= p_stat%><p>
						</td>
					</tr>
					<tr>
						<td colspan="2" class = "td_title_long">
							<p>
								<a href = "./list.jsp">[리스트]</a>&nbsp;
								<a href = "./update.jsp?p_code=<%=p_code%>">[수정]</a>
							</p>
						</td>
					</tr>	
				</table>
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