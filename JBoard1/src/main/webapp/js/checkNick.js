
/*
날짜 : 2021/06/08
이름 : 이진유
내용 : 자바스크립트 회원가입 닉네임 중복 검사
*/

var regNick = /^[a-zㄱ-힣0-9]{2,10}$/

var isNickOk = false
$(function(){
    		
    		$('input[name=nick]').focusout(function(){
    			
    			var nick = $(this).val();
    			var param = {'nick':nick};
    			
    			$.ajax({
    				url:'/JBoard1/user/proc/checkNick.jsp',
    				type:'get',
    				data: param,
    				dataType:'json',
    				success:function(data){
    					if(data.result == 1) {
    						$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
							isNick = false
    					} else {
    						
							if(regNick.test(nick)) {
								$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.')
								isNick = true	
							} else {
								$('.resultNick').css('color', 'red').text('닉네임은 최소 2~10자')
								isNick = false
							}
    					}
    				}
    			});
    		});
    		
    	});