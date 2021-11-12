<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<!-- <script src="addContent.js"></script> -->

<title>Write</title>

<style type="text/css">

#add{
position:absolute;
left:65.5%;
top: 780px;
transform:translate(-50%,-50%);

}


#getList{
position:absolute;
left: 70%;
top: 780px;
transform:translate(-50%,-50%);

}

</style>





<!-- <script>
	function calc(){
	document.getElementById('result').value=
	document.getElementById('content').value.length;
	}

</script> -->



 <script>

/*  $(function(){
	$("#content").keyup(function(){
		const f=document.content01;
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
		const f=document.content01;
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
		const f=document.content01;
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
	$("#password").keyup(function(){
		const f=document.content01;
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
	$("#content").mouseup(function(){
		const f=document.content01;
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
		const f=document.content01;
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
		const f=document.content01;
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
		const f=document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		if(inputLength > 5){
			alert("작성자는 5자까지만 작성 가능합니다.");
			f.writer.focus();
			$(this).val(a.substring(0,5));
		}
	})
}); */

/* $(function(){
	$("content").on("input", function(){
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		const a = $(this).val();
		if(!f.content.value.match(pattern02)){
			alert("내용에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.content.focus();
		}
	})
	
	
}) */

//공백 체크
/*  $(function(){
	$("#content").keyup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\!\@\#\$\%\^\&\*\(\)\-\=]/gm;
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
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
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
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
		const a = $(this).val();
		if(!f.writer.value.match(pattern02)){
			alert("작성자에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.writer.focus();
		}
	})
});


$(function(){
	$("#password").keyup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
		const a = $(this).val();
		if(!f.password.value.match(pattern02)){
			alert("비밀번호에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.password.focus();
		}
	})
}); */


/* $(function(){
	$("#content").mouseup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.content.value.match(pattern02)){
			alert("내용에 공백만 입력 하였습니다.");
			f.content.focus();
		}
	})
});

$(function(){
	$("#title").mouseup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.title.value.match(pattern02)){
			alert("제목에 공백만 입력 하였습니다.");
			f.title.focus();
		}
	})
});

$(function(){
	$("#writer").mouseup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		if(!f.writer.value.match(pattern02)){
			alert("작성자에 공백만 입력 하였습니다.");
			f.writer.focus();
		}
	})
}); */



/* $(function(){
	$("#content").keyup(function(){
		const inputLength = $(this).val().length;
		const remain=501-inputLength;
		if(remain < 1){
			alert("내용은 500자까지만 작성 가능합니다.");
			f.content.focus();
		}
	})
});

$(function(){
	$("#title").keyup(function(){
		const inputLength = $(this).val().length;
		const remain=101-inputLength;
		if(remain < 1){
			alert("제목은 100자까지만 작성 가능합니다.");
			f.title.focus();
		}
	})
});

$(function(){
	$("#password").keyup(function(){
		const inputLength = $(this).val().length;
		const remain=5-inputLength;
		//const pattern = /^[0-9]{6,50}$/g;
		if(inputLength > 5){
			alert("비밀번호는 5자까지만 작성 가능합니다.");
			//$(this).val().replace('pattern','');
			f.password.focus();
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
});  */




</script>


<!-- <script>

function spaceCheck(txt){
	txt = nvl(txt,'');
	txt = txt.replace(/&nbsp;/gi,"");
	return txt;
}
	

</script> -->



</head>
<body>


<form action="addContent" method="post" name="content01" onsubmit="return check()" >
  <fieldset>
    <legend>글작성</legend>
