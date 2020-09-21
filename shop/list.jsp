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
<%
	String pagenum = request.getParameter("pagenum");
	int ipagenum; // 현재 페이지
	int pagesize = 9; // 페이징 단위
	int startpage = 1; // 첫번째 페이지 번호
	int endpage = 0; // 해당 그룹 마지막 페이지 번호
	int lastpage = 0; // 전체레코드의 마지막 페이지
	int groupsize = 5;
	try{
		if (pagenum ==null){
			ipagenum = 1;
		} else{
			ipagenum = Integer.parseInt(pagenum);
		}
	}catch(Exception e){
		ipagenum = 1;
	}
	// 페이지를 받는다????
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
				<p class="title">Elon's shop</p>
				<table>
<%
				PreparedStatement pstmt = null;
				ResultSet rs =null;
				String sql = "";
				
				try{
					sql = "select count(p_code) from product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					rs.next();
					int total = rs.getInt(1);//전체 레코드 개수
					rs.close();
					pstmt.close();
					
					lastpage = (total-1)/pagesize + 1;
					startpage = (ipagenum - 1)/groupsize * groupsize + 1; 
					endpage = startpage + groupsize -1;
					
					sql = "select * from ";
					sql += "(select * from ";
					sql += "(select rownum as SEQ, p_code, p_name, p_price,p_image from";
					sql += "(select * from product order by p_code desc)";
					sql += " )where SEQ >= ? "; // 페이지 번호
					sql += ")where rownum <=?"; // 페이지 단위
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, (ipagenum-1)*pagesize+1);
					pstmt.setInt(2, pagesize);
					rs = pstmt.executeQuery();
					int count = 0; // 테이블의 행, 열 위치 결정
					while(rs.next()){
						int p_code = rs.getInt("p_code");
						String p_name = rs.getString("p_name");
						String p_price = rs.getString("p_price");
						String p_image = rs.getString("p_image");
						if(count %3== 0){
							
%>
							<tr>
<%
						}
%>
								<td class="td_shop_item">
									<table>
										<tr>
											<td class= "td_shop_item_image">
												<a href="./view.jsp?p_code=<%=p_code %>">
													<img src="../product/images/<%=p_image%>.jpg" width="240px" height="240px">
												</a>	
											</td>
										</tr>
										<tr>
											<td class= "td_shop_item_name">
												<p><%= p_name %></p>
											</td>
										</tr>
										<tr>
											<td class= "td_shop_item_price">
												<p><%= p_price %></p>
											</td>
										</tr>
									</table>
								</td>
<%
						// else if 로 안만들었을 경우에는 코드상의 위험성이 있을 수 있다.
						if(count %3== 2){
%>
							</tr>
<%
						}
						count++;
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
					
				</table>
				<br>
<%
				if(startpage>1)
				{
%>
				<span><a href = "./list.jsp?pagenum=<%=startpage - groupsize %>">◀</a></span>
<%
				}
				for(int i = startpage; i <= endpage;i++){
					if(i > lastpage){
						break;
					}
%>
				<span><a href = "./list.jsp?pagenum=<%= i%>">[<%= i%>]</a></span>
<%
				}
				if(endpage<lastpage){
%>
				<span><a href = "./list.jsp?pagenum=<%=startpage + groupsize %>">▶</a></span>
<%
				}
%>

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