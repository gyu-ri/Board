<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html>
<head>
<!--     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
       <!-- include libraries(jQuery, bootstrap) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>글수정</title>

<style type="text/css">

#updateContent{
position:absolute;
left:65.5%;
top: 750px;
transform:translate(-50%,-50%);

}
</style>




<script>
function check(){
	const f=document.updateContent01;
	
    const pattern = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
    
    const pattern02 = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;
	
	
    if(f.title.value ==""){
		alert("제목을 입력해주세요")
		f.title.focus();
		return false;
	}
	
	if(f.writer.value ==""){
		alert("작성자를 입력해주세요")
		f.writer.focus();
		return false;
	}
	
	if(f.content.value ==""){
		alert("내용을 입력해주세요")
		f.content.focus();
		return false;
	}
	
	if(!f.password.value.match(pattern02)){
		alert("비밀번호는 6~16자 영문,숫자,특수문자를 사용하여 주세요");
		f.password.focus();
		return false;
	}
	
	
	if(f.title.value.match(pattern) && f.content.value.match(pattern) && f.writer.value.match(pattern)){
		return true;
	}else if(!f.title.value.match(pattern)){
		alert("제목에 공백만 입력 하였습니다")
		f.title.focus();
		return false;
		
	}else if(!f.content.value.match(pattern)){
		alert("내용에 공백만 입력 하였습니다")
		f.content.focus();
		return false;
		
	}else if(!f.writer.value.match(pattern)){
		alert("작성자에 공백만 입력 하였습니다")
		f.title.focus();
		return false;
	}

}

</script>

<script>


/* $(function(){
	$("#content").keyup(function(){
		const inputLength=$(this).val().length;
		const remain=500-inputLength;
		if(remain < 1){
			alert("500자까지만 작성 가능합니다.");
			f.content.focus();
		}
	})
});

$(function(){
	$("#title").keyup(function(){
		const inputLength=$(this).val().length;
		const remain=100-inputLength;
		if(remain < 1){
			alert("100자까지만 작성 가능합니다.");
			f.title.focus();
		}
	})
});

$(function(){
	$("#writer").keyup(function(){
		const inputLength = $(this).val().length;
		const remain=6-inputLength;
		if(remain < 1){
			alert("작성자는 5자까지만 작성 가능합니다.");
			f.writer.focus();
		}
	})
});
 */
 
/*  $(function(){
		$("#content").keyup(function(){
			const f=document.updateContent01;
			const inputLength = $(this).val().length;
			const a = $(this).val();
			$("#textLength").html("("+ a.length +"/500)");
			if(inputLength > 500){
				alert("내용은 500자까지만 작성 가능합니다.");
				f.content.focus();
				$(this).val(a.substring(0,500));
				$("#textLength").html("(500/500)");
			}
		})
	});

 $(function(){
		$("#title").keyup(function(){
			const f=document.updateContent01;
			const inputLength = $(this).val().length;
			const a = $(this).val();
			if(inputLength > 100){
				alert("제목은 100자까지만 작성 가능합니다.");
				f.title.focus();
				$(this).val(a.substring(0,100));
			}
		})
	});
 
 
$(function(){
	$("#writer").keyup(function(){
		const f=document.updateContent01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 5){
			alert("작성자는 5자까지만 작성 가능합니다.");
			f.writer.focus();
			$(this).val(a.substring(0,5));
		}
	})
});


$(function(){
	$("#content").mouseup(function(){
		const f=document.updateContent01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		$("#textLength").html("("+ a.length +"/500)");
		if(inputLength > 500){
			alert("내용은 500자까지만 작성 가능합니다.");
			f.content.focus();
			$(this).val(a.substring(0,500));
			$("#textLength").html("(500/500)");
		}
	})
}); 

 $(function(){
	$("#title").mouseup(function(){
		const f=document.updateContent01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 100){
			alert("제목은 100자까지만 작성 가능합니다.");
			f.title.focus();
			$(this).val(a.substring(0,100));
		}
	})
});

$(function(){
	$("#password").mouseup(function(){
		const f=document.updateContent01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 5){
			alert("비밀번호는 5자까지만 작성 가능합니다.");
			f.password.focus();
			$(this).val(a.substring(0,5));
		}
	})
});


$(function(){
	$("#writer").mouseup(function(){
		const f=document.updateContent01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 5){
			alert("작성자는 5자까지만 작성 가능합니다.");
			f.writer.focus();
			$(this).val(a.substring(0,5));
		}
	})
});
 */

