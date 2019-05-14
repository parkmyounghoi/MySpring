<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
<jsp:include page="../head.jsp" />
<script type="text/javascript">
	$(document).ready(function(){
		$('#btnshow').click(function(){
			$('#guestbookModal').modal('show');
		});
		$('#btnmodalclose').click(function(){
			$('#guestbookModal').modal('hide');
		});
		$('#btnsaveclose').click(function(){
			var textArea = $('#myTextArea').val();
			$.ajax({
				url:"/guestbook/save",
				type: "post",
				data: {"content": textArea,"var":"test"},
				success : function(result){
					result = $.trim(result);
					if(result =='success'){
						$('#saveinfo').text('방명록을 작성을 완료하였습니다.');
						$('#saveCompleted').modal('show');		
					}else{
						$('#saveinfo').text('방명록을 작성에 실패하였습니다.');
						$('#saveCompleted').modal('show');
					}
				},
				error: function(e){
					alert(e.status);
					alert(e.responseText);
				}
			});
			$('#guestbookModal').modal('hide');
		});
		
		$('#btnsaveCompleted').click(function(){
			$('#saveCompleted').modal('hide');	
			location.href='/guestbook';
		});
		
		
		$('.deleteModalshow').click(function(){
// 			e.preventdefault();
			$('#idx').val($(this).attr('idx'));
			$('#deleteModal').modal('show');
		});
		
		$('#cancelbtn').click(function(){
			$('#deleteModal').modal('hide');
		});
		
		$('#deletebtn').click(function(){
			var selectIdx = $('#idx').val();
			$.ajax({
				url: "/guestbook/delete",
				type:"post",
				data : { "idx" : selectIdx },
				success : function(){
					$('#deleteModal').modal('hide');
					$('#saveinfo').text('방명록을 삭제를 완료하였습니다.');
					$('#saveCompleted').modal('show');				
				},
				error : function(){
					$('#deleteModal').modal('hide');
					$('#saveinfo').text('방명록을 삭제를 실패하였습니다.');
					$('#saveCompleted').modal('show');	
				}
			});
		});
		
		$('#btncloseupdate').click(function(){
// 			alert('연결되냐');
			var idx = $('#idx').val();
			var content = $('#myTextAreaupdate').val();
			$.ajax({
				url :"/guestbook/update",
				data : { "idx": idx , "content":content},
				type: "post",
				success:function(){
					$('#guestbookModalupdate').modal('hide');
					$('#saveinfo').text('방명록을 수정을 완료하였습니다.');
					$('#saveCompleted').modal('show');	
				}
			});
		});
		
// 		if( $('button').attr('data-dismiss') ='modal'){
// 			$('#guestbookModal').modal('hide');
// 		}
	});
	
	function updateModal(idx,content){
		$('#myTextAreaupdate').val(content);
		$('#idx').val(idx);
		$('#guestbookModalupdate').modal('show');
// 		alert("idx = "+idx);
// 		alert("content = "+content);
	}
</script>
</head>
<!-- 
	 리눅스 네트워크 -> 전산관리 서버관리
	 웹디자이너 포토샵 
	 풀스텍개발자 -> 웹퍼블리셔 프론트엔드 화면구현
	              -> 웹개발자 백엔드 DB 저장 수정 가져오기
-->
<body>
<input id="idx" type="hidden" name="idx"/>
	<!-- Modal -->
	<div class="modal fade" id="guestbookModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">방명록 글쓰기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<textarea id="myTextArea" class="form-control" rows="10"></textarea>
				</div>
				<div class="modal-footer">
					<button id="btnmodalclose" type="button" class="btn btn-secondary">
					닫기
					</button>
					<button id="btnsaveclose" type="button" class="btn btn-primary">
					저장
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="guestbookModalupdate">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">방명록 글수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<textarea id="myTextAreaupdate" class="form-control" rows="10"></textarea>
				</div>
				<div class="modal-footer">
					<button id="btnmodalcloseupdate" type="button" class="btn btn-secondary">
					닫기
					</button>
					<button id="btncloseupdate" type="button" class="btn btn-primary">
					수정
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="saveCompleted">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">안내문구</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="saveinfo">
					정상적으로 방명록을 작성하였습니다.
				</div>
				<div class="modal-footer">
					<button id="btnsaveCompleted" type="button" class="btn btn-secondary">
					닫기
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="deleteModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">안내문구</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="saveinfo">
					삭제 하시겠습니까?
				</div>
				<div class="modal-footer">
					<button id="cancelbtn" type="button" class="btn btn-success">
					취소
					</button>
					<button id="deletebtn" type="button" class="btn btn-danger">
					확인
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<jsp:include page="../menu.jsp" />
		<div class="row">
			<div class="col">
				<div class="jumbotron">
					<h1 class="display-4">방명록입니다.</h1>
					<p class="lead">bootstrap modal 라이브러리를 호출해서 구현했습니다.</p>
					<hr class="my-4">
					<p>글쓰기 버튼을 클릭시 modal창이 생성됩니다.</p>
					<p class="lead">
						<button id="btnshow" class="btn btn-primary btn-lg">
						 글쓰기
						</button>
					</p>
				</div>
			</div>
		</div>
		<c:forEach items="${list}" var="dto">
		<div class="row">
			<div class="col-sm-3">
				<img src="/resources/hu.jpg"/>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col">
						${dto.content}
					</div>
				</div>
				<div class="row">
					<div class="col">
						${dto.reg_date}
					</div>
				</div>
				<div class="row">
					<div class="col text-right">
						<button onclick="updateModal('${dto.idx}','${dto.content}');" class="btn btn-primary">수정</button>
						<button idx="${dto.idx}" class="deleteModalshow btn btn-primary">삭제</button>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<div style="height:300px;">
	
	</div>
	
					
				
</body>
</html>