<c:out value="${board.groupNo}"/>
    <div class="form-group">
      <label for="title" class="form-label mt-4">제목</label>
     <input type="text"  name="title" class="form-control" id="title" aria-describedby="title"  size="200" placeholder="제목을 입력하세요 (최대 100자)">
    </div>
     <div class="form-group">
      <label for="writer" class="form-label mt-4">작성자</label>
      <input type="text" name="writer" class="form-control" id="writer"  size="30" placeholder="이름을 입력하세요 (최대 5자)" >
    </div>
    <div class="form-group">
      <label for="password" class="form-label mt-4">비밀번호</label>
      <input type="text" name="password" class="form-control" id="password" size="50" 
             placeholder="비밀번호를 입력하세요 (8~16자 영문,숫자,특수문자를 사용하여 주세요)"  > <!-- onKeyup="this.value=this.value.replace(/[^0-9]/g,'')" -->
    </div>

    <div class="form-group">
      <label for="content" class="form-label mt-4">내용</label>
      <span id="textLength">(0/500)</span>
      <!--  <input type="number" id="result" value="0" readonly style="border:none; text-align:right" >/500-->
      <!--<input type="text" id="textLength" readonly style="border:none;">-->
      <textarea class="form-control" name="content" id="content" rows="3" style="margin-top: 0px; margin-bottom: 0px; height: 500px; width: 1200px;"  placeholder="내용을 입력하세요 (최대 500자)"></textarea>
    </div>
    <button type="submit" class="btn btn-primary" id="add">작성</button>
    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
<a href="/listPage?page=1" type="button" class="btn btn-primary" id="getList">목록으로</a>
  </fieldset>


</form>


 <script>
function check(){
	const f=document.content01;
	
    const pattern = /[a-zA-Z0-9가-힣ㄱ-ㅎㅏ-ㅣ\!\@\#\$\%\^\&\*\(\)\-\=]/gm;
    
    const pattern01 = /[0-9]/g;

    const pattern02 = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,16}$/;
    
 /*    if(!f.password.value.macth(pattern01)){
    	alert("비밀번호에 숫자만 입력해주세요")
    	this.value.replace(/[^0-9]/g,'')
    	f.password.focus();
    	return false;
    } */
   
	
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
	
	
	if(f.password.value ==""){
		alert("비밀번호를 입력해주세요")
		f.password.focus();
		return false;
	}
	
	if(!f.password.value.match(pattern02)){
		alert("비밀번호는 6~16자 영문,숫자,특수문자를 사용하여 주세요");
		f.password.focus();
		return false;
	}
/* 	if(f.password.value.length > 5){
		alert("비밀번호를 5자리만 입력해주세요")
		f.password.focus();
		return false;
	} */
	
	if(f.content.value ==""){
		alert("내용을 입력해주세요")
		f.content.focus();
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


 <!-- <script>
 function contentChk(content08){
	 const txt = document.getElementById("content").value;
	 console.log(content08)
		console.log("뭐야1")
		document.getElementById("textLength").innerHTML("("+ content08.length +"/500)");
	//	const b = this.value();
	if(content08.length > 500){
		console.log(txt)
		//console.log(txt.substr(0,300))
		console.log("뭐야2")
		alert("500자 이상은 입력 불가합니다");
		//const a = txt.substring(0,5);
		const a = content08.substring(0,5);
		console.log("뭐야3")
			document.getElementById("textLength").innerHTML("(500/500)");
	//	console.log(a)
	//	console.log(b)
		//this.value(a);
		//document.write(a);
		//document.getElementById("content").setAttribute("content","a");
		console.log("뭐야4")
		//$(this).val(a.substring(0,5));
	}
}

</script> -->

<script>
$(function(){
	$("#content").on("input", function(){
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
	$("#title").on("input", function(){
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
	$("#password").on("input", function(){
		const f = document.content01;
		const inputLength = $(this).val().length;
		const a = $(this).val();
		//const pattern03 = /[a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\-\=\`\~\+].{6,16}/gm;
		const pattern03 = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{6,16}$/;
		const pattern04 = /[가-힣ㄱ-ㅎㅏ-ㅣ]/gm;
		
		if(inputLength > 16){
			alert("비밀번호는 16자까지 가능합니다");
			f.password.focus();
			$(this).val(a.substring(0,16));
		}
		
	 	if(f.password.value.match(pattern04)){
			alert("한글이 입력 되었습니다");
			//$(this).val(a.substring(0,0));
			f.password.focus(); 
			
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
	$("#writer").on("input", function(){
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



/* $(function(){
	$("#title").keyup(function(){
		const f=document.content01;
		const pattern02 = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
		const a = $(this).val();
		if(!f.title.value.match(pattern02)){
			alert("제목에 공백만 입력 하였습니다.");
			$(this).val(a.substring(0,0));
			f.title.focus();
		}
	})
}); */
</script>


</body>
</html>