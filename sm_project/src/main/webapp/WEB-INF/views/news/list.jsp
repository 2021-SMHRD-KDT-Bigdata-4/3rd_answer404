<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>응답하라 404 :: 메인 페이지</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
	
<!-- Awesome Font -->
<script src="https://kit.fontawesome.com/b6d424ac83.js" crossorigin="anonymous"></script>

<!-- Css Styles -->
<link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${cpath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${cpath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css"
	type="text/css">
</head>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$( document ).ready(function() {
    ajaxlist("경제");
});

   $('#searchBtn').click(
         function() {
            self.location = "list" + '${pageMaker.makeQuery(1)}'
                  + "&searchType="
                  + $("select option:selected").val() + "&keyword="
                  + encodeURIComponent($('#keywordInput').val());
         });

   function ajaxlist(data){
      
   
      $.ajax({
          url : '/ajax/test', // 이 주소로 
             type : "post", // 포스트 방식으로 보내는데
             dataType : "json",
             cache : false,
             data : {"data" : data}, // kind를 kind로 명명하여 보내겠다
             success : function(data){ 
                        
         	var views = "<div class='row featured_filter'>";
         
              $.each(data,(index,obj)=>{
                                            
              views+="<div class='col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood'>";
              views+="<div class='featured__item'>";
              views+="<div class='featured__item__pic set-bg'>";
           views+="<img class='featured__item__pic' src='"+obj.news_image+"' onclick='detail("+obj.news_index+")' >"
              views+="<ul class='featured__item__pic__hover'>";
              views+="<li><a href='#'><i class='fa fa-heart'></i></a></li>";
              views+="</ul>";
              views+="</div>";
              views+="<div class='featured__item__text'>";
              views+="<c:if test='${member == null}'>";
              views+="<h5><a href='/news/detailView?news_index="+obj.news_index+"'>"
              views+="<h5>"+obj.news_title+"</h5>"
              views+="</a>";
              views+="</h5>";
              views+="</c:if>";
              views+="<c:if test='${member !=null}'>";
              views+="<h5><a href='/news/detailViewStatistics?news_index="+obj.news_index+"&&member_id=${member.member_id}'>";
              views+="<h5>"+obj.news_title+"</h5>"
              views+="</a>";
              views+="</h5>";
              views+="</c:if>";
              views+="</div>";
              views+="</div>";
              views+="</div>";                                          
              });
              views+="</div>"   ;
              $("#categorylist").html(views);
              
             },
             error : function(data){ alert('error');}
      });
}
   function detail(new_index){
		 location.href ="${cpath}/news/detailView?news_index="+new_index;		
	}  
</script>

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
			<div class="header__cart__price">
				item: <span>$150.00</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<img src="${cpath}/resources/img/language.png" alt="">
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">Spanis</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>


			<c:if test="${member == null}">
				<div class="header__top__right__auth">
					<a href="#" onclick="loginPopUp()"><i class="fas fa-user"></i>
						Login</a>
				</div>
			</c:if>
			
			<c:if test="${member != null}">
				<div class="header__top__right__auth">
					<a href="#" onclick="scrap()"> <i class="fas fa-clipboard"></i>Scrap
					</a>
				</div>
			</c:if>

			<c:if test="${member != null}">
				<div class="header__top__right__auth">
					<a href="#" onclick="logout()"><i class="fas fa-user-slash"></i>
						Logout</a>
				</div>
			</c:if>

			<c:if test="${msg != null}">
				<div class="header__top__right__auth">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
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
					</ul></li>
				<li><a href="./blog.html">Blog</a></li>
				<li><a href="./contact.html">Contact</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a> <a href="#"><i class="fa fa-linkedin"></i></a>
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
						<a href="./list"><img src="${cpath}/resources/img/logo.png"
							alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./list">Home</a></li>
							<li><a
								href="${capth}./econo_category?news_category=경제&&pagingNum=1">경제</a></li>
							<li><a
								href="${capth}./econo_category?news_category=사회&&pagingNum=1">사회</a></li>
							<li><a
								href="${capth}./econo_category?news_category=정치&&pagingNum=1">정치</a></li>
							<li><a
								href="${capth}./econo_category?news_category=IT/과학&&pagingNum=1">IT/과학</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3" style = "display: flex; align-items: center; justify-content: space-evenly;">
					<c:if test="${member == null}">
						<div class="header__top__right__auth">
							<a href="#" onclick="loginPopUp()"><i class="fa fa-user"></i>
								Login</a>
						</div>
					</c:if>
					
					<c:if test="${member != null}">
						<div class="header__top__right__auth">
							<a href="#" onclick="scrap()"> <i class="fas fa-clipboard"></i>Scrap
							</a>
						</div>
					</c:if>

					<c:if test="${member != null}">
						<div class="header__top__right__auth">
							<a href="#" onclick="logout()"><i class="fas fa-user-slash"></i>
								Logout</a>
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
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<span>조회수 순위</span>
						</div>
						<ul>
							<c:forEach var="list" items="${countStatisticslist}"
								varStatus="status">
								<li><a
									href="/news/detailView?news_index=${list.news_index}"> <b>[${status.count}]</b>
										${list.news_title}
								</a>
									<hr /></li>


							</c:forEach>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search__form" style="margin-bottom: 15px;">
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
					<div class="hero__item set-bg"
						data-setbg="https://imgnews.pstatic.net/image/023/2021/08/11/0003632999_001_20210811144003855.jpg?type=w647">
						<div class="hero__text">
							<span>배너</span> <a
								href="https://news.naver.com/main/ranking/read.naver?mode=LSD&mid=shm&sid1=001&oid=023&aid=0003632999&rankingType=RANKING">
								<h3 style="color: white; opacity: 0.8;">
									文대통령, 확진자 2000명 넘어서자<br> “세계적인 현상”
								</h3>
							</a> <a href="#" class="primary-btn">임시로해놨음</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->



	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>주요 뉴스</h2>
					</div>
					<div class="featured__controls">
						<ul>

							<li data-filter=".fresh-meat" onclick="ajaxlist('경제')">경제</li>
							<li data-filter=".oranges" onclick="ajaxlist('사회')">사회</li>
							<li data-filter=".vegetables" onclick="ajaxlist('정치')">정치</li>
							<li data-filter=".fastfood" onclick="ajaxlist('IT/과학')">IT/과학</li>

						</ul>
					</div>
				</div>
			</div>
			<div id="categorylist"></div>
		</div>

	</section>
	<!-- Featured Section End -->

	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container" style="margin-bottom: 80px;">
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="latest-product__text">
						<h4>성별별 선호 키워드</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<h5>남성 선호 키워드</h5>
								<c:forEach var="list" items="${staticmaleUp}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>

							</div>
							<div class="latest-prdouct__slider__item">

								<h5>남성 선호 키워드</h5>
								<c:forEach var="list" items="${staticmaleDown}"
									varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count + 5}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>

							</div>
							<div class="latest-prdouct__slider__item">

								<h5>여성 선호 키워드</h5>
								<c:forEach var="list" items="${staticfemaleUp}"
									varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>

							</div>
							<div class="latest-prdouct__slider__item">

								<h5>여성 선호 키워드</h5>
								<c:forEach var="list" items="${staticfemaleDown}"
									varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count + 5}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>

							</div>
						</div>
					</div>
				</div>
				<div class="vertical_bar"></div>
				<div class="col-lg-3 col-md-6">
					<div class="latest-product__text">
						<h4>연령별 선호 통계</h4>
						<div class="latest-product__slider owl-carousel">

							<div class="latest-prdouct__slider__item">
								<h5>20대 이하 선호 키워드</h5>
								<c:forEach var="list" items="${static20}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="latest-prdouct__slider__item">
								<h5>30대 선호 키워드</h5>
								<c:forEach var="list" items="${static30}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="latest-prdouct__slider__item">
								<h5>40대 선호 키워드</h5>
								<c:forEach var="list" items="${static40}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="latest-prdouct__slider__item">
								<h5>50대 선호 키워드</h5>
								<c:forEach var="list" items="${static50}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="latest-prdouct__slider__item">
								<h5>60대이상 선호 키워드</h5>
								<c:forEach var="list" items="${static60}" varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

						</div>
					</div>
				</div>
				<div class="vertical_bar"></div>

				<div class="col-lg-3 col-md-6">
					<div class="latest-product__text">
						<h4>종합 키워드 통계</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<h5>종합 선호 키워드</h5>
								<c:forEach var="list" items="${statictotalUp}"
									varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>

							<div class="latest-prdouct__slider__item">
								<h5>종합 선호 키워드</h5>
								<c:forEach var="list" items="${statictotalDown}"
									varStatus="status">
									<a href="listAll?searchType=c&&keyword=${list.news_keyword}"
										class="latest-product__item">
										<div class="latest-product__item__text">
											<h6>
												<b>[${status.count+5}]</b> ${list.news_keyword}
											</h6>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

	</section>
	<!-- Featured Section End -->

	<!-- Banner Begin -->
	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6" style="text-align: center;">
					<div class="banner__pic">
						<img src="${cpath}/resources/img/banner/smart1.png" alt="">
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6" style="text-align: center;">
					<div class="banner__pic">
						<img src="${cpath}/resources/img/banner/smart2.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Banner End -->

	<!-- Footer Section start -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div
					style="display: flex; justify-content: space-evenly; align-items: center;"
					class="col-lg-12 col-sm-6">
					<div class="footer__about__logo">
						<a href="./index.html"><img style="padding-right: 50px;"
							src="${cpath}/resources/img/logo_trans.png" alt=""></a>
					</div>
					<div>
						<ul>
							<li>팀장 : 김성은</li>
							<li>팀원 : 손민호</li>
							<li>팀원 : 장경진</li>
							<li>팀원 : 이길수</li>
							<li>팀원 : 노현규</li>

						</ul>
					</div>
					<div>
						<ul>
							<li><a href=https://github.com/kimvkffkd83>깃허브주소 :
									https://github.com/kimvkffkd83</a></li>
							<li><a href="https://github.com/thsalsgh1234">깃허브주소 :
									https://github.com/thsalsgh1234</a></li>
							<li><a href="https://github.com/GyungJin">깃허브주소 :
									https://github.com/GyungJin</a></li>
							<li><a href="https://github.com/lee198745123">깃허브주소 :
									https://github.com/lee198745123</a></li>
							<li><a href="https://github.com/psm1936">깃허브주소 :
									https://github.com/psm1936</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<div class="row">
		<div class="col-lg-6">
			<div class="footer__copyright"
				style="display: flex; justify-content: center;">
				<div style="text-align: center;" class="footer__copyright__text ">
					<p>
						Copyright &copy;
						<script>
                           document.write(new Date().getFullYear());
                        </script>
						All rights reserved | 스마트인재개발원 3차프로젝트 <br> 개인투자자들을 위한 맞춤형
						뉴스기사 요약 및 전문용어 해석 서비스 <i class="fa fa-heart" aria-hidden="true"></i>
						by <a
							href="https://github.com/2021-SMHRD-KDT-Bigdata-4/3rd_answer404"
							target="_blank">응답하라404</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="${cpath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${cpath}/resources/js/bootstrap.min.js"></script>
	<script src="${cpath}/resources/js/jquery.nice-select.min.js"></script>
	<script src="${cpath}/resources/js/jquery-ui.min.js"></script>
	<script src="${cpath}/resources/js/jquery.slicknav.js"></script>
	<script src="${cpath}/resources/js/mixitup.min.js"></script>
	<script src="${cpath}/resources/js/owl.carousel.min.js"></script>
	<script src="${cpath}/resources/js/main.js"></script>

	<script type="text/javascript">

   function loginPopUp(){
      window.open("/member/login", "login", "width=500, height=643, left=660, top=200");
   }

   function logout(){
      location.href="/member/logout";
   }

   function check(){
      location.href="/member/test";
   }

   function scrap(){
      location.href="/member/scrap?member_id=${member.member_id}&&pagingNum=1"
   }
   </script>


</body>

</html>