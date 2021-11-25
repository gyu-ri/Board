<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

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

#addContentReply{
position:absolute;
left:65.5%;
top: 805px;
transform:translate(-50%,-50%);

}
</style>



 



 


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
    
    <div class="form-group">
        <%-- <c:set var="contextPath" value="${contextPath}" scope="application" /> --%>
       <%-- <c:set var="contextPath" value="../board/src/main/webapp/resources/file" scope="application" /> --%>
       <%-- <c:set var="uploadPath" value='C:\Users\HGR\git\Board\board\src\main\webapp\resources\file\' scope="application"/> --%>
      <label for="file" class="form-label mt-4">첨부파일</label>
      <a href="${contextPath}/resources/file/${board.reFileName}" download="${board.fileName}"><c:out value="${board.fileName}"/></a>
      <!-- download=""공란으로 두면 원본 파일명으로 파일은 다운받는다 ""에 문자를 넣으면 그 입력한 문자로 파일명으로 다운 받아진다-->
      <!--  <input type="text" name="file" class="form-control" id="file" value="<c:out value="${board.fileName}"/>" readonly>-->
    </div>
    <input type="hidden" name="password01" id="password01" value="${board.password}"/><br />
    <input type="hidden" name="rno" id="rno" value="${reply.rno}"/>
    

   <input type="button" id="updateContent" value="수정/삭제" class="btn btn-primary" >
   <!-- <input type="button" id="deleteContent" value="삭제" class="btn btn-primary" > -->
   <!--  <button id="updateContent"  >수정</button> -->
    <!-- <button id="deleteContent" onclick="location.href='/deleteContent?no=${board.no}'">삭제</button> -->
  </fieldset>
</form>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<a href="/listPage?page=1" type="button" class="btn btn-primary" id="getList">목록으로</a>
<a href="javascript:window.history.go(-1);" type="button" class="btn btn-primary" id="back">뒤로</a>


<form action="addContentReply" method="get" name="contentReply">
<input type="hidden" name="no" id="no" value="${board.no}">
<input type="hidden" name="groupNo" id="groupNo" value="${board.groupNo}">
<input type="hidden" name="groupOrder" id="groupOrder" value="${board.groupOrder}">
<input type="hidden" name="indent" id="indent" value="${board.indent}"> 
<%-- <input type="hidden" name="title" id="title" value="${board.title}">--%>
<button type="submit" class="btn btn-primary" id="addContentReply">답글달기</button>
</form>

<!-- <button onclick="location='addContentReply'">답글달기</button> -->
   <!-- <input type="button" id="addContentReply" value="답글달기" class="btn btn-primary" > -->
<!--<button id="back" class="btn btn-primary"><a href="javascript:window.history.go(-1);">뒤로</a></button>-->





 <!-- 댓글 list 시작 -->
<%--     <div id="getReply">
 	<ol class="replyList">
 		<c:forEach items="${replyList}" var="replyList">
 			<li>
 				<p>
 					작성자 : ${replyList.writer}<br/>
 					작성 날짜 : <fmt:formatDate value="${replyList.writeDate}" pattern="yyyy-MM-dd"/>
 				</p>
 				<c:out value="${replyList.text}"></c:out><br/><br/>
 			</li>
 			<input type="button" id="updateReply" value="수정/삭제"  >
 		</c:forEach>
 	</ol>
 </div>   --%>
 
 <!-- 댓글 list 끝 -->
 
 


 

