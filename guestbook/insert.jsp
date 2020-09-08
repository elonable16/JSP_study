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
						<td colspan="2" class="td_title_long">방명록 쓰기</td>
					</tr>
					<tr>
						<td class="td_title_base">제목</td>
						<td class="td_contents"><input type="text"
							name="guest_subject"></td>
					</tr>
					<tr>
						<td class="td_title_base">작성자</td>
						<td class="td_contents"><input type="text" name="guest_name">
						</td>
					</tr>
					<tr>
						<td class="td_title_base">비밀번호</td>
						<td class="td_contents"><input type="text"
							name="guest_passwd"></td>
					</tr>
					<tr>
						<td class="td_title_big">내용</td>
						<td class="td_contents_big"><textarea cols="70" rows="10"
								name="guest_contents"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" class="td_title_long"><input type="submit"
							value="저장하기"></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹 프로그래밍</p>
		<p>Copyright(c) 김엘론. All Right Reserved</p>
	</div>
</body>
</html>