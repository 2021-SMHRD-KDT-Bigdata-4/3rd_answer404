<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<html>
<head>
 <!-- Css Styles -->
<link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css"
   type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css" type="text/css">


 <!--  구글 차트 API -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">

function loginPopUp(){
    window.open("/member/login", "login", "width=500, height=678, left=660, top=200");
 }

 function logout(){
    location.href="/member/logout";
 }


 function scrap(){
    location.href="/member/scrap?member_id=${member.member_id}&&pagingNum=1";
 }


      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // 5+ 1개 평균 나오는거라 6번째는 무조건 선 그래프 로 들어감
        var data = google.visualization.arrayToDataTable([
          ['기능 없음', '${chartMain[0].news_keyword}', '${chartMain[1].news_keyword}', '${chartMain[2].news_keyword}', '${chartMain[3].news_keyword}', '${chartMain[4].news_keyword}'],
          ['20대 이하', ${chartKeyword20[0].cnt}, ${chartKeyword20[1].cnt}, ${chartKeyword20[2].cnt},${chartKeyword20[3].cnt}, ${chartKeyword20[4].cnt}],
          ['30대', ${chartKeyword30[0].cnt}, ${chartKeyword30[1].cnt}, ${chartKeyword30[2].cnt},${chartKeyword30[3].cnt}, ${chartKeyword30[4].cnt}],
          ['40대', ${chartKeyword40[0].cnt}, ${chartKeyword40[1].cnt}, ${chartKeyword40[2].cnt},${chartKeyword40[3].cnt}, ${chartKeyword40[4].cnt}],
          ['50대', ${chartKeyword50[0].cnt}, ${chartKeyword50[1].cnt}, ${chartKeyword50[2].cnt},${chartKeyword50[3].cnt}, ${chartKeyword50[4].cnt}],
          ['60대 이상', ${chartKeyword60[0].cnt}, ${chartKeyword60[1].cnt}, ${chartKeyword60[2].cnt},${chartKeyword60[3].cnt}, ${chartKeyword60[4].cnt}],
        ]);

        var options = {
          title : '연령대별 상위 키워드',
         // vAxis: {title: 'Y축 여기'},
         // hAxis: {title: 'X축 여기'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };
		// 여기 이름으로 쏴줌
        var chart = new google.visualization.ComboChart(document.getElementById('chart_div1'));
        chart.draw(data, options);
      }
</script>

<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [ '${chartMain[0].news_keyword}',  	 ${chartMain[0].cnt}],
          [ '${chartMain[1].news_keyword}',  	 ${chartMain[1].cnt}],
          [ '${chartMain[2].news_keyword}', 	${chartMain[2].cnt}],
          [ '${chartMain[3].news_keyword}',		${chartMain[3].cnt}],
          [ '${chartMain[4].news_keyword}',  	${chartMain[4].cnt}],
          [ '${chartMain[5].news_keyword}',  	 ${chartMain[5].cnt}],
          [ '${chartMain[6].news_keyword}',  	 ${chartMain[6].cnt}],
          [ '${chartMain[7].news_keyword}', 	${chartMain[7].cnt}],
          [ '${chartMain[8].news_keyword}',		${chartMain[8].cnt}],
          [ '${chartMain[9].news_keyword}',  	${chartMain[9].cnt}]
        ]);

        var options = {
          title: '메인 키워드 순위 TOP 10',
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
 </script>

  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);
      function drawChart1() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [ '${corechartlistFM[0].news_keyword}',   ${corechartlistFM[0].cnt}],
          [ '${corechartlistFM[1].news_keyword}',   ${corechartlistFM[1].cnt}],
          [ '${corechartlistFM[2].news_keyword}', 	${corechartlistFM[2].cnt}],
          [ '${corechartlistFM[3].news_keyword}',	${corechartlistFM[3].cnt}],
          [ '${corechartlistFM[4].news_keyword}',  	${corechartlistFM[4].cnt}]
        ]);

        var options = {
          title: '여성 선호 키워드 TOP 5'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart.draw(data, options);
      }
 </script>
 
  <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart2);
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          [ '${corechartlistM[0].news_keyword}',    ${corechartlistM[0].cnt}],
          [ '${corechartlistM[1].news_keyword}',    ${corechartlistM[1].cnt}],
          [ '${corechartlistM[2].news_keyword}', 	${corechartlistM[2].cnt}],
          [ '${corechartlistM[3].news_keyword}',	${corechartlistM[3].cnt}],
          [ '${corechartlistM[4].news_keyword}',  	${corechartlistM[4].cnt}]
        ]);

        var options = {
          title: '남성 선호 키워드 TOP 5'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2'));

        chart.draw(data, options);
      }
 </script>
 
  <script type="text/javascript">
 	function test(){
 		
 		alert(${corechartlistFM[1].cnt});
 	}
 </script>
