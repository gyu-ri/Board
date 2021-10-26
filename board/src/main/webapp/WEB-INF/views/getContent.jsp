<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- include libraries(jQuery, bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script src="/static/js/getContent.js"></script> -->
<meta charset="UTF-8">
<title>상세보기</title>



<style type="text/css">

#updateContent{
position:absolute;
left:65.5%;
top: 764px;
transform:translate(-50%,-50%);

}

#back{
position:absolute;
left:75%;
top: 764px;
transform:translate(-50%,-50%);

}

#getList{
position:absolute;
left:70%;
top: 764px;
transform:translate(-50%,-50%);

}

</style>






  <script>

/*  $(function(){
		$("#deleteContent").on("click", function(){
			$("#pwdCheck-modal").modal("show");
			 
			 $("#pwdCheck-modal").on("hidden.bs.modal", function() {
				 $("#modal")[0].reset();	
				 });

			 $("#pwdCheck-modal").on("shown.bs.modal", function() {
				 $("#password02").focus();	
				 });
		
		
		$("#sendPwdCheck").on("click",function(e){
			console.log("어디서 안되는거니")
			console.log($("#password01").val())
			console.log($("#password02").val())
			
			const formObj = $("form[role='form']");
			
			if($("#password01").val() == $("#password02").val()){
				alert("정말 삭제하시겠습니까?")
				console.log("출력하슈")
				formObj.attr("action","/deleteContent?no=${board.no}");
				formObj.attr("method", "post");
				formObj.submit();
				
			}
			else{
				console.log("틀림!!!")
				alert("비밀번호가 일치하지 않습니다.")
				$("#modal")[0].reset();
				//&(this).find("#password02")[0].reset();
				$("#password02").focus();
				
			}
			
			
			})
		})
		});

 */

$(function(){
	$("#updateContent").on("click", function(){
		$("#pwdCheck-modal").modal("show");
		
		 $("#pwdCheck-modal").on("shown.bs.modal", function () {
			 $("#password02").focus();	
			 });    //-> 이 코드는 모달 띄웠을때 커서 focus해주는 코드입니다
			 
			 $("#pwdCheck-modal").on("hidden.bs.modal", function() {
				 $("#modal")[0].reset();	
				 //입력한 값이 모달이 닫힐때 사라짐
				 });
	})
	
	$("#sendPwdCheck01").on("click",function(e){
		console.log("어디서 안되는거니")
		console.log($("#password01").val())
		console.log($("#password02").val())
		
		const formObj = $("form[role='form']");
		
		if($("#password01").val() == $("#password02").val()){
			console.log("출력하슈")
			formObj.attr("action","/updateContent");
			formObj.attr("method", "get");
			formObj.submit();
			
		}else{
			console.log("틀림!!!")
			alert("비밀번호가 일치하지 않습니다.")
			$("#modal")[0].reset();
			$("#password02").focus();
			
		}
		
		
		})
		
			$("#sendPwdCheck02").on("click",function(e){
			console.log("어디서 안되는거니")
			console.log($("#password01").val())
			console.log($("#password02").val())
			
			const formObj = $("form[role='form']");
			
			if($("#password01").val() == $("#password02").val()){
				if(confirm("정말 삭제하시겠습니까?")){
				console.log("출력하슈")
				formObj.attr("action","/deleteContent?no=${board.no}");
				formObj.attr("method", "post");
				formObj.submit();
				}else{
					$("#modal")[0].reset();
					return false;
				}
				
			}else{
				console.log("틀림!!!")
				alert("비밀번호가 일치하지 않습니다.")
				$("#modal")[0].reset();
				//&(this).find("#password02")[0].reset();
				$("#password02").focus();
				
			}
		
			})
		
	
	});


</script>


</head>
<body>
	<form role="form" method="get" autocomplete="off" >
    <input type="hidden" name="no" id="no" value="${board.no}"/><br />
  <fieldset>
    <legend>상세보기</legend>
    <div class="form-group">
      <label for="title" class="form-label mt-4">제목</label>
        <input type="text" name="title" class="form-control" id="title" size="200" readonly value="<c:out value="${board.title}"/>">
     <!--   <c:out value="${board.title}"></c:out> -->
    </div>
     <div class="form-group">
      <label for="writer" class="form-label mt-4">작성자</label>
      <input type="text" name="writer" class="form-control" id="writer" value="<c:out value="${board.writer}"/>" readonly>
    </div>
    <div class="form-group">
      <label for="writeDate" class="form-label mt-4">작성일</label>
      <fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd" />
    </div>

    <div class="form-group">
      <label for="content" class="form-label mt-4">내용</label>
      <textarea class="form-control" name="content" id="content" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 500px; width: 1200px;" readonly><c:out value="${board.content}"/></textarea>
    </div>
    <input type="hidden" name="password01" id="password01" value="${board.password}"/><br />
    
    

   <input type="button" id="updateContent" value="수정/삭제" class="btn btn-primary" >
   <!-- <input type="button" id="deleteContent" value="삭제" class="btn btn-primary" > -->
   <!--  <button id="updateContent"  >수정</button> -->
    <!-- <button id="deleteContent" onclick="location.href='/deleteContent?no=${board.no}'">삭제</button> -->
  </fieldset>
</form>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<a href="/listPage?page=1" type="button" class="btn btn-primary" id="getList">목록으로</a>
<a href="javascript:window.history.go(-1);" type="button" class="btn btn-primary" id="back">뒤로</a>
<!--<button id="back" class="btn btn-primary"><a href="javascript:window.history.go(-1);">뒤로</a></button>-->


<form id="modal">
<div id="pwdCheck-modal" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog" role="document">
	<div class="modal-content">
	<p>비밀번호를 입력해주세요</p>
	<input type="password" class="input-lg form-control"
			name="password02" id="password02" placeholder="Password" autocomplete="off" required>
	 <div class="password-modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-primary" id="sendPwdCheck01">수정</button>
		<button type="button" class="btn btn-primary" id="sendPwdCheck02">삭제</button>
		<!-- data-dismiss="modal" 이걸 버튼에 넣어주면 비밀번호 불일치시 모달창이 닫혀 버림  -->
		<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" id="sendPwdCheck02">삭제</button> -->
	</div>
</div>
</div>
</div>
</form>



 



</body>
</html>