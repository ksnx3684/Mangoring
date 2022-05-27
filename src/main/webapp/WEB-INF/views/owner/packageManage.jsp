<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<h1>포장 주문 내역</h1>
	
	<div class="container">
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<th>주문자</th>
				<th>아이디</th>
				<th>주문 일시</th>
				<th>메뉴</th>
				<th>수량</th>
				<th>상태</th>
				<th></th>
			</tr>
			<c:forEach items="${packageList}" var="order" varStatus="status">
				<tr>
					<td>${fn:length(packageList) - status.index}</td>
					<td>${order.memberVO.name}</td>
					<td>${order.id}</td>
					<td>
						<fmt:formatDate value="${order.payDate}" pattern="yyyy년 M월 d일"/>
					</td>
					<td>
						<c:forEach items="${order.paymentDetailVOs}" var="detail">
							${detail.menuVO.name} <br>
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${order.paymentDetailVOs}" var="detail">
							${detail.menuCount} <br>
						</c:forEach>
					</td>
					<td>
						<c:choose>
							<c:when test="${order.status eq 1}">
								방문 대기
							</c:when>
						</c:choose>
					
					</td>
					<td>
						<a class="btn btn-warning" href="#">상세 보기</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		<div>
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" href="./packageManage?pn=${pager.pre?pager.startNum-1:1}&restaurantNum=${pager.restaurantNum}" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<c:choose>
			    		<c:when test="${pager.pn eq i}">
			    			<li class="page-item active" aria-current="page">
						      <a class="page-link" href="./packageManage?pn=${i}&restaurantNum=${pager.restaurantNum}">${i}</a>
						    </li>
			    		</c:when>
			    		<c:otherwise>
			    			<li class="page-item"><a class="page-link" href="./packageManage?pn=${i}&restaurantNum=${pager.restaurantNum}">${i}</a></li>
			    		</c:otherwise>
			    	</c:choose>
			    </c:forEach>
			    <li class="page-item">
			      <a class="page-link" href="./packageManage?pn=${pager.next?pager.lastNum+1:pager.lastNum}&restaurantNum=${pager.restaurantNum}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		</div>
	</div>
	
	
	
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Jquery Library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</body>
</html>