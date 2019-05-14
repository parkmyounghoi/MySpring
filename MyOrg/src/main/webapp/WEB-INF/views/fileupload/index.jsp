<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<jsp:include page="../head.jsp" />
<script type="text/javascript">
	function doupload() {
		var form = $('#fileUploadForm')[0];
		var data = new FormData(form);
		data.append("CustomField", "This is some extra data, testing");
		
		$.ajax({
			type : "POST",
			enctype : 'multipart/form-data',
			url : "/fileupload/ajax",
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
				alert(' data ='+data )
				$('#imgpath').attr('src','/resources/'+data);
			},
			error : function(e) {
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row">
			<div class="col-sm-8 mx-auto">
				<form id="fileUploadForm" method="post" enctype="multipart/form-data">
					<input type="file" id="file" name="pfile" /> 
					<input onclick="doupload();" type="button" value="저장" />
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8 mx-auto">
				<c:if test="${not empty impath }">
					<img id="imgpath" src="/resources/${impath}" width="100%" />
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>




