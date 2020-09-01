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
        #header > img {
            position:absolute;
            right: 0px;
            top: 0px;
            z-index: 50;
        }
        #header > h1{
            color: white;
            position:absolute;
            left: 346px;
            top: 53px;   
            z-index: 200;
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
	<div id="top_nav">
    </div>
    <div id="header">
        <img src="http://placeimg.com/960/150/nature" alt="">
        <h1>JSP 웹 프로그래밍</h1>
    </div>
    <div id="nav">

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
                <p class="title">JSP 웹 프로그래밍</p>
                <span class="item_title1">번호</span>
                <span class="item_title2">제목</span>
                <span class="item_title3">작성자</span>
                <span class="item_title4">작성일</span>
                <br>
                <span class="item_contents1">1</span>
                <span class="item_contents2">jsp 웹 프로그래밍 테스트</span>
                <span class="item_contents3">홍길동</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
                <span class="item_contents1">2</span>
                <span class="item_contents2">jsp 웹 프로그래밍 테스트</span>
                <span class="item_contents3">홍길동</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹 프로그래밍</p>
        <p>Copyright(c) 김엘론. All Right Reserved</p>
    </div>
</body>
</html>