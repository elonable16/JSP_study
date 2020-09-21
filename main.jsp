<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href ="./member/member.css">
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
					<li><a href="./member/login.jsp">login</a></li>
					<li><a href="./member/insert.jsp">회원가입</a></li>
			<%
				}
			%>

			</ul>
		</div>
		<div id="main_gnb">
			<ul>
				<li><a href="./board/list.jsp">게시판</a></li>
				<li><a href="./guestbook/list.jsp">방명록</a></li>
				<li><a href="./product/list.jsp">상품보기</a></li>
				<li><a href="./shop/list.jsp">shop</a></li>
				<li><a href="./shop/cart_list.jsp">장바구니</a></li>
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
				<li><a href="./product/order_list.jsp">주문 정보</a></li>
				<li><a href="./shop/buy_list.jsp">사용자 구매 정보</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
    <div id="contents">
        <div id="aside">
            <p><a href="#">메뉴1</a></p>
            <p><a href="#">메뉴2</a></p>
            <p><a href="#">메뉴3</a></p>
            <p><a href="#">메뉴4</a></p>
        </div>
        <div id="section">
            <div id="article">
                <p class="title">초기 화면</p>
                
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹 프로그래밍</p>
        <p>Copyright(c) 김엘론. All Right Reserved</p>
    </div>
</body>
</html>