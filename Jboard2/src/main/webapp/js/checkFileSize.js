function fileSizeCheck(file){
	
	const maxSize = 1024 * 1024 * 10 // 10MB
	let fileSize = file.files[0].size
	
	let browser=navigator.appName;
	
	
	//alert("파일 사이즈 : " + fileSize + ", 최대 파일 사이즈 : 10MB");
	
	if(fileSize > maxSize) {
		alert("첨부파일 사이즈는 10MB 이내로 등록 가능합니다. ");
		$('input[name=fname]').val('');
		return;
	}
}