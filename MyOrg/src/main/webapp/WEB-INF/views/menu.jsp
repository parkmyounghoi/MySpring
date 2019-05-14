<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row" style="height: 20px;"></div>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-1">
				<c:choose>
					<c:when test="${menu eq 'home' }">
						<a class="btn btn-primary" href="/">Home</a>
					</c:when>
					<c:otherwise>
						<a class="btn" href="/">Home</a>
					</c:otherwise>							
				</c:choose>
			</div>
			<div class="col-sm-10">
				<ul class="nav nav-pills justify-content-center">
					<li class="nav-item">
						<c:choose>
							<c:when test="${menu eq 'member' }">
								<a class="nav-link active" href="/member">Member</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/member">Member</a>
							</c:otherwise>							
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${menu eq 'freeboard' }">
								<a class="nav-link active" href="/freeboard">FreeBoard</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/freeboard">FreeBoard</a>
							</c:otherwise>							
						</c:choose>
						
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${menu eq 'project' }">
								<a class="nav-link active" href="/project">Project</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/project">Project</a>
							</c:otherwise>							
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${menu eq 'guestbook' }">
								<a class="nav-link active" href="/guestbook">guestbook</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/guestbook">guestbook</a>
							</c:otherwise>							
						</c:choose>
					</li>
					<li class="nav-item">
						<c:choose>
							<c:when test="${menu eq 'fileupload' }">
								<a class="nav-link active" href="/fileupload">fileupload</a>
							</c:when>
							<c:otherwise>
								<a class="nav-link" href="/fileupload">fileupload</a>
							</c:otherwise>							
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
		<div class="row" style="height: 20px;"></div>
