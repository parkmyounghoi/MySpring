<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 
	 페이지 이동 방법
	1. <a> 태그 사용 href 주소 넣기....
	2. location.href javascript 이용
	3. <form> 태그를 사용 해서 action 값에 url 주소를 넣어서 이동 
-->
<html>
<head>
	<title>Home</title>
	<jsp:include page="head.jsp"/>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#join').click(function(){
				location.href='/member/join';
			});
			$('.slider').bxSlider();
		});
	</script>
</head>
<body>
	<div class="container">
		<jsp:include page="menu.jsp"/>
		<div class="row">
			<div class="col-sm-9">
				<div class="slider">
					<img src="/resources/Desert.jpg" style="width: 100%;"/>
					<img src="/resources/Chrysanthemum.jpg" style="width: 100%;"/>
					<img src="/resources/Hydrangeas.jpg" style="width: 100%;"/>
					<img src="/resources/Jellyfish.jpg" style="width: 100%;"/>
					<img src="/resources/Koala.jpg" style="width: 100%;"/>
					<img src="/resources/Lighthouse.jpg" style="width: 100%;"/>
					<img src="/resources/Penguins.jpg" style="width: 100%;"/>
					<img src="/resources/Tulips.jpg" style="width: 100%;"/>
				</div>
			</div>
			<div class="col-sm-3">
				<% 
// 					MemberDTO dto = (MemberDTO) session.getAttribute("db_md");
// 					out.print(dto);
				%>
				<c:if test="${ empty sessionScope.db_md }">
					<form action="/member/login" method="post">
						<div class="form-group">
							<label for="exampleInputEmail1">Email address</label>
							<input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label>
							<input name="pw" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
						</div>
						<div class="form-check">
							<input name="emailsave" type="checkbox" class="form-check-input" id="exampleCheck1">
							<label class="form-check-label" for="exampleCheck1">Check me out</label>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						<button id="join" type="button" class="btn btn-primary">Join</button>
						<br/>
						${logininfo}
					</form>
				</c:if>
				<c:if test="${ not empty sessionScope.db_md }">
					${ sessionScope.db_md.name } 님 환영 합니다 어서오세요.
					<button onclick="location.href='/member/logout'" type="button" class="btn btn-primary">logout</button>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6">
				최신회원목록들
			</div>
			<div class="col-sm-5 text-right">
				<a href="/member">더보기</a>
			</div>
			<div class="col-sm-1"></div>
		</div>
		<div class="row">
			<div class="col">
				<table class="table">
					<tr>
						<td>#</td>
						<td>idx</td>
						<td>id</td>
						<td>pw</td>
						<td>name</td>
						<td>email</td>
					</tr>
 					<c:forEach items="${memberList}" var="dto" varStatus="i">
 						<c:choose>
 							<c:when test="${i.index < 5 }">
 								<tr>
		 							<td>${i.index}</td>
		 							<td>${dto.idx}</td>
		 							<td>${dto.id}</td>
		 							<td>${dto.pw}</td>
		 							<td>${dto.name}</td>
		 							<td>${dto.email}</td>
		 						</tr>
 							</c:when>
 							<c:when test="${i.index >= 5}">
 							</c:when>
 						</c:choose>
 					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>




