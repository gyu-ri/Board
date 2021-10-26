

 $(function(){
		$("#deleteContent").on("click", function(){
			$("#pwdCheck-modal").modal("show");
		})
		$("#sendPwdCheck").on("click",function(e){
			console.log("어디서 안되는거니")
			console.log($("#password01").val())
			console.log($("#password02").val())
			
			const formObj = $("form[role='form']");
			
			if($("#password01").val() == $("#password02").val()){
				console.log("출력하슈")
				formObj.attr("action","/deleteContent?no=${board.no}");
				formObj.attr("method", "post");
				formObj.submit();
				
			}
			
			})
		
		});
 

 
 

$(function(){
	$("#updateContent").on("click", function(){
		$("#pwdCheck-modal").modal("show");
	})
	$("#sendPwdCheck").on("click",function(e){
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
		}
		
		
		})
	
	});


