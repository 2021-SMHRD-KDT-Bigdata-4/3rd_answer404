<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
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
	<div>
		<form name='login' method="post" action="/member/Login">
				<input type="text" id="member_id" name="member_id" placeholder="ID">
				<br>
				<input type="password" id="member_password" name="member_password" placeholder="PW">
				<br>
				<button id ="loginBtn" type="submit" onclick= "loginAction();">로그인</button>
				<button onclick ="signUp()" type="button">회원가입</button>	
		</form>
				<button onclick ="reset()" type="button">초기화면으로(추후 로고식으로 대체)</button>
	</div>	
</body>
</html>