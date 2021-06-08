
/*
날짜 : 2021/06/08
이름 : 이진유
내용 : 자바스크립트 회원가입 아이디 중복 검사
*/


$(function(){
    		
    		$('input[name=uid]').focusout(function(){
    			
    			var uid = $(this).val();
    			var param = {'uid':uid};
    			
    			$.ajax({
    				url:'/JBoard1/user/proc/checkUid.jsp',
    				type:'get',
    				data: param,
    				dataType:'json',
    				success:function(data){
    					if(data.result == 1) {
    						$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
    					} else {
    						$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.')	
    					}
    				}
    			});
    		});
    		
    	});