<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./guestbook.css">
</head>
<body>
<%@include file ="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String guest_num = request.getParameter("guest_num");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	String guest_name = "";
	String guest_subject = "";
	String guest_contents = "";
	String guest_date = "";
		
	try{
		sql = "select * from guestbook where guest_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(guest_num));
		rs = pstmt.executeQuery();
		rs.next();
		guest_name = rs.getString("guest_name");
		guest_subject = rs.getString("guest_subject");
		guest_contents = rs.getString("guest_contents");
		guest_contents = guest_contents.replace("\n", "<br>");
		guest_date = rs.getString("guest_date");
		System.out.println("data load ok");
		
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
				<form method ="post" action = "./insert_ok.jsp">
					<table>
						<tr>
							<td colspan="2" class = "td_title_long">방명록</td>
						</tr>
						<tr>
							<td class = "td_title_base">번호</td>
							<td class = "td_contents">
								<p><%= guest_num%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">제목</td>
							<td class = "td_contents">
								<p><%= guest_subject%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">날짜</td>
							<td class = "td_contents">
								<p><%= guest_date%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">작성자</td>
							<td class = "td_contents">
								<p><%= guest_name%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_big">내용</td>
							<td class = "td_contents_big">
								<p><%= guest_contents%><p>
							</td>
						</tr>
						<tr>
							<td colspan="2" class = "td_title_long">
								<p>
									<a href = "./list.jsp">[리스트]</a>&nbsp;
									<a href = "./update.jsp?guest_num=<%=guest_num%>">[수정]</a>
									<a href = "./delete.jsp?guest_num=<%=guest_num%>">[삭제]</a>									
								</p>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹 프로그래밍</p>
		<p>Copyright(c) 김엘론. All Right Reserved</p>
	</div>
</body>
</html>