$(function(){
	$("#content").keyup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		const a = $(this).val();
		if(!f.content.value.match(pattern02)){
			alert("내용에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.content.focus();
		}
	})
});

$(function(){
	$("#title").keyup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		const a = $(this).val();
		if(!f.title.value.match(pattern02)){
			alert("제목에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.title.focus();
		}
	})
});

$(function(){
	$("#writer").keyup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		const a = $(this).val();
		if(!f.writer.value.match(pattern02)){
			alert("작성자에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.writer.focus();
		}
	})
});

/* $(function(){
	$("#content").mouseup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.content.value.match(pattern02)){
			alert("내용에 공백만 입력 하였습니다.");
			f.content.focus();
			$(this).val(a.substring(0,0));
		}
	})
});

$(function(){
	$("#title").mouseup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.title.value.match(pattern02)){
			alert("제목에 공백만 입력 하였습니다.");
			f.title.focus();
		}
	})
});

$(function(){
	$("#writer").mouseup(function(){
		const f=document.updateContent01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.writer.value.match(pattern02)){
			alert("작성자에 공백만 입력 하였습니다.");
			f.writer.focus();
			$(this).val(a.substring(0,0));
		}
	})
}); */


$(function(){
	$("#content").on("keyup", function(){
		const f = document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		$("#textLength").html("("+ a.length +"/500)");
		
		if(inputLength > 500){
			alert("내용은 500자까지 가능합니다");
			f.content.focus();
			$(this).val(a.substring(0,500));
			$("#textLength").html("(500/500)");
		}
		
	})
});


$(function(){
	$("#title").on("keyup", function(){
		const f = document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 100){
			alert("제목은 100자까지 가능합니다");
			f.title.focus();
			$(this).val(a.substring(0,100));
		}
		
	})
});


$(function(){
	$("#password").on("keyup", function(){
		const f = document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		const pattern03 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{6,16}$/;
		const pattern04 = /[가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
		
		if(inputLength > 16){
			alert("비밀번호는 16자까지 가능합니다");
			f.password.focus();
			$(this).val(a.substring(0,16));
		}
		
	 	if(f.password.value.match(pattern04)){
			alert("한글이 입력 되었습니다");
			f.password.focus(); 
			
	 	}
	 	

	})
});


$(function(){
	$("#writer").on("keyup", function(){
		const f = document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 5){
			alert("작성자는 5자까지 가능합니다");
			f.writer.focus();
			$(this).val(a.substring(0,5));
		}
		
	})
});







</script>


<!-- <script>
	function contentChk(content){
	document.getElementById('result').value=
	document.getElementById('#textLength').value.length;
	}

</script>  -->

</head>
<body>v
		<form action="updateContent" method="post" name="updateContent01" onsubmit="return check()" enctype="multipart/form-data">
  <fieldset>
    <legend>글수정</legend>
    <div class="form-group">
      <label for="title" class="form-label mt-4">제목</label>
      <input type="text" name="title" class="form-control" id="title" value="<c:out value="${board.title}"/>" size="200" >
    </div>
     <div class="form-group">
      <label for="writer" class="form-label mt-4">작성자</label>
      <input type="text" name="writer" class="form-control" id="writer" value="${board.writer}" >
    </div>
    <div class="form-group">
      <label for="writeDate" class="form-label mt-4">작성일</label>
      <fmt:formatDate value="${board.writeDate}" pattern="yyyy-MM-dd" />
    </div>

    <div class="form-group">
      <label for="content" class="form-label mt-4">내용</label>
      <span id="textLength">(0/500)</span>
      <textarea class="form-control" name="content"  id="content" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 500px; width: 1200px;"><c:out value="${board.content}"/></textarea>
    </div>
    
     <div class="form-group">
      <label for="file" class="form-label mt-4">파일 첨부</label>
       <a href="${contextPath}/${board.fileName}" download><c:out value="${board.fileName}"/></a>
     <!--   <input type="button" value="변경" id="changeFile">
      <input type="file" name="file" class="form-control" id="fileUpload" > -->
    </div> 
    
    <input type="hidden" name="no" id="no" value="${board.no}"/><br />
    <input type="submit" id="updateContent" class="btn btn-primary" value="수정완료">
  </fieldset>
</form>
</body>
</html>