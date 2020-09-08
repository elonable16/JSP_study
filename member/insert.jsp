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
	<div id="top_nav">
		<div id="login_info">
			<ul>
			<%
				if(session.getAttribute("m_id") != null){
			
			%>
					<li><a><%=(String)session.getAttribute("m_id") %></a></li>
					<li><a href="./member/logout.jsp">logout</a></li>
			<%
				}else{
			%>
					<li><a href="./login.jsp">login</a></li>
					<li><a href="./insert.jsp">회원가입</a></li>
			<%
				}
			%>

			</ul>
		</div>
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
				<form action="./insert_ok.jsp" , method="post">
					<table>
						<tr>
							<td colspan="2" class="td_title_long">회원 가입</td>
						</tr>
						<tr>
							<td class="td_title_base">ID</td>
							<td class="td_contents">
								<input type="text" name="m_id">
							</td>
						</tr>
						<tr>
							<td class="td_title_base">NAME</td>
							<td class="td_contents">
								<input type="text" name="m_name">
							</td>
						</tr>
						<tr>
							<td class="td_title_base">ADDRESS</td>
							<td class="td_contents">
								<input type="text" name="m_addr">
							</td>
						</tr>
						<tr>
							<td class="td_title_base">PHONE NUMBER</td>
							<td class="td_contents">
								<input type="text" name="m_phone">
							</td>
						</tr>
						<tr>
							<td class="td_title_base">PASSWORD</td>
							<td class="td_contents">
								<input type="password" name="m_passwd">
							</td>
						</tr>
						<tr>
							<td colspan="2" class="td_title_long"><input type="submit"
								value="가입하기"></td>
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