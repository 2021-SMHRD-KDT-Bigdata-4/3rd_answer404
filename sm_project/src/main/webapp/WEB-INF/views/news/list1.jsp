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
<script>
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "list" + '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
<<<<<<< HEAD
	
	
function signUp(){
	location.href="/member/signUp"
}
	
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="/member/logout";
		})
		
})

	$(document).ready(function(){
		$("#mypage").on("click", function(){
			location.href="/member/myPage";
		})
		
})
</script>

<style type="text/css">
li {
	list-style: none;
	float: left;
	padding: 6px;
}
</style>
</head>
<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		<nav>홈 - 글 작성</nav>
		<hr />
		<div>
		<form name='login' method="post" action="/member/Login">
			<c:if test="${member == null}">
				<input type="text" id="member_id" name="member_id" placeholder="ID">
				<input type="password" id="member_password" name="member_password" placeholder="PW">
			
				<button id ="loginBtn" type="submit">로그인</button>
				<button onclick ="signUp()" type="button">회원가입</button>	
			</c:if>
		</form>
		</div>	
		<c:if test="${member != null }">
			<div>
				<p>${member.member_id}님 환영 합니다.</p>
				<button id="logoutBtn" type="button">로그아웃</button>
				<button id="mypage" type="button">마이페이지(임시)</button>
			</div>
		</c:if>
	
		<c:if test="${msg == false}">
			<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
		</c:if>
		
		<section id="container">
			<form role="form" method="get" action="/news/write">
				<table border="1">
					<tr>
						<th>번호</th>
						<th>뉴스제목</th>
						<th>뉴스내용</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>카테고리</th>
					</tr>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.news_index}" /></td>
							<td><a href="/news/detailView?news_index=${list.news_index}"><c:out
										value="${list.news_title}" /></a></td>
							<td><c:out value="${list.news_contents}" /></td>
							<td><fmt:formatDate value="${list.news_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.news_count}" /></td>
							<td><c:out value="${list.news_kategorie}" /></td>

						</tr>
					</c:forEach>

				</table>
				<div class="search">
					<select name="searchType">
						<option value="n"
							<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
						<option value="t"
							<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"
							<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
					</select> <input type="text" name="keyword" id="keywordInput"
						value="${scri.keyword}" />

					<button id="searchBtn" type="button">검색</button>

				</div>
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>