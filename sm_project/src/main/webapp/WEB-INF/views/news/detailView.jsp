<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>응답하라 404 :: 뉴스 상세보기</title>

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
<link rel="stylesheet" href="${cpath}/resources/css/floatMenu.css"
	type="text/css">
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   function viewStyle(obj) {
      while (true) {
         if ((obj = obj.nextSibling).nodeName == "DIV") {
            obj.style.display = (obj.style.display != 'block') ? 'block'
                  : 'none';
            obj.style.fontSize = "18px";
            break;
         }
      }
   }
   
   //스크랩 버튼 펑션
   function saveScrap() {
      location.href = "${cpath}/member/scrapInsert?member_id=${member.member_id}&&news_index=${detail.news_index}&&news_title=${detail.news_title.replace("\"", "")}&&news_image=${detail.news_image}";
   }
   
   //전문용어 검색 펑션
   function searchDic(){
	var svalue = document.getElementById("keywordInput2").value;
	$.ajax({
			url: "/news/searchDic",
			type : "get",
			data : {"dictionary_object": svalue},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				var view = '';
				view += data;
				$("#searchResult").html(view);
			},
			error : function(data){ 
				$("#searchResult").html('해당 단어가 사전에 존재하지 않습니다');
				}
		});
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
			<a href="#"><img src="img/logo.png" alt=""></a>
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
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./list">Home</a></li>
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

	<!-- 플로팅 메뉴 -->
	<div id="floatMenu">
		<div class="col-lg-12">
			<div class='row'>
				<div class='remote__control__title'>
					<h5>전문용어 검색</h5>
					<div class='bar'></div>
				</div>
			</div>
			<div class='row'>
				<div class="blog__sidebar__search">
					<form>
						<div>
							<input type="text" name="keyword" id=keywordInput2
								value="${dictionaryVO.dictionary_object}" placeholder="용어 입력" />
							<button type="button" onclick="searchDic()" id="searchBtn2"
								class="site-btn">검색</button>
						</div>
					</form>

				</div>
			</div>
			<div class='row'>
				<div class='searchResultDiv'>
					<p id='searchResult'>여기에 검색결과가 나옵니다</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 플로팅 메뉴 -->

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

	<!-- section start -->
	<section style="margin-bottom: 40px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="background-color: #f8f9fa">
					<div class="section-title" style="margin-top: 30px;">
						<h2>${category}뉴스</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- section end -->

	<!-- Blog Details Section Begin -->
	<section class="blog-details spad">
		<div class="container">
			<div class="row" style="align-items: flex-start;">
				<div class="col-lg-3 col-md-5 order-md-1 order-2">
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
				<div class="col-lg-9 col-md-7 order-md-1 order-1">
					<div class="blog__details__text">
						<h3>
							<c:out value="${detail.news_title}" />
						</h3>
						<h5 style="text-align: right; font-weight:400; color:#6c757d;">
							조회수
							<c:out value="${detail.news_count}" />
						</h5>
						<hr>

						<div style="text-align: center;">
							<img src="${detail.news_image}">
							<hr>
						</div>

						<h5>
							<i class="fas fa-chevron-right"></i>요약 기사 보기
						</h5>
						<ul>
							<li>
								<h5>
									[1]
									<c:out value="${keywordSplit[0]}" />
								</h5>
							</li>
							<li>
								<h5>
									[2]
									<c:out value="${keywordSplit[1]}" />
								</h5>
							</li>
							<li>
								<h5>
									[3]
									<c:out value="${keywordSplit[2]}" />
								</h5>
							</li>
						</ul>
						<a href='#' onclick="viewStyle(this);return false"><h5>
								<i class="fas fa-chevron-right"></i>본문보기
							</h5></a>
						<div style="display: none">
							<h5>
								<c:out value="${detail.news_contents}" />
							</h5>
						</div>
					</div>
					<div class="blog__details__content">
						<div class="row">
							<div class="col-lg-6">
								<div class="blog__details__author">
									<div class="blog__details__author__text">
										<h5>${detail.news_company}</h5>
										<h6 style="color:#6c757d;">Admin</h6>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<c:if test="${member != null}">
									<div class="blog__details__widget" style="text-align: right;">
										<button class="btn-primary btn-lg" style="border:0px;"onclick='saveScrap()'>스크랩</button>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Details Section End -->


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
      //로그인 버튼 펑션
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
         location.href = "/member/scrap?member_id=${member.member_id}&&pagingNum=1";
      }
      

      //플로팅 배너 펑션
      $(function() {

         var $w = $(window);
         // var $detailsHei = $('blog-details').outerHeight()
         var footerHei = $('footer').outerHeight();
         var $floatMenu = $('#floatMenu');

         $w.on('scroll', function() {

            var sT = $w.scrollTop();
            var val = $(document).height() - $w.height() - footerHei;

            if (sT >= val)
               $floatMenu.addClass('on');
            else
               $floatMenu.removeClass('on');

         });

      });
   </script>


</body>

</html>