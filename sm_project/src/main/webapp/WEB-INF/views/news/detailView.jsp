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
      //var member_id = '${member.member_id}';
      alert('${member.member_id}');
      //alert('${member.member_id}');
      //alert(detail_title);
      
      location.href = "${cpath}/member/scrapInsert?member_id=${member.member_id}&&news_index=${detail.news_index}&&news_title=${detail.news_title.replace("\"", "")}&&news_image=${detail.news_image}";
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
      <div class="col-lg-3">
         <div class="hero__search__form">
            <form action="listAll">
               <div>
                  <input type="text" name="keyword" id=keywordInput
                     value="${scri.keyword}" placeholder="용어 입력" />
                  <button type="submit" id="searchBtn" class="site-btn">검색</button>
               </div>
            </form>
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
                     <li class="active"><a href="./list">Home</a></li>

                     <li><a
                        href="${capth}./econo_category?news_category=경제&&pagingNum=1">경제</a></li>
                     <li><a href="${capth}./society_category?news_category=사회">사회</a></li>
                     <li><a href="${capth}./politics_category?news_category=정치">정치</a></li>
                     <li><a
                        href="${capth}./ITscience_category?news_category=IT/과학">IT/과학</a></li>
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


   <!-- Blog Details Hero End -->

   <!-- Blog Details Section Begin -->
   <section class="blog-details spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-5 order-md-1 order-2">
               <div class="blog__sidebar">
                  <div class="blog__sidebar__item">
                     <h4>Categories</h4>
                     <ul>
                        <li><a href="#">전체</a></li>
                        <li><a href="#">경제</a></li>
                        <li><a href="#">사회</a></li>
                        <li><a href="#">정치</a></li>
                        <li><a href="#">IT/과학</a></li>
                     </ul>
                  </div>
                  <div class="blog__sidebar__item">
                     <h4>최근 뉴스</h4>
                     <div class="blog__sidebar__recent">
                        <a href="#" class="blog__sidebar__recent__item">
                           <div class="blog__sidebar__recent__item__pic">
                              <img src="img/blog/sidebar/sr-1.jpg" alt="">
                           </div>
                           <div class="blog__sidebar__recent__item__text">
                              <h6>
                                 09 Kinds Of Vegetables<br /> Protect The Liver
                              </h6>
                              <span>MAR 05, 2019</span>
                           </div>
                        </a> <a href="#" class="blog__sidebar__recent__item">
                           <div class="blog__sidebar__recent__item__pic">
                              <img src="img/blog/sidebar/sr-2.jpg" alt="">
                           </div>
                           <div class="blog__sidebar__recent__item__text">
                              <h6>
                                 Tips You To Balance<br /> Nutrition Meal Day
                              </h6>
                              <span>MAR 05, 2019</span>
                           </div>
                        </a> <a href="#" class="blog__sidebar__recent__item">
                           <div class="blog__sidebar__recent__item__pic">
                              <img src="img/blog/sidebar/sr-3.jpg" alt="">
                           </div>
                           <div class="blog__sidebar__recent__item__text">
                              <h6>
                                 4 Principles Help You Lose <br />Weight With Vegetables
                              </h6>
                              <span>MAR 05, 2019</span>
                           </div>
                        </a>
                     </div>
                  </div>
                  <div class="blog__sidebar__item">
                     <h4>Search By</h4>
                     <div class="blog__sidebar__item__tags">
                        <a href="#">Apple</a> <a href="#">Beauty</a> <a href="#">Vegetables</a>
                        <a href="#">Fruit</a> <a href="#">Healthy Food</a> <a href="#">Lifestyle</a>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-lg-8 col-md-7 order-md-1 order-1">
               <div class="blog__details__text">

                  <h3>
                     <c:out value="${detail.news_title}" />
                  </h3>
                  <h5>
                     조회수
                     <c:out value="${detail.news_count}" />
                  </h5>
                  <hr>

                  <div>
                     <img src="${detail.news_image}">
                     <hr>
                  </div>
                  <a href='#' onclick="viewStyle(this);return false">본문보기</a>
                  <DIV style="display: none">
                     <c:out value="${detail.news_contents}" />
                  </DIV>


               </div>
               <div class="blog__details__content">
                  <div class="row">
                     <div class="col-lg-6">
                        <div class="blog__details__author">
                           <div class="blog__details__author__pic">
                              <img src="img/blog/details/details-author.jpg" alt="">
                           </div>
                           <div class="blog__details__author__text">
                              <h6>Michael Scofield</h6>
                              <span>Admin</span>
                           </div>
                        </div>
                     </div>
                     <div class="col-lg-6">
                        <div class="blog__details__widget">
                           <button onclick='saveScrap()'>스크랩</button>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Blog Details Section End -->

   <!-- Related Blog Section Begin -->
   <section class="related-blog spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title related-blog-title">
                  <h2>Post You May Like</h2>
               </div>
            </div>
         </div>
         <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
               <div class="blog__item">
                  <div class="blog__item__pic">
                     <img src="img/blog/blog-1.jpg" alt="">
                  </div>
                  <div class="blog__item__text">
                     <ul>
                        <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                        <li><i class="fa fa-comment-o"></i> 5</li>
                     </ul>
                     <h5>
                        <a href="#">Cooking tips make cooking simple</a>
                     </h5>
                     <p>Sed quia non numquam modi tempora indunt ut labore et
                        dolore magnam aliquam quaerat</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
               <div class="blog__item">
                  <div class="blog__item__pic">
                     <img src="img/blog/blog-2.jpg" alt="">
                  </div>
                  <div class="blog__item__text">
                     <ul>
                        <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                        <li><i class="fa fa-comment-o"></i> 5</li>
                     </ul>
                     <h5>
                        <a href="#">6 ways to prepare breakfast for 30</a>
                     </h5>
                     <p>Sed quia non numquam modi tempora indunt ut labore et
                        dolore magnam aliquam quaerat</p>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
               <div class="blog__item">
                  <div class="blog__item__pic">
                     <img src="img/blog/blog-3.jpg" alt="">
                  </div>
                  <div class="blog__item__text">
                     <ul>
                        <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                        <li><i class="fa fa-comment-o"></i> 5</li>
                     </ul>
                     <h5>
                        <a href="#">Visit the clean farm in the US</a>
                     </h5>
                     <p>Sed quia non numquam modi tempora indunt ut labore et
                        dolore magnam aliquam quaerat</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Related Blog Section End -->

   <!-- Footer Section Begin -->
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
      //로그인 버튼 펑션
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