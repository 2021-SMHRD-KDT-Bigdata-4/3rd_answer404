<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>응답하라 404 :: 카테고리</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Awesome Font -->
<script src="https://kit.fontawesome.com/b6d424ac83.js"
	crossorigin="anonymous"></script>

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
<script type="text/javascript">

function showChart(){
	   location.href="/member/showChart";
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
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
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
							<li><a href="./list">Home</a></li>
							
							<c:if test="${category =='경제'}">
							<li class="active"><a
								href="${capth}./econo_category?news_category=경제&&pagingNum=1">경제</a></li>
							</c:if>
							<c:if test="${category !='경제'}">
							<li ><a
								href="${capth}./econo_category?news_category=경제&&pagingNum=1">경제</a></li>
							</c:if>
							
							<c:if test="${category =='사회'}">
							<li class="active"><a
								href="${capth}./econo_category?news_category=사회&&pagingNum=1">사회</a></li>
							</c:if>
							<c:if test="${category !='사회'}">
							<li ><a
								href="${capth}./econo_category?news_category=사회&&pagingNum=1">사회</a></li>
							</c:if>
							
							<c:if test="${category =='정치'}">
							<li class="active"><a
								href="${capth}./econo_category?news_category=정치&&pagingNum=1">정치</a></li>
							</c:if>
							<c:if test="${category !='정치'}">
							<li><a
								href="${capth}./econo_category?news_category=정치&&pagingNum=1">정치</a></li>
							</c:if>
							
							<c:if test="${category =='IT/과학'}">
							<li class="active"><a
								href="${capth}./econo_category?news_category=IT/과학&&pagingNum=1">IT/과학</a></li>
							</c:if>
							<c:if test="${category !='IT/과학'}">
							<li><a
								href="${capth}./econo_category?news_category=IT/과학&&pagingNum=1">IT/과학</a></li>
							</c:if>
							
						</ul>
					</nav>
				</div>
				<div class="col-lg-3"
					style="display: flex; align-items: center; justify-content: space-evenly;">
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
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div onclick="showChart()"  class="hero__categories__all">
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
						<h2> ${category} 뉴스</h2>
						<div class="breadcrumb__option">
							<span>응답하라 404</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row" style="align-items: flex-start;">
				<div class="col-lg-3 col-md-6">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>${category}HOT뉴스</h4>
							<ul>
								<c:forEach var="list" items="${categoryStatistictitle}"
									varStatus="status">
									<li><a
										href="/news/detailView?news_index=${list.news_index}"> <b>[${status.count}]</b>
											${list.news_title}"
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="latest-product__text">
						<h4>${category}HOT키워드</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach var="list" items="${categoryStatisticUp}"
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
								<c:forEach var="list" items="${categoryStatisticDown}"
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
				<div class="col-lg-9 col-md-6">

					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-4">
								<div class="section-title">
									<h2>${category}뉴스</h2>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="list" items="${news_category}">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="${list.news_image}"
										onclick='detail(${list.news_index})'>
										<ul class="product__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
										</ul>
									</div>
									<div class="product__item__text">
										<h6></h6>
										<h5>
											<a href="/news/detailView?news_index=${list.news_index}">
												<c:out value="${list.news_title}" />
											</a>
										</h5>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="col-lg-12">
						<div class="product__pagination blog__pagination">

							<c:if test="${prev}">
								<a
									href="/news/econo_category?news_category=${category}&&pagingNum=${startPageNum - 1}"><i
									class="fa fa-long-arrow-left"></i></a>
							</c:if>

							<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
								<c:if test="${select != num}">
									<a
										href="/news/econo_category?news_category=${category}&&pagingNum=${num}">${num}</a>
								</c:if>

								<c:if test="${select == num}">
									<a
										style="color: #fff; background-color: #0857C3; border: 1px solid #0857C3">${num}</a>
								</c:if>
							</c:forEach>

							<c:if test="${next}">
								<a
									href="/news/econo_category?news_category=${category}&&pagingNum=${endPageNum + 1}"><i
									class="fa fa-long-arrow-right"></i></a>
							</c:if>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->

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
		function loginPopUp() {
			window.open("/member/login", "login",
					"width=500, height=678, left=660, top=200");
		}

		function logout() {
			location.href = "/member/logout";
		}

		function check() {
			location.href = "/member/test";
		}

		function scrap() {
			location.href = "/member/scrap?member_id=${member.member_id}&&pagingNum=1"
		}
		 function detail(new_index){
			 location.href ="${cpath}/news/detailView?news_index="+new_index;		
		}  
	</script>


</body>

</html>