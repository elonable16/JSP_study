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
<%
	if(session.getAttribute("m_id")!=null){
%>
<%@include file ="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String bm_num = request.getParameter("bm_num");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql="";
	String m_id = "";
	String m_name ="";
	String bm_subject = "";
	String bm_contents = "";
	String bm_date ="";
	int bm_cnt = 0;
	String bm_ip = "";
	int bs_num = 0;
	String bs_contents = "";
	String bs_date = "";
	String bs_ip = "";
	String bs_name ="";
	String bs_id ="";
		
	try{
		sql = "select m.m_id, m.m_name, bm.bm_subject,";
		sql += "bm.bm_contents, bm.bm_date, bm.bm_cnt,bm.bm_ip";
		sql += " from member m, board_main bm";
		sql += " where m.m_id = bm.m_id and bm.bm_num = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bm_num));

		rs = pstmt.executeQuery();
		
		rs.next();
		m_id = rs.getString("m_id");
		m_name = rs.getString("m_name");
		bm_subject = rs.getString("bm_subject");
		bm_contents = rs.getString("bm_contents");
		bm_date = rs.getString("bm_date");
		bm_cnt = rs.getInt("bm_cnt");
		bm_ip = rs.getString("bm_ip");
		rs.close();
		pstmt.close();
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
				<form method = "post" action="./update_ok.jsp">
					<table>
						<tr>
							<td colspan="2" class = "td_title_long">게시글 수정하기</td>
						</tr>
						<tr>
							<td class = "td_title_base">번호</td>
							<td class = "td_contents">
								<p><%= bm_num%><p>
								<input type="hidden" name = "bm_num" value="<%=bm_num%>">
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">제목</td>
							<td class = "td_contents">
								<p><input type="text" name = "bm_subject" value="<%=bm_subject%>"></p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">날짜</td>
							<td class = "td_contents">
								<p><%= bm_date%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">조회수</td>
							<td class = "td_contents">
								<p><%= bm_cnt%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">작성자</td>
							<td class = "td_contents">
								<p><%= m_name%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_base">IP</td>
							<td class = "td_contents">
								<p><%= bm_ip%><p>
							</td>
						</tr>
						<tr>
							<td class = "td_title_big">내용</td>
							<td class = "td_contents_big">
								<textarea cols="70" rows="10" name="bm_contents"><%=bm_contents%></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class = "td_title_long">
								<p>
									<button><a href = "./list.jsp">리스트</a></button>
									<input type="submit" value="저장하기">
								</p>
							</td>
						</tr>
<%
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

					</table>
				</form>
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