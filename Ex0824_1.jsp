<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 컴파일 특성을 알려주는 내용 -->
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
<title>Insert title here</title>
	 <style>
        *{ /*초기화면의 설정*/
            margin: 0; /*전체 기본 바깥여백 없애기*/
            padding:0; /*전체 기본 안여백 없애기*/
        }
        li{list-style: none;} /*리스트의 항목구분자 장식 없애기*/
        a{text-decoration: none;} /*하이퍼 링크의 및줄 없애기*/
        image{border: none;} /*이미지의 외각선 없애기*/
    </style>
    <!-- 헤더 스타일 적용 -->
    <style>
        #main_header {
            height: 160px; /*헤더영역의 높이 설정*/
            width: 960px; /*헤더영역의 너비 설정*/
            margin : 0 auto; /*화면안에서 헤더영역을 항상 가운데에 오도록 설정*/
            position: relative; /*헤더 구성 요소의 위치를 헤더 안의 좌표값으로 참조 지정*/
        }
        #main_header > #title{
            position: absolute; /*헤더 영역 안에서 절대 위치로 지정*/
            font-family: 'Gaegu', cursive;
            left :20px; top: 30px; /*타이틀의 왼쪽과 위쪽 위치 지정*/
        }
        #main_header > #main_gnb {
            position: absolute; /*gab(Global Navigation Bar의 절대 위치 설정*/
            right: 0px; /*오른쪽 상단*/
            top: 0px;
            display: block; /*고유영역을 지정*/
            text-align: center;/*텍스트 중앙 정렬*/
        }
        #main_header > #main_gnb > ul{
            overflow: hidden; /*리스트 영역 밖으로 넘어가는 것을 방지*/
        }
         #main_gnb > ul>li {
            float: left; /*리스트를 수평정렬로 변경*/
        }
        #main_gnb > ul>li>a {
            border: 1px solid black; /*리스트의 항목별로 테두리 설정*/
            display: block; /* 하이퍼링크의 영역을 리스트 영역의 전체로 설정 */
            padding: 3px 10px; /* 안여백 설정, 클릭 범위 확대*/
        }
        #main_gnb > ul > li:first-child>a { /*왼쪽 첫번째 리스트 영역의 왼쪽 테두리 모서리를 라운딩*/
            border-radius: 10px 0 0 10px; 
        }
        #main_gnb > ul > li:last-child>a { /*왼쪽에서 부터 마지막 리스트 영역의 오른쪽 테두리 모서리 를 라운딩*/
            border-radius: 0 10px 10px 0;
        }
        #main_gnb > ul > li> a:hover{  /*마우스가 올라간 경우 설정값 변경*/
            background : black;
            color: white;
        }
        #main_header > #main_lnb {
            position: absolute; /*lnb(local Navigation Bar의 절대 위치 설정*/
            right: 0px;
            bottom: 10px;
            display: block; /*고유영역의 지정*/
            text-align: center;
        }
        #main_lnb > ul>li {
            float: left; /*리스트를 수평 정렬*/
        }
        #main_lnb > ul> li >a {
            border: 1px solid black; /* 하이퍼링크의 테두리 설정*/
            display: block;
            padding: 10px 15px;
        }
        #main_lnb > ul > li:first-child>a { /*리스트의 왼쪽 테두리 라운딩*/
            border-radius: 10px 0 0 10px;
        }
        #main_lnb > ul > li:last-child>a { /*리스트의 오른쪽 테두리 라운딩*/
            border-radius: 0 10px 10px 0;
        }
        #main_lnb > ul > li > a:hover{  /*마우스를 올릴 시 색상 변경*/
            background : black;
            color: white;
        }

    </style>
    <!-- content -->
    <style>
        #content {
            width: 960px; /*콘텐츠 영역 사이즈 설정*/
            margin : 0 auto;/*영역의 가운데 정렬*/
            overflow: hidden;/*영역 초과 방지*/
        }
         #content > #main_section{
            float: left; /*메인 텍스트 영역을 왼쪽 정렬, 오른쪽 영역에 다른aside가 들어올수 있도록 설정*/
            width: 750px; /*메인 텍스트 영역 크기 설정*/
        }
        #main_section > article.main_article { /*메인 섹션 자손중 article 영역 테두리 설정*/
            border: 1px solid black;/**/
            margin-bottom: 10px;/*article간의 간격 설정(하단으로만)*/
            padding :20px;/*안여백 지정*/
        }
        #main_aside{
            float: right; /*aside가 메인 섹션 오른쪽에 오도록 설정*/
            width: 200px; /* 전체 영역(960)- 메인 섹션(750) - 간격(10) = aside(200)*/ 
        }
    </style>
    <!-- main_footer -->
    <style>
        #main_footer{
            width: 960px; /*영역 사이즈 통일*/
            margin: 0 auto; /* 영역 가운데 정력*/
            border-top: 2px solid black; /*상단만 테두리 설정*/
            margin-bottom: 20px;
            padding-top: 10px; /*위쪽 안 여백 설정*/
        }
    </style>
    <!-- aside_menu -->
    <style>
        /* 타입을 통한 접근 */
        input:nth-of-type(1){display: none;} /* 라디오 버튼 화면에서 제거*/
        input:nth-of-type(2){display: none;} /* 라디오 버튼 화면에서 제거*/
        input:nth-of-type(1) ~ div:nth-of-type(1){/*좌우에 표시할 div중 좌측*/
            display: none;/*화면에서 숨김*/
        }
        input:nth-of-type(1):checked ~ div:nth-of-type(1){/*첫번째 라디오 버튼 체크시 아래 첫번째 div(구조선택)*/
            display: block;/*라디오 버튼 체크시 보이면서 영역 전체 차지 */
        }
        input:nth-of-type(2) ~ div:nth-of-type(2){/*좌우에 표시할 div중 우측*/
            display: none;/*화면에서 숨김*/
        }
        input:nth-of-type(2):checked ~ div:nth-of-type(2){/*두번째 라디오 버튼 체크시 아래 두번째 div(구조선택)*/
            display: block;/*라디오 버튼 체크시 보이면서 영역 전체 차지 */
        }
        section.buttons{ /*aside의 버튼 영역 벗어남 방지*/  
            overflow: hidden;
        }
        section.buttons> label { /*라디오 버튼과 for로 연결된 라벨의 속성 지정*/
            display: block; /*블럭으로 고유 영역 확정*/
            float: left; /*왼쪽정렬로 수평정렬 (영역의 인라인화)*/
            width: 100px;/*각 영역의 크기 설정*/
            height: 30px;
            text-align: center;
            border: 1px solid black;
            background:#333333; /* 미선택시 검은바탕 흰 글씨로 설정*/
            color: white;
            box-sizing: border-box; /*테두리의 안쪽 여백의 크기도 크기요소로 적용 콘텐츠 영역이 줄어들며 영역 크기 유지*/
        }
        input:nth-of-type(1):checked ~section.buttons >label:nth-of-type(1){/*좌측을 체크 했을 때 좌측 색을 변경 */
            background:white;
            color: black;
        }
        input:nth-of-type(2):checked ~ section.buttons >label:nth-of-type(2){/*우측을 체크 했을 때 우측 색을 변경 */
            background:white;
            color: black;
        }
    </style>
    <!-- aside - thumbnail, description 영역 -->
    <style>
        li.item{
            overflow: hidden; /*aside item별 내용의 영역 벗어남 방지(최상위 영역)*/
            border: 1px solid black;/*item의 테두리 설정*/
            border-top: none;   /*줄겹침을 없애기 위해 위쪽 테두리 제거*/
            padding: 10px; /*안여백 설정*/
        }
        li.item > a > div.thumbnail{
            float: left;/*그림과 텍스트가 나란히 올수 있도록 인라인화*/
            margin-right: 10px; /*그림과 텍스트의 간격 설절*/
        }
        li.item > a > div.description{
            float: left;/*그림과 텍스트가 나란히 올수 있도록 인라인화*/
        }
        li.item > a > div.description > strong{ /* 영역이 넘어가는 부분에 대해서 점선 처리*/
            display: block; /*120px의 고유영역 설정*/
            width: 120px; /*너비 설정*/
            white-space: nowrap; /*연속 공백을 하나로 합침. 줄 바꿈은 br로만 발생. 자동줄바꿈x*/
            overflow: hidden; /*영역을 나가는 부분 가리기*/
            text-overflow: ellipsis; /*말 줄임표 표시*/
        }
    </style>
