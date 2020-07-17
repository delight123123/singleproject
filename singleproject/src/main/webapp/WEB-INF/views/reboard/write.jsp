<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/mainTop.jsp" %>

<div class="content-wrapper">
	<div class="card">
		<div class="card-body">

            <form name="write" id="write" method="post" action="<c:url value='/write'/>">
				<fieldset>
					<div id="aa">
						<label for="title">제목</label>
						<input type="text" name="reboardTitle" id="title" class="form-control form-control-fw">
					</div>
					<div id="divdiv">
						<label for="bo_content">내용</label>
						<textarea id="bo_content" name="reboardContent"></textarea>
					</div>
					<div id="divdiv">
						<label for="upfile">파일</label>
						<input type="file" name="upfile" id="upfile" class="form-control form-control-fw">
					</div>
					<div id="lastdiv">
						<button type="submit" class="btn btn-gradient-danger btn-rounded btn-fw">작성완료</button>
					</div>
				</fieldset>
			</form>

		
		</div>
	</div>
</div>
<%@ include file="../inc/mainBottom.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
<style type="text/css">

#write{
	width: 100%;
	margin: 0 auto;
}
#write #aa,#divdiv,#lastdiv{
	clear: both;
		border-bottom: 1px solid #eee;
		padding: 5px 0;
		margin: 0;
		overflow: auto;
}
#write label{
		text-align: right;
		padding: 3px 15px 0 0;
		clear: left;		
		font-weight: bold;
}
#bo_content{
	overflow: hidden;
	width: 10%;
}
#write fieldset{
	width: 90%;
		padding: 0;
		margin: 0 auto;
		border: 0;
		border-bottom: 2px solid #e2e2e2;
		}
#title,#upfile{
	width: 90%;
}
#lastdiv{
	text-align: center;
}
</style>


<script type="text/javascript">
	$(function() {
		$("#mainBoard").addClass("active");
		
		CKEDITOR.replace('bo_content',{height: '300', width: '99%',
			filebrowserUploadUrl: "<c:url value='/ckimageup'/>"
		});
		

		
		
		
		
	});
</script>