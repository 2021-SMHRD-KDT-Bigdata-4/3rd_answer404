<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			
			<section id="container">
				<form role="form" method="post">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="bno">뉴스 번호</label><input type="text" id="news_index" name="news_index" value="${detail.news_index}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="news_title" name="news_title" value="${detail.news_title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="news_contents" name="contents"><c:out value="${detail.news_contents}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">조회수</label><input type="text" id="news_count" name="news_count" value="${detail.news_count}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${detail.news_date}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">카테고리</label><input type="text" id="news_kategorie" name="news_kategorie" value="${detail.news_kategorie}" />
								</td>
							</tr>
									
						</tbody>			
					</table>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>