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
<title>Ogani | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
<style>
.pagenation ul {
	text-align: center;
}

.pagenation ul li {
	display: inline;
	vertical-align: middle;
}

.pagenation ul li a {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 30px;
	height: 30px;
	color: #000;
	margin: 0 auto;
	font: bold 17px tahoma;
	border: 1px solid #eee;
	text-align: center;
	text-decoration: none;
	width /**/: 26px;
	height: 30px; /*IE 5.5*/
}

.pagenation ul li a.now {
	color: #fff;
	background-color: #f40;
	border: 1px solid #f40;
}

.pagenation ul li a:hover, ul li a:focus {
	color: #fff;
	border: 1px solid #f40;
	background-color: #f40;
}
</style>
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
							<li class="active"><a href="${capth}./econo_category?news_category=${category}&&pagingNum=1">${category}</a></li>
							<li><a href="${capth}./society_category?news_category=사회&&pagingNum=1">사회</a></li>
							<li><a href="${capth}./politics_category?news_category=정치&&pagingNum=1">정치</a></li>
							<li><a href="${capth}./itscience_category?news_category=IT/과학&&pagingNum=1">IT/과학</a></li>

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
							<a href="#" onclick="scrap()"> <i class="fa fa-user"></i>Scrap(임시)
							</a>
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
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All departments</span>
						</div>
						<ul>
							<li><a href="#">Fresh Meat</a></li>
							<li><a href="#">Vegetables</a></li>
							<li><a href="#">Fruit & Nut Gifts</a></li>
							<li><a href="#">Fresh Berries</a></li>
							<li><a href="#">Ocean Foods</a></li>
							<li><a href="#">Butter & Eggs</a></li>
							<li><a href="#">Fastfood</a></li>
							<li><a href="#">Fresh Onion</a></li>
							<li><a href="#">Papayaya & Crisps</a></li>
							<li><a href="#">Oatmeal</a></li>
							<li><a href="#">Fresh Bananas</a></li>
						</ul>
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
						<h2>일일 ${category} 뉴스</h2>
						<div class="breadcrumb__option">
							<a href="./index.html">응답하라</a> <span>404</span>
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
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="sidebar">
						<div class="sidebar__item">
							<h4>${category} HOT 뉴스</h4>
							<ul>
								<c:forEach var="list"  items="${categoryStatistictitle}"  varStatus="status">
			                        <li><a href="#">[${status.count}]. ${list.news_title}</a></li>
			                     </c:forEach> 
							</ul>
						</div>
						<div class="sidebar__item">
							<div class="latest-product__text">
								<h4>${category} 키워드</h4>
								<div class="latest-product__slider owl-carousel">
									<div class="latest-prdouct__slider__item">
									
										<c:forEach var="list"  items="${categoryStatisticUp}"  varStatus="status">
					                        <a href="#" class="latest-product__item">                        
					                           <div class="latest-product__item__text">	                           	
					                              <h6>[${status.count}]. ${list.news_keyword}</h6>
					                           </div>                         
					                        </a>
				                         </c:forEach>

									</div>
									
									<div class="latest-prdouct__slider__item">
											<c:forEach var="list"  items="${categoryStatisticDown}"  varStatus="status">
					                        <a href="#" class="latest-product__item">                        
					                           <div class="latest-product__item__text">	                           	
					                              <h6>[${status.count + 5}]. ${list.news_keyword}</h6>
					                           </div>                         
					                        </a>
				                        </c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-9 col-md-7">

					<div class="filter__item">
						<div class="row">
							<div class="col-lg-4 col-md-4">
								<div class="section-title">
									<h2>${category} 뉴스</h2>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<c:forEach var="list" items="${news_category}">
							<div class="col-lg-4 col-md-6 col-sm-6">
								<div class="product__item">
									<div class="product__item__pic set-bg"
										data-setbg="${list.news_image}">
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
                            	<a href="/news/econo_category?news_category=${category}&&pagingNum=${startPageNum - 1}"><i class="fa fa-long-arrow-left"></i></a>
                             </c:if>
                             
                            <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num"> 	
									<c:if test="${select != num}">
										<a href="/news/econo_category?news_category=${category}&&pagingNum=${num}">${num}</a>
									</c:if>
									
									<c:if test="${select == num}">
										[<a>${num}</a>]
									</c:if>
                             </c:forEach>   
                                                                
                             <c:if test="${next}">   
                                <a href="/news/econo_category?news_category=${category}&&pagingNum=${endPageNum + 1}"><i class="fa fa-long-arrow-right"></i></a>
                             </c:if>
                                
                            </div>                            
                     </div>
				</div>
			</div>
	</section>
	<!-- Product Section End -->

	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img
								src="${cpath}/resources/img/logo_trans.png" alt=""></a>
						</div>
						<ul>
							<li>Address: 60-49 Road 11378 New York</li>
							<li>Phone: +65 11.188.888</li>
							<li>Email: hello@colorlib.com</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Useful Links</h6>
						<ul>
							<li><a href="#">About Us</a></li>
							<li><a href="#">About Our Shop</a></li>
							<li><a href="#">Secure Shopping</a></li>
							<li><a href="#">Delivery infomation</a></li>
							<li><a href="#">Privacy Policy</a></li>
							<li><a href="#">Our Sitemap</a></li>
						</ul>
						<ul>
							<li><a href="#">Who We Are</a></li>
							<li><a href="#">Our Services</a></li>
							<li><a href="#">Projects</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Innovation</a></li>
							<li><a href="#">Testimonials</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-instagram"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-pinterest"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
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
					"width=500, height=643, left=660, top=200");
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
	</script>


</body>

</html>