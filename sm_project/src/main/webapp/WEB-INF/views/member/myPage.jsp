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
<script type="text/javascript">



</script>
<title>Insert title here</title>
</head>
<body>

<h2>마이페이지 상세 내용을 적어보기</h2>
<div class="container">
  <h2>${member.member_id}님의 마이 페이지</h2>
  <div>
    <h4>개인정보 수정</h4>
    <div class="panel-body">
    		<form id="frm" method="post" action="${cpath}/boardUpdate.do">
               <div>
               <input type="hidden" id="idx" name="idx" value="${vo.idx}">
                  <label>ID : </label> 
                  <input type="text" class="form-control" id="member_id" name="member_id" value="${member.member_id}">
               </div>
               <div>
                  <label>Password: </label> 
                  <input type="text" class="form-control" id="member_password" name="member_password" value="${member.member_password}">
               </div>  
               <div>
                  <label>핸드폰 번호: </label> 
                  <input type="text" class="form-control" id="member_phone" name="member_phone" value="${member.member_phone}">
               </div>               
               <input type='submit' value="수정" class='btn btn-primary btn-sm'>                  
               <input type='reset' value='취소' class='btn btn-warning btn-sm'>
               <input type='button' value='삭제' class='btn btn-info btn-sm' onclick ="goDel(${vo.idx})">
               <input type='button' value='목록' class='btn btn-success btn-sm' onclick ="goList()">            
            </form>    
    </div>
    <div class="panel-footer">빅데이터분석-4차(장경진)</div>
  </div>
</div>
</body>
</html>