<!-- 댓글 작성 --> 
 <form name="replyList" id="replyList" onsubmit="return check()">
 		 <input type="hidden" name="no" id="no" value="${board.no}">
 	<p>
 		<label>작성자</label> <input type="text" name="replyWriter" id="replyWriter">
 	</p>
 	
 	<p>
 		<label>비밀번호</label> <input type="text" name="replyPassword" id="replyPassword">
 		<span id="passwordCheck02" style="display:none; color:red; ">6~16자 영문,숫자,특수문자를 사용하여 주세요</span>
 	</p>
 	
 	<p>
 		<textarea rows="5" cols="50" name="text" id="text" style="height: 200px; width: 1000px;"></textarea>
 	</p>
 	 <%-- <input type="hidden" name="replyPassword02" id="replyPassword02" value="${reply.password}"/>
 	 <input type="hidden" name="rno" id="rno" value="${reply.rno}"/> --%>
 	<p>
 		<button type="button" id="addReply">댓글 작성</button>
 	</p>
 
 </form>
 
 <!-- 댓글 list 시작 -->
 <section class="replyList">
 <!-- 댓글 list 출력 되는곳 -->
 
 </section>
 <!-- 댓글 list 끝 -->
 
 
<!-- <form id="modal02">
<div id="pwdCheck-modal02" class="modal fade" tabindex="-1" role="dialog">
<div class="modal-dialog" role="document">
	<div class="modal-content">
	<p>비밀번호를 입력해주세요</p>
	<input type="password" class="input-lg form-control"
			name="replyPassword" id="replyPassword" placeholder="Password" autocomplete="off" required>
	 <div class="password-modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
		<button type="button" class="btn btn-primary" id="replyPasswordCheck01">수정</button>
		<button type="button" class="btn btn-primary" id="replyPasswordCheck02">삭제</button>
		data-dismiss="modal" 이걸 버튼에 넣어주면 비밀번호 불일치시 모달창이 닫혀 버림 
		<button type="button" class="btn btn-primary" data-dismiss="modal" id="sendPwdCheck02">삭제</button>
	</div>
</div>
</div>
</div>
</form> -->

<!-- 게시글 수정 삭제 모달 -->
<form id="modal">
		<div id="pwdCheck-modal" class="modal fade" tabindex="-1"
			role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<p>비밀번호를 입력해주세요</p>
					<input type="password" class="input-lg form-control" name="password02" id="password02" placeholder="Password" autocomplete="off" required>
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

<!-- 댓글 삭제 모달 -->
	<form id=deleteReplyModal>
		<div id="pwdCheck-deleteReply" class="modal fade" tabindex="-1"
			role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<p>비밀번호를 입력해주세요</p>
					<input type="password" class="input-lg form-control" name="replyPwd02" id="replyPwd02" placeholder="Password" autocomplete="off" required>
					<div class="replyPassword-modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<!-- <button type="button" class="btn btn-primary" id="replyPasswordCheck01">수정</button> -->
						<button type="button" class="btn btn-primary" id="replyPasswordCheck02">삭제</button>
						<!-- data-dismiss="modal" 이걸 버튼에 넣어주면 비밀번호 불일치시 모달창이 닫혀 버림  -->
						<!-- <button type="button" class="btn btn-primary" data-dismiss="modal" id="sendPwdCheck02">삭제</button> -->
					</div>
				</div>
			</div>
		</div>
</form>
 
 
  <script>

 // 게시글 수정,삭제(모달)