<meta charset="UTF-8">
<title>구글 차트 API</title>
</head>
<body>
	   <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <div class="humberger__menu__overlay"></div>
    <div class="humberger__menu__wrapper">
        <div class="humberger__menu__logo">
            <a href="#"><img src="${cpath}/resources/img/logo.png" alt=""></a>
        </div>
        <div class="humberger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price">item: <span>$150.00</span></div>
        </div>
        <div class="humberger__menu__widget">
            <div class="header__top__right__language">
                <img src="img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanis</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
            
             <c:if test="${member == null}">
            <div class="header__top__right__auth">
               <a href="#" onclick="loginPopUp()"><i class="fa fa-user"></i>
                  Login</a>
            </div>
         </c:if>

         <c:if test="${member != null}">
            <div class="header__top__right__auth">
               <a href="#" onclick="logout()"><i class="fa fa-user"></i>
                  Logout</a>
            </div>
         </c:if>

         <c:if test="${member != null}">
            <div class="header__top__right__auth">
               <a  href="#" onclick="scrap()"> <i class="fa fa-user"></i>Scrap
               </a>
            </div>
         </c:if>

         <c:if test="${msg != null}">
            <div class="header__top__right__auth">
               <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
            </div>
         </c:if>
            
        </div>
        <nav class="humberger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="./shop-grid.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="./shop-details.html">Shop Details</a></li>
                        <li><a href="./shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="./checkout.html">Check Out</a></li>
                        <li><a href="./blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="./blog.html">Blog</a></li>
                <li><a href="./contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="humberger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> hello@colorlib.com</li>
                <li>Free Shipping for all Order of $99</li>
            </ul>
        </div>
    </div>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <header class="header">       
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
               <div class="header__logo">
                  <a href="../news/list"><img src="${cpath}/resources/img/logo.png"
                     alt=""></a>
               </div>
            </div>
                    <div class="col-lg-6">
                        <nav class="header__menu">
                  <ul>
                     <li><a href="../news/list">Home</a></li>
                     <li><a href="../news/econo_category?news_category=경제&&pagingNum=1">경제</a></li>
                     <li><a href="../news/econo_category?news_category=사회&&pagingNum=1">사회</a></li>
                     <li><a href="../news/econo_category?news_category=정치&&pagingNum=1">정치</a></li>
                     <li><a href="../news/econo_category?news_category=IT/과학&&pagingNum=1">IT/과학</a></li>
                  </ul>
               </nav>
                    </div>
                    
                     <div class="col-lg-3">
               <c:if test="${member == null}">
                  <div class="header__top__right__auth">
                     <a href="#" onclick="loginPopUp()"><i class="fa fa-user"></i>
                        Login</a>
                  </div>
               </c:if>


               <c:if test="${member != null}">
                  <div class="header__top__right__auth">
                     <a href="#" onclick="logout()"><i class="fa fa-user"></i>
                        Logout</a>
                  </div>
               </c:if>

               <c:if test="${member != null}">
                  <div class="header__top__right__auth">
                     <a style="padding-right: 15px;" href="#" onclick="scrap()"> <i class="fa fa-user"></i>
                     Scrap </a>
                  </div>
               </c:if>
               <c:if test="${msg != null}">
                  <div class="header__top__right__auth">
                     <p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
                  </div>
               </c:if>
            </div>
                    
                </div>
                 <div class="humberger__open">
           			 <i class="fa fa-bars"></i>
        		 </div>
            </div>
          </header>
   		<!-- Header Section End -->
   
        
      

   <!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div onclick="showChart()" class="hero__categories__all">
							<a onclick="showChart()"><span>주요 통계 보기</span></a>
						</div>
						
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search__form">
						<form action="listAll">
							<select name="searchType">
								<option value="t"
									<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"
									<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							</select>
							<div>
								<input type="text" name="keyword" id=keywordInput
									value="${scri.keyword}" placeholder="검색할 뉴스를 입력해주세요" />
								<button type="submit" id="searchBtn" class="site-btn">검색</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${cpath}/resources/img/finance.png">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>스크랩</h2>
						<div class="breadcrumb__option">
							<span>응답하라 404</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	<!-- ---------------------------------------- 이 아래로 수정중 --------------------------------------------- -->
    <!-- Blog Section Begin -->
	<section class="blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-8">
					<div class="row">
						<div id="chart_div1" class ='col-lg-12' style= "height: 900px;"></div>						
						<div id="donutchart" class ='col-lg-12' style= "height: 900px;"></div>
						
						<div id="piechart1" class ='col-lg-6' style="height: 500px;"></div>	
						<div id="piechart2" class ='col-lg-6' style="height: 500px;"></div>					
					</div>
					<!-- row 끝 -->
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->
	


    <!-- Js Plugins -->
	<script src="${cpath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath}/resources/js/bootstrap.min.js"></script>
	<script src="${cpath}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${cpath}/resources/js/jquery-ui.min.js"></script>
	<script src="${cpath}/resources/js/jquery.slicknav.js"></script>
	<script src="${cpath}/resources/js/mixitup.min.js"></script>
	<script src="${cpath}/resources/js/owl.carousel.min.js"></script>
	<script src="${cpath}/resources/js/main.js"></script>
</body>
</html>