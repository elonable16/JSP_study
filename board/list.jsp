<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<p class="title">JSP 웹 프로그래밍</p>
				<span class="item_title1">번호</span>
				<span class="item_title2">제목</span>
				<span class="item_title3">작성자</span>
				<span class="item_title4">작성일</span>
				<br>
<%
				PreparedStatement pstmt = null;
				ResultSet rs =null;
				String sql = "";
				try{
					sql = "select * from board_main order by bm_num desc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						int bm_num = rs.getInt("bm_num");
						String bm_subject = rs.getString("bm_subject");
						String m_id = rs.getString("m_id");
						String bm_date = rs.getString("bm_date");
						bm_date = bm_date.substring(0,10);
%>
						<span class="item_contents1"><%=bm_num %></span>
						<span class="item_contents2"><a href ="./view.jsp?bm_num=<%=bm_num %>"><%=bm_subject %></a></span>
						<span class="item_contents3"><%=m_id %></span>
						<span class="item_contents4"><%=bm_date %></span>
						
<%
					}
					System.out.println("load board_main date ok");
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
				<p><a href = "./insert.jsp">게시판 쓰기</a></p>
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