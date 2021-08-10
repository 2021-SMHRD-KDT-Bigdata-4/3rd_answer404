<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크랩 해보기</title>
</head>
<body>

	<table class="table">
        <tr>
        	<td>[스크랩 인덱스]</td> 
           <td>[뉴스 이미지]</td>
           <td>[뉴스 타이틀]</td>
           <td>[스크랩 메모]</td>
           <td>[스크랩 삭제]</td>           
        </tr>
       <c:forEach var="list" items="${list}">
         <tr>
         	<td>${list.scrap_index}</td>
           <td>${list.news_image}</td>
           <td>>>${list.news_title}</td>
           <td>[${list.scrap_memo}]</td>
           <td><a href="/member/scrapDelete?member_id=${member.member_id}&&scrap_index=${list.scrap_index}">삭제</a></td>
        </tr>
      </c:forEach>
     </table>
     <br>
     <div>
	     <c:if test="${prev}">
	     	<span>[<a href="/member/scrap?member_id=${member.member_id}&&pagingNum=${startPageNum - 1}">이전</a>]</span>
		 </c:if>
		 
		<c:forEach begin="${startPageNum}" end="${endPageNum+1}" var="num">
			<span>
				<c:if test="${select != num}">
					<a href="/member/scrap?member_id=${member.member_id}&&pagingNum=${num}">${num}</a>
				</c:if>
				
				<c:if test="${select == num}">
					<b>${num}</b>
				</c:if>
				
			</span>
		</c:forEach>
		
		<c:if test="${next}">
			<span>[<a href="/member/scrap?member_id=${member.member_id}&&pagingNum=${endPageNum + 1}">다음</a>]</span>
		</c:if>
	</div>     
     <%-- 단순무식 페이징 전부보여주기
     <div>
		 <c:forEach begin="1" end="${pageNum}" var="num">
		    <span>
		     	<a href="/member/scrap?member_id=${member.member_id}&&pagingNum=${num}">${num}</a>
		  	</span>
		 </c:forEach>
	</div> --%>      
</body>
</html>