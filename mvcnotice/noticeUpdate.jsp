<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href="./mvcboard/member.css">
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
			<form method="post" action="BoardServlet">
				<input type="hidden" name = "cmd" value="board_update">
				<table>
					<tr>
						<td colspan="2" class = "td_title_long">글 수정하기</td>
					</tr>
					<tr>
						<td class = "td_title_base">번호</td>
						<td class = "td_contents">
							<p><input type="text" name="b_num" value="${notice.n_num}" readonly="readonly"><p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">제목</td>
						<td class = "td_contents">
							<p><input type="text" name="b_subject" value="${notice.n_subject}"><p>
						</td>
					</tr>
					<tr>
						<td class = "td_title_base">작성자</td>
						<td class = "td_contents">
							<p><input type="text" name="b_name" value="${notice.n_name}"><p>
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
						<td class = "td_contents"><textarea cols="70" rows="10"
								name="b_contents">${notice.n_contents}</textarea> </td>
					</tr>
					
					<tr>
						<td colspan="2" class = "td_title_long">
							<p>
								<a href = "./NoticeServlet?cmd=notice_list">[리스트]</a>&nbsp;
								<input type="submit" value = "수정완료">
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