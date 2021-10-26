function check(){
	const f=document.content01;
    const pattern = /[a-zA-Z0-9가-힣ㄱ-ㅎ]/gm;
    
    const pattern01 = /[0-9]/g;
   
	
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
