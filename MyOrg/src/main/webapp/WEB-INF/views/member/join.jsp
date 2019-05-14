<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<jsp:include page="../head.jsp" />
</head>
<body>
<form action="/member/joinProc" method="post">
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row">
			<div class="col">
				회원가입
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">ID</span>
					</div>
					<input name="id" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">아이디를 입력하세요</span>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">PW</span>
					</div>
					<input name="pw" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">패스워드를 입력하세요</span>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">NAME</span>
					</div>
					<input name="name" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">이름을 입력하세요</span>
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">EMAIL</span>
					</div>
					<input name="email" type="text" class="form-control">
					<div class="input-group-append">
						<span class="input-group-text">이메일을 입력하세요</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				<button class="btn btn-primary">회원가입</button>
				<button onclick="location.href='/';" class="btn btn-primary">취소</button>
			</div>
		</div>
		<div class="row">
			<div class="col">${joininfo}</div>
		</div>
	</div>
</form>
</body>
</html>




