<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    li {
        list-style: none;
    }
    a {
        text-decoration: none;
    }
    img {
        border: 0;
    }
</style>
<style>
        #top_nav {
            width: 960px;
            height: 30px;
            margin: 0 auto;
            position: relative;
            border: 1px solid black;
        }
        #header {
            width: 960px;
            height: 150px;
            margin: 0 auto;
            position: relative;
            border: 1px solid black;
        }

        #nav {
            width: 960px;
            height: 50px;
            margin: 0 auto;
            position: relative;
            border: 1px solid black;
        }

        #contents {
            overflow: hidden;
            width: 960px;
            margin: 0 auto;
            position: relative;
            border: 1px solid black;
        }

        #aside {
            float: left;
            width: 200px;
            border: 1px solid black;
        }

        #contents>#aside>p:first-child {
            margin-top: 10px;
        }

        #contents>#aside>p {
            margin-bottom: 10px;
            display: block;
            text-align: center;
        }

        #contents>#aside>p>a:hover {
            background: #999;
            display: block;
            color: white;
        }

        #section {
            float: right;
            width: 750px;
            border: 1px solid black;
        }

        #article {
            margin: 10px;
            border: 1px solid black;
        }
        #section>#article>p.title{
            text-align: center;
            margin-top:20px;
            margin-bottom: 20px;
            font-size: 30px;
            font-weight: bold;
        }
        #section>#article>span{
            margin-top: 5px;
            margin-bottom: 5px;
        }
        #section>#article>span.item_title1 {
            display: inline-block;
            text-align: center;
            width: 80px;
            margin top: 10px;
        }

        #section>#article>span.item_title2 {
            display: inline-block;
            text-align: center;
            width: 380px;
        }

        #section>#article>span.item_title3 {
            display: inline-block;
            text-align: center;
            width: 100px;
        }

        #section>#article>span.item_title4 {
            display: inline-block;
            text-align: center;
            width: 150px;
        }

        #section>#article>span.item_contents1 {
            display: inline-block;
            text-align: center;
            width: 80px;
        }

        #section>#article>span.item_contents2 {
            display: inline-block;
            text-align: center;
            width: 380px;
        }

        #section>#article>span.item_contents3 {
            display: inline-block;
            text-align: center;
            width: 100px;
        }

        #section>#article>span.item_contents4 {
            display: inline-block;
            text-align: center;
            width: 150px;
        }

        #footer {
            width: 960px;
            margin: 0 auto;
            border: 1px solid black;
            position: relative;
        }

        #footer>p {
            margin-top: 5px;
            text-align: center;
        }
    </style>
<style>

</style>
<style>

</style>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
	<div id="top_nav">
    </div>
    <div id="header">
        <img src="http://placeimg.com/960/150/nature" alt="">
    </div>
    <div id="nav">

    </div>
    <div id="contents">
        <div id="aside">
            <p><a href="./Ex0901_1.jsp">멤버 입력</a></p>
            <p><a href="#">메뉴1</a></p>
            <p><a href="#">메뉴2</a></p>
            <p><a href="#">메뉴3</a></p>
            <p><a href="#">메뉴4</a></p>
        </div>
        <div id="section">
            <div id="article">
                <p class="title">JSP 웹 프로그래밍</p>
                <span class="item_title1">아이디</span>
                <span class="item_title2">작&nbsp&nbsp성&nbsp&nbsp자</span>
                <span class="item_title3">패스워드</span>
                <span class="item_title4">삭제</span>
                <br>
<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				try{
					String sql = "select * from member order by id";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						int id = rs.getInt("id");
						String name = rs.getString("name");
						String passwd = rs.getString("passwd");
%>
		                <span class="item_contents1"><%=id %></span>
		                <span class="item_contents2"><a href="./Ex0901_8.jsp?id=<%=id%>"><%=name %></a></span>
		                <span class="item_contents3"><%=passwd %></span>
		                <span class="item_contents4"><a href="./Ex0901_11.jsp?id=<%=id%>">[삭제]</a></span>
		                <br>
<%
					}
				}catch (Exception e){
					System.out.println(e.toString());
				}finally{
					if(rs!= null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				}
%>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹 프로그래밍</p>
        <p>Copyright(c) 김엘론. All Right Reserved</p>
    </div>
</body>
</html>