</head>
<%!
	// 변수와 메서드 선언(메서드는 반드시 선언문)
	int count = 5;
	int addNum(int num1, int num2){
		return num1 + num2;
	}
	String greeting = "JSP web programming";
	// 페이지 전체가 하나의 클래스
%>
<body>
	<%
		Calendar cal = Calendar.getInstance();
		int yyyy = cal.get(Calendar.YEAR);
		int mm = cal.get(Calendar.MONTH)+1;
		int dd = cal.get(Calendar.DATE);
		int hh = cal.get(Calendar.HOUR);
		int ms = cal.get(Calendar.MINUTE);
		int ss = cal.get(Calendar.SECOND);
		/*Date day = new Date();
		int yyyy = day.getYear()+1900;
		int mm = day.getMonth()+1;
		int dd = day.getDate();
		int hh = day.getHours();
		int ms = day.getMinutes();
		int ss = day.getSeconds();*/
		String strDay = yyyy + "-" + mm + "-"+ dd + " "+hh +":" + ms + ":"+ ss;
	%>
    <header id="main_header">
        <div id="title">
        	<%@include file = "./header.jsp" %>
        	<%-- 상대경로 표기법--%>
            <h1>UI 프로그래밍</h1>
            <h2>홍 길 동</h2>
            <h3><%=strDay %></h3>
        </div>
        <nav id="main_gnb">
            <ul>
                <li><a href="#">Web</a></li>
                <li><a href="#">Mobile</a></li>
                <li><a href="#">Game</a></li>
                <li><a href="#">Simulation</a></li>
                <li><a href="#">Data</a></li>
            </ul>
        </nav>
        <nav id="main_lnb">
            <ul>
                <li><a href="#">HTML5</a></li>
                <li><a href="#">CSS3</a></li>
                <li><a href="#">JavaScript</a></li>
                <li><a href="#">jQuery</a></li>
                <li><a href="#">Node.js</a></li>
            </ul>
        </nav>
    </header>
    <div id="content">
        <section id="main_section">
            <article class="main_article">
                <h1>Main Article</h1>
                <%-- <p>화요일인 18일은 전국이 대체로 맑은 가운데 전국 대부분 지역에 폭염주의보 또는 폭염경보가 내려지는 등 무더위가 예상된다. 18일 오전 5시 현재 기온은 서울 24.5도, 인천 24.1도, 수원 23.5도, 춘천 24.9도, 강릉 27도, 청주 26도, 대전 25.8도, 전주 25.9도, 광주 25.2도, 제주 26.9도, 대구 24.8도, 부산 26.5도, 울산 24.3도, 창원 25.9도 등이다. 낮 최고 기온은 31∼38도로 예보됐다. 높은 습도로 인해 체감온도가 35도 안팎까지 오르겠고, 야간에는 전국 대부분 지역에 열대야 현상이 나타나 건강관리에 유의해야 한다.미세먼지 농도는 부산·울산에서 '나쁨', 그 밖의 권역은 '좋음'∼'보통' 수준을 보이겠다. 바다의 물결은 동해 앞바다에서 0.5∼1ｍ, 서해 앞바다에서 0.5ｍ, 남해 앞바다에서 0.5∼1ｍ로 일겠다.</p>
            	 --%>
            	<%--JSP 주석 --%>
            	<% //java 주석 %>
            	<%/* java 주석*/ %>
            	<%
            		int result = addNum(10,20);
            		out.print("결과는" + result + "<br>");
            		//print, println의 의미가 없다.
            	%>
            </article>
            <article class="main_article">
                <h1>Main Article</h1>
                <%--<p>화요일인 18일은 전국이 대체로 맑은 가운데 전국 대부분 지역에 폭염주의보 또는 폭염경보가 내려지는 등 무더위가 예상된다. 18일 오전 5시 현재 기온은 서울 24.5도, 인천 24.1도, 수원 23.5도, 춘천 24.9도, 강릉 27도, 청주 26도, 대전 25.8도, 전주 25.9도, 광주 25.2도, 제주 26.9도, 대구 24.8도, 부산 26.5도, 울산 24.3도, 창원 25.9도 등이다. 낮 최고 기온은 31∼38도로 예보됐다. 높은 습도로 인해 체감온도가 35도 안팎까지 오르겠고, 야간에는 전국 대부분 지역에 열대야 현상이 나타나 건강관리에 유의해야 한다.미세먼지 농도는 부산·울산에서 '나쁨', 그 밖의 권역은 '좋음'∼'보통' 수준을 보이겠다. 바다의 물결은 동해 앞바다에서 0.5∼1ｍ, 서해 앞바다에서 0.5ｍ, 남해 앞바다에서 0.5∼1ｍ로 일겠다.</p>
            	--%>
            	<%
            		for(int i = 0; i<count; i++){
            			out.print("<p>JSP 프로그래밍" + i +"</p>");
            		}
            	%>
            </article>
            <article class="main_article">
                <h1>Main Article</h1>
                <%-- <p>화요일인 18일은 전국이 대체로 맑은 가운데 전국 대부분 지역에 폭염주의보 또는 폭염경보가 내려지는 등 무더위가 예상된다. 18일 오전 5시 현재 기온은 서울 24.5도, 인천 24.1도, 수원 23.5도, 춘천 24.9도, 강릉 27도, 청주 26도, 대전 25.8도, 전주 25.9도, 광주 25.2도, 제주 26.9도, 대구 24.8도, 부산 26.5도, 울산 24.3도, 창원 25.9도 등이다. 낮 최고 기온은 31∼38도로 예보됐다. 높은 습도로 인해 체감온도가 35도 안팎까지 오르겠고, 야간에는 전국 대부분 지역에 열대야 현상이 나타나 건강관리에 유의해야 한다.미세먼지 농도는 부산·울산에서 '나쁨', 그 밖의 권역은 '좋음'∼'보통' 수준을 보이겠다. 바다의 물결은 동해 앞바다에서 0.5∼1ｍ, 서해 앞바다에서 0.5ｍ, 남해 앞바다에서 0.5∼1ｍ로 일겠다.</p>
            	 --%>
            	<%= addNum(30,50) %>
            </article>
        </section>
        <aside id="main_aside">
            <input id="first" type="radio" name="tab" checked="checked" />
            <input id="second" type="radio" name="tab" />
            <section class="buttons">
                <label for="first">First</label>
                <label for="second">Second</label>
            </section>
            <div class="tab_item">
                <ul>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong><%= greeting %></strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>HTML5 Audio</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>HTML5 Video</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>HTML5 Semantic Web</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                </ul>
            </div>
            <div class="tab_item">
                <ul>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong><%= greeting %></strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>CSS3 Animation</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>CSS3 Border</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                    <li class="item"><a href="#">
                        <div class="thumbnail">
                            <img src="http://placekitten.com/45/45" />
                        </div>
                        <div class="description">
                            <strong>CSS3 Box</strong><p>2020-08-18</p>
                        </div>
                    </a></li>
                </ul>
            </div>
        </aside>
    </div>
    <footer id="main_footer">
        <h3>HTML5 + CSS3 Basic</h3>
        <address>Website Layout Basic</address>
        <%
        	int sum = 0;
        	for(int i = 1 ; i <= 10 ; i++)
        		sum += i;
        	String[] strSum = new String[3];
        	for(int i = 0; i<3 ; i++)
        		strSum[i] =	"<p>1~10까지의 합은 : "+ sum + " "+ i + "</P>";
        %>
        <%= strSum[0] + strSum[1] + strSum[2] %>
    </footer>    
</body>
</html>