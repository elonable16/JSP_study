<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./mvcboard/member.css">
<script>
	function golist(){
		location.href= "./NoticeServlet?cmd=notice_list";
	}
	function linkupdate(num){
		location.href="./NoticeServlet?cmd=notice_update_form&n_num="+ num;
		
	}
	function linkdel(num){
		location.href= "./NoticeServlet?cmd=notice_delete_form&n_num="+ num;
	}
</script>
</head>
<body>
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
						<td colspan="2" class = "td_title_long">상세보기</td>
					</tr>
					<tr>
						<td class = "td_title_base">번호</td>
						<td class = "td_contents">
							<p>${notice.n_num}<p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">작성자</td>
						<td class = "td_contents">
							<p>${notice.n_name}<p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">작성일</td>
						<td class = "td_contents">
							<p>${notice.n_date}<p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">내용</td>
						<td class = "td_contents">${notice.n_contents}</td>
					</tr>
					<tr>
						<td colspan="2" class = "td_title_long">
							<p>
								<input type="button" value = "리스트" onclick = "golist();">
								<input type="button" value = "수정" onclick = "linkupdate(${notice.n_num})">
								<input type="button" value = "삭제" onclick = "linkdel(${notice.n_num})">
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

</body>
</html>