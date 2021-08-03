<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
   
<html>
<head>
<title>게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>회원가입</title>
</head>

<style>
.form-control{
		width: 80%;
	}
#container{
     position:absolute;
     border: 2px solid coral;
     width:500px;
     height : 500px;
     left:0;
     top:0;
     right:0;
     bottom:0;
     margin: auto;
 }
</style>
<script type="text/javascript">

		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
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
			<section id="container">
				<h2>회원가입이올시다</h2>
				<h2>경진맨화이팅!!</h2>			
				<form action="/member/signUp" method="post">
						<div class="form-group has-feedback">
							<label class="control-label" for="member_id">ID</label>
							<input class="form-control" type="text"	id="member_id" name="member_id"/>
						</div>
						
						<div class="form-group has-feedback">
							<label class="control-label" for="member_password">PW</label>
							<input class="form-control" type="password"	id="member_password" name="member_password"/>
						</div>
						
						<div class="form-group has-feedback">
							<label class="control-label" for="member_name">Name</label>
							<input class="form-control" type="text"	id="member_name" name="member_name"/>
						</div>
						<div>
							<select id="member_age_range" name="member_age_range">
								<option value="청소년">청소년</option>
								<option value="20대">20대</option>
								<option value="30대">30대</option>
								<option value="40대">40대</option>
								<option value="50대">50대</option>
								<option value="60대">60대</option>
								<option value="70대이상">70대이상</option>
							</select>
						</div>
						<div>
							  <input type = "radio" id="member_gender" name = "member_gender" value = "male">남자<br>
							  <input type = "radio" id="member_gender" name = "member_gender" value = "female">여자<br>
						</div>
						<div class="form-group has-feedback">
							<label class="control-label" for="member_phone">핸드폰 번호</label>
							<input class="form-control" type="text" id="member_phone" name="member_phone">
						</div>
						<div class="form-group has-feedback">
						<button class="btn btn-success" type="submit" id="submit">회원가입</button>
						<button class="cencle btn btn-danger" type="button" >취소</button>
						</div>
				</form>
			</section>
		</body>
</html>