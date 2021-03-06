<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
   
<html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>===== 회원 가입 =====</title>

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
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){				
				location.href = "/member/login";						    
			})
		
			$("#submit").on("click", function(){
				if($("#member_id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#member_id").focus();
					return false;
				}
				if($("#member_phone").val()==""){
					alert("핸드폰번호를 입력해주세요.");
					$("#member_password").focus();
					return false;
				}
				if($("#member_password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#member_password").focus();
					return false;
				}
				if($("#member_name").val()==""){
					alert("이름을 입력해주세요.");
					$("#member_name").focus();
					return false;
				}
			});			
		})
</script>
	
		<body>

				<form action="/member/signUp" method="post">
						<div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>ID<span>*</span></p>
										<input class="form-control" type="text"	id="member_id" name="member_id"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>PW<span>*</span></p>
                                        <input class="form-control" type="password"	id="member_password" name="member_password"/>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input class="form-control" type="text"	id="member_name" name="member_name"/>
                            </div>
                            
                            <div class="checkout__input">
                                <p>핸드폰 번호<span>*</span></p>
                                <input class="form-control" type="text"	id="member_phone" name="member_phone"/>
                            </div>

                            <div class="checkout__input">
                                <p>연령대<span>*</span>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                                성별<span>*</span></p>
                            </div>
                                               	
                            <div class="checkout__input" style="display: flex;">
                            
								<select class= "select" id="member_age_range" name="member_age_range">
									<option value="20대 이하">20대 이하</option>
									<option value="30대">30대</option>
									<option value="40대">40대</option>
									<option value="50대">50대</option>
									<option value="60대 이상">60대 이상</option>
								</select>
								&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
								
								<select class="select" id="member_gender" name="member_gender">
										<option value="남자">남자</option>
										<option value="여자">여자</option>
								</select>
							
                            </div>
                            <button id ="loginBtn" type="submit" class="site-btn">회원가입</button>
                        </div>
                        
				</form>

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