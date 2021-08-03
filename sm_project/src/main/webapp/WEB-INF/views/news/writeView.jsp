<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>뉴스게시판</title>
	</head>
	<body>
	
		<div id="root">
			<header>
				<h1>뉴스 게시판</h1>
			</header>
			<hr />		 
			<nav>
			  홈 - 글 작성
			</nav>
			<hr />
			<section id="container">
				<form role="form" method="post" action="/news/write">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">뉴스제목</label><input type="text" id="news_title" name="news_title" />
									
								</td>
							</tr>
							<tr>
								<td>
									<label for="content">내용</label><textarea id="news_content" name="news_content" ></textarea>
									
								</td>
							</tr>
							
							<tr>
							<td>
									<label for="date">작성날짜</label>
									<fmt:formatDate value="${news_date}" pattern="yyyy-MM-dd"/>					
							</td>
							</tr>
							
							<tr>
								<td>
									<label for="title">카테고리</label><input type="text" id="news_kategorie" name="news_kategorie" />
									
								</td>
							</tr>
								<tr>
								<td>
									<label for="title">뉴스url</label><input type="text" id="news_url" name="news_url" />
									
								</td>
							</tr>
												
							
							<tr>
								<td>						
									<button type="submit">작성</button>
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