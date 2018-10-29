function inquiry_check() {
	theForm = document.frm1;
	if(theForm.name.value=="" && theForm.id.value=="" && theForm.departmentName.value=="") {
		//입력값이 모두 비어있으면
		alert("최소1개 이상의 검색 조건을 입력해주세요")
	}
	if(theForm.name.value=="" || theForm.id.value=="" || theForm.departmentName.value=="") {
		if(theForm.name.value=="") {
			theForm.name.value=(String)(Math.floor(Math.random()*10000));
		}
		if(theForm.id.value="") {
			theForm.id.value=Math.floor(Math.random()*10000); 
		}
		if(theForm.departmentName="") {
			theForm.name.value=(String)(Math.floor(Math.random()*10000));
		}
	}
}