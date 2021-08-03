<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>

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
		<section id="container">
			<form role="form" method="post" action="/news/write">
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
							<td><a href="/news/detailView?news_index=${list.news_index}"><c:out value="${list.news_title}"/></a></td>
							<td><c:out value="${list.news_contents}" /></td>
							<td><fmt:formatDate value="${list.news_date}"
									pattern="yyyy-MM-dd" /></td>
							<td><c:out value="${list.news_count}" /></td>
							<td><c:out value="${list.news_kategorie}" /></td>

						</tr>
					</c:forEach>

				</table>
				<div>
					<ul>
						<c:if test="${pageMaker.prev}">
							<li><a
								href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}" var="idx">
							<li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a
								href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		</section>
		<hr />
	</div>
</body>
</html>