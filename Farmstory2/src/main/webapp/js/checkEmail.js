
/*
날짜 : 2021/06/08
이름 : 이진유
내용 : 자바스크립트 회원가입 이메일 중복 검사
*/
var isEamilOk = false;

$(function(){
    		
    		$('input[name=email]').focusout(function(){
    			
    			var email = $(this).val();
    			var param = {'email':email};
    			
    			$.ajax({
    				url:'/Farmstory2/user/proc/checkEmail.jsp',
    				type:'get',
    				data: param,
    				dataType:'json',
    				success:function(data){
    					if(data.result == 1) {
    						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
							isEamilOk = false;	
    					} else {
    						$('.resultEmail').css('color', 'green').text('사용 가능한 이메일 입니다.')
							isEamilOk = true;	
    					}
    				}
    			});
    		});
    		
    	});