$(function(){
	$("#updateContent").on("click", function(){
		$("#pwdCheck-modal").modal("show");
		
		 $("#pwdCheck-modal").on("shown.bs.modal", function() {
			 $("#password02").focus();	
			 });    //-> 이 코드는 모달 띄웠을때 커서 focus해주는 코드입니다
			 
			// $("#pwdCheck-modal").on("hidden.bs.modal", function() {
				// $("#modal")[0].reset();	
				 //입력한 값이 모달이 닫힐때 사라짐
				// });
	})
	
	$("#sendPwdCheck01").on("click",function(e){
		console.log("어디서 안되는거니")
		console.log($("#password01").val())
		console.log($("#password02").val())
		
		var formObj = $("form[role='form']");
		
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
			
			var formObj = $("form[role='form']");
			
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
 
//댓글 삭제(모달)
/*  $(function(){
		$("#deleteReply").on("click", function(){
			$("#pwdCheck-deleteReply").modal("show");
			
			 $("#pwdCheck-deleteReply").on("shown.bs.modal", function () {
				 $("#replyPassword02").focus();	
				 });    //-> 이 코드는 모달 띄웠을때 커서 focus해주는 코드입니다
				 // shown.bs.modal -> 모달의 열림이 끝나고 실행되는 이벤트
				 
				 $("#pwdCheck-deleteReply").on("hidden.bs.modal", function() {
					 $("#deleteReplyModal")[0].reset();	
					 //입력한 값이 모달이 닫힐때 사라짐
					 //hidden.bs.modal -> 모달의 닫힘이 끝나고 실행되는 이벤트
					 });
		})
		
		$("#replyPasswordCheck02").on("click",function(e){
			console.log("어디서 안되는거니")
			console.log($("#replyPassword").val())
			console.log($("#replyPassword02").val())
			
			const formObj = $("form[role='form']");
			
			if($("#replyPassword").val() == $("#replyPassword02").val()){
				console.log("출력하슈")
				formObj.attr("action","/updateContent");
				formObj.attr("method", "get");
				formObj.submit();
				
			}else{
				console.log("틀림!!!")
				alert("비밀번호가 일치하지 않습니다.")
				$("#modal2")[0].reset();
				$("#replyPassword").focus();
				
			}
			
			
			})
			
				$("#replyPasswordCheck02").on("click",function(e){
				console.log("어디서 안되는거니")
				console.log($("#replyPassword").val())
				console.log($("#replyPassword02").val())
				
				const formObj = $("form[role='form']");
				
				if($("#replyPassword").val() == $("#replyPassword02").val()){
					if(confirm("정말 삭제하시겠습니까?")){
					console.log("출력하슈")
					console.log("${reply.rno}")
					formObj.attr("action","/deleteReply");
					formObj.attr("method", "POST");
					formObj.submit();
					}else{
						$("#modal02")[0].reset();
						return false;
					}
					
				}else{
					console.log("틀림!!!")
					alert("비밀번호가 일치하지 않습니다.")
					$("#modal02")[0].reset();
					//&(this).find("#password02")[0].reset();
					$("#replyPassword").focus();
					
				}
			
				})
			
		
		}); */
		
//댓글 삭제(모달)
 $(function(){
		$(document).on("click",".deleteReply", function(){
			$("#pwdCheck-deleteReply").modal("show");
			
			 $("#pwdCheck-deleteReply").on("shown.bs.modal", function() {
				 $("#replyPwd02").focus();	
				 });    //-> 이 코드는 모달 띄웠을때 커서 focus해주는 코드입니다
				 // shown.bs.modal -> 모달의 열림이 끝나고 실행되는 이벤트
				 
				 $("#pwdCheck-deleteReply").on("hidden.bs.modal", function() {
					 $("#deleteReplyModal")[0].reset();	
					 //입력한 값이 모달이 닫힐때 사라짐
					 //hidden.bs.modal -> 모달의 닫힘이 끝나고 실행되는 이벤트
					 });
		})
		
		$("#replyPasswordCheck02").on("click",function(e){
			console.log("어디서 안되는거니")
			//console.log($("#replyPassword02").val())
			console.log($("#replyPwd02").val())
			
			var formObj = $("form[role='form']");
			
			if($("#replyPwd02").val() == $("#replyPassword02").val()){
				console.log("출력하슈")
				$.ajax({
					type : "POST",
					data : data,
					url : "/deleteReply",
					success : function(){
						replyList();
					}
					
				});
			}else{
				console.log("틀림!!!")
				alert("비밀번호가 일치하지 않습니다.")
				$("#deleteReplyModal")[0].reset();
				$("#replyPassword02").focus();
				
				}
					
				})
		});


</script>


<script>
 function replyList(){
 var bno=${board.no};
 $.getJSON("/getReply"+"?no="+bno, function(data){
	 var str = "";
	 
		 console.log(data);
	 $(data).each(function(){
		 
		 var writeDate = new Date(this.writeDate);
		 //writeDate = writeDate.toLocaleString("ko-US");
		 writeDate = writeDate.getFullYear() + "." + (writeDate.getMonth()+1) + "." + writeDate.getDate()  
		 
		 str += "<li>"
		 	 + "<div class='reply'>"
		 	 + "<span class='writer'>" + this.writer + "</span>"
		 	 + "<span class='date'> &nbsp;&nbsp;&nbsp;&nbsp;"  + writeDate + "</span>"
		 	 + "</div>"
		 	 + "<div class='replyContent' style='width:800px'>" + this.text + "</div>"
		 	 + "<div class='replyFooter'>"
		 	 + "<button type='button' class='modify' data-rno='"+ this.rno +"'>수정</button>"
		 	 + "<button type='button' class='deleteReply' id='deleteReply' data-rno='"+ this.rno +"'>삭제</button>"
		 	 + "<input type='hidden' id='rno' value='"+this.rno+"'>"
		 	 + "</div>"
		 	 + "</li>";
	 });
	 $("section.replyList ").html(str);
 	});
 }
 
 //이거 써줘야지 목록 출력됨
 replyList();

 </script>
<!-- <script>
//댓글 목록 출력
replyList();

</script> -->

<script>

 $(function(){
	$("#addReply").on("click",function(){
		
		//const replyDate = $("#replyList").serialize();
		//const writer = $("#replyWriter").val();
		//const password = $("#replyPassword").val();
		//const text = $("#text").val();
		
		//const param = {"writer":writer, "password":password, "text":text}
		//console.log(param);
		//console.log(replyDate);
		
		var text = {no : $("#no").val(),
					  writer : $("#replyWriter").val(),
				      password : $("#replyPassword").val(),
				      text : $("#text").val()
			 		  };
		console.log(text);
		$.ajax({
			type : "POST",
			url : "/addReply",
			data : JSON.stringify(text),
			contentType : "application/json",
			async : true,
			//dataType : "text",
			//data : JSON.stringify(replyDate),
			//contentType : "application/json",
			success : function check(data){
 	/* 			const f=document.content01;
				
			    const pattern = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\!\@\#\$\%\^\&\*\(\)\-\=]/gm;
			    
			    const pattern01 = /[0-9]/g;

			    const pattern02 = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

			    
				if(f.replyWriter.value ==""){
					alert("작성자를 입력해주세요")
					f.replyWriter.focus();
					return false;
				}
				if(!f.password.value.match(pattern02)){
					alert("비밀번호는 6~16자 영문,숫자,특수문자를 사용하여 주세요");
					f.password.focus();
					return false;
				} */
				console.log(data);
				replyList();
				$("#replyWriter").val("");
				$("#replyPassword").val("");
				$("#text").val("");
				//alert("성공");
			},
			error : function(){
				
				 if($("#replyWriter").val() == ""){
					alert("작성자를 입력해주세요");
				} 
				
				  if($("#replyPassword").val() == ""){
					alert("비밀번호를 입력해주세요");
				} 
				
				if($("#text").val() == ""){
					alert("댓글 내용을 입력해주세요");
				} 
				
				//alert("댓글을 입력해주세요");
			}
		});
		
	})
	
}); 





</script>




<script>

$(function(){
	$("#replyWriter").on("input", function(){
		var f = document.replyList;
		var inputLength = $(this).val().length;
		var a = $(this).val();
		if(inputLength > 5){
				//console.log(a);
			setTimeout(function(){
			alert("작성자는 5자까지 가능합니다")},100);
			f.replyWriter.focus();
			$(this).val(a.substring(0,5));
		}
		
	})
});


$(function(){
	$("#replyPassword").on("input", function(){
		const f = document.replyList;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		//const pattern03 = /[a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\-\=\`\~\+].{6,16}/gm;
		const pattern03 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{6,16}$/;
		const pattern04 = /[가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
		
		if(inputLength > 16){
			setTimeout(function(){
			alert("비밀번호는 16자까지 가능합니다")},100);
			f.replyPassword.focus();
			$(this).val(a.substring(0,16));
		}
		
	 	if(f.replyPassword.value.match(pattern04)){
			alert("한글이 입력 되었습니다");
			$(this).val(a.substring(0,0));
			f.replyPassword.focus(); 
			
	 	}
	 	if(!f.replyPassword.value.match(pattern03)){
	 		 $("#passwordCheck02").show();
	 		 
	 	}else{
			$("#passwordCheck02").hide();
		}
	 	
	 	
/* 		 if(!f.password.value.match(pattern03)){
			alert("비밀번호는 8~16자 영문,숫자,특수문자를 사용하여 주세요");
			$(this).val(a.substring(0,0));
			f.password.focus(); 
			
		} */
		
		// if(f.password.value.match(pattern03)){
		//	 console.log("pass~~")
		//}
	})
});



$(function(){
	$("#text").on("input", function(){
		const f = document.replyList;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		//$("#textLength").html("("+ a.length +"/500)");
		
		if(inputLength > 300){
			setTimeout(function(){
			alert("댓글은 200자까지 가능합니다")},100);
			$(this).val(a.substring(0,200));
			f.text.focus();
			//$("#textLength").html("(500/500)");
		}
		
	})
});



function check(){
	const f=document.content01;
	
    const pattern = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\!\@\#\$\%\^\&\*\(\)\-\=]/gm;
    
    const pattern01 = /[0-9]/g;

    const pattern02 = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;

    
	if(f.replyWriter.value ==""){
		alert("작성자를 입력해주세요")
		f.replyWriter.focus();
		return false;
	}
	
	
	if(f.replyPassword.value ==""){
		alert("비밀번호를 입력해주세요")
		f.replyPassword.focus();
		return false;
	}
	
	if(!f.replyPassword.value.match(pattern02)){
		alert("비밀번호는 6~16자 영문,숫자,특수문자를 사용하여 주세요");
		f.replyPassword.focus();
		return false;
	}

	if(f.text.value ==""){
		alert("내용을 입력해주세요")
		f.text.focus();
		return false;
	}
	

  	if(f.replyWriter.value.match(pattern) && f.replyPassword.value.match(pattern) && f.text.value.match(pattern)){
		return true;
	}else if(!f.replyWriter.value.match(pattern)){
		alert("작성자에 공백만 입력 하였습니다")
		f.replyWriter.focus();
		return false;
		
	}else if(!f.replyPassword.value.match(pattern)){
		alert("비밀번호에 공백만 입력 하였습니다")
		f.replyPassword.focus();
		return false;
		
	}else if(!f.text.value.match(pattern)){
		alert("내용에 공백만 입력 하였습니다")
		f.text.focus();
		return false;
	} 	 

 	 	
}
</script>

<!-- <script type="text/javascript">
		function replyEdit(replyWriter, text){
			$('#replyWriter'+replyWriter).html(
				"<textarea id='replyWriter"+replyWriter+"'>"+replyWriter+"</textarea>"
				+"<style>#edit_acontent"+text_idx+"{width:740px; height:80px; resize:none;} </style>"
			);
			
			$('#abt'+answer_idx).html(
				"<a onclick='answerEditSave("+answer_idx+","+qna_idx+")' id='btnEdit'>완료</a> "
				+"<a onclick='location.href='qnaDetail.do?idx="+qna_idx+"' id='btnCancel'>취소</a>"
			);
		}

		function answerEditSave(answer_idx, qna_idx){
			var acontent = $("#edit_acontent"+answer_idx).val();
			location.href='answerEdit.do?idx='+answer_idx+"&acontent="+acontent;
		}
	</script> -->

</body>
</html>