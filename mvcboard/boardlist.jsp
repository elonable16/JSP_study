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
</head>
<body>
	<div id="top_nav">
		<div id="login_info">
			<ul>
				<li>${sessionScope.m_id}</li>
				<li>
			<%=
				session.getAttribute("m_id")
			%>
				</li>
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
				<p class="title">게시판 리스트</p>
				<span class="item_title1">번호</span>
				<span class="item_title2">제목</span>
				<span class="item_title3">작성자</span>
				<span class="item_title4">작성일</span>
				<span class="item_title5">기타</span>
				<br>
				<c:forEach var = "board" items = "${list}">
					<span class="item_contents1">${board.b_num}</span>
					<span class="item_contents2"><a href ="./BoardServlet?cmd=board_view&b_num=${board.b_num}&pagenum=${pagedata.pagenum}">${board.b_subject}</a></span>
					<span class="item_contents3">${board.b_name}</span>
					<span class="item_contents4">${fn:substring(board.b_date,0,10)}</span>
					<span class="item_contents5">기타</span>
					<br>
				</c:forEach>
				<p>	
					<c:if test="${pagedata.startpage>1}">
						<a href="./BoardServlet?cmd=board_list&pagenum=${pagedata.startpage- pagedata.groupsize }">◀</a>
					</c:if>
					<c:forEach var="i" begin="${pagedata.startpage}" end ="${pagedata.endpage}">
						<c:if test="${pagedata.lastpage>=i}">
							<span><a href="./BoardServlet?cmd=board_list&pagenum=${i}">[${i}]</a></span>
						</c:if>
					</c:forEach>
					<c:if test="${pagedata.endpage<pagedata.lastpage}">
						<a href="./BoardServlet?cmd=board_list&pagenum=${pagedata.startpage+ pagedata.groupsize }">▶</a>
					</c:if>
				</p>
				<p><a href = "./BoardServlet?cmd=board_insert_form">추가</a></p>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹 프로그래밍</p>
		<p>Copyright(c) 김엘론. All Right Reserved</p>
	</div>
</body>
</html>