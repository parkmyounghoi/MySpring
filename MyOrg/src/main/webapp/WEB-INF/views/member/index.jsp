<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<jsp:include page="../head.jsp" />
</head>
<body>
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="jumbotron">
			<h1 class="display-4">안녕하세요.</h1>
			<p class="lead">회원목록들 입니다.</p>
			<hr class="my-4">
			<p>페이지처리</p>
		</div>

		<div class="row">
			<div class="col">
				<table class="table">
					<tr>
						<th>#</th>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
					</tr>
					<c:forEach items="${memberListPage}" var="dto">
						<tr>
							<td>${dto.idx}</td>
							<td>${dto.id}</td>
							<td>${dto.name}</td>
							<td>${dto.email}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<nav aria-label="memberPage">
					<ul class="pagination justify-content-center">
						<c:choose>
							<c:when test="${page eq '1'}">
								<li class="page-item disabled">
									<a class="page-link" href="/member/pre">Previous</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/member/pre">Previous</a>
								</li>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="1" end="${memberListCount}" varStatus="i">
							<li class="page-item">
								<a class="page-link" href="/member/${i.index}">${i.index}</a>
							</li>
						</c:forEach>
						<c:choose>
							<c:when test="${page eq memberListCount}">
								<li class="page-item disabled">
									<a class="page-link" href="/member/next">Next</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/member/next">Next</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>




