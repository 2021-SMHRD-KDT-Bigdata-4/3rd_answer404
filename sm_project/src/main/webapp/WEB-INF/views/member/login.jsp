<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>

<link rel="stylesheet" href="${cpath}/resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${cpath}/resources/css/style.css" type="text/css">

</head>
<script type="text/javascript">

function loginAction(){
	    opener.location.reload(); //부모창 리프레쉬
       
}

function signUp(){
	location.href="/member/signUp"
}

function reset() {
	self.close();
}


</script>
<body>
<div class="checkout__order">
		<div class="header__logo">
			<img onclick ="reset()" src="${cpath}/resources/img/logo.png" alt="">
		</div>
		
		<form name='login' method="post"  action="/member/Login">
		<div class="col-lg-8 col-md-6">
			<div class="row">
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>ID <span>*</span></p>
						<input type="text" id="member_id" name="member_id" placeholder="ID">
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>PW <span>*</span></p>
						<input type="password" id="member_password" name="member_password" placeholder="PW">
					</div>
				</div>
			</div>
		</div>
		<button id ="loginBtn" type="submit" onclick= "loginAction();" class="site-btn">로그인</button>
		<button onclick ="signUp()" type="button" class="site-btn">회원가입</button>
	</form>
</div>

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