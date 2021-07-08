
/*
날짜 : 2021/06/08
이름 : 이진유
내용 : 자바스크립트 회원가입 휴대폰 번호 중복 검사
*/

var isHpOk = false;

$(function(){
    		
    		$('input[name=hp]').focusout(function(){
    			
    			var hp = $(this).val();
    			var param = {'hp':hp};
    			
    			$.ajax({
    				url:'/Farmstory2/user/proc/checkHp.jsp',
    				type:'get',
    				data: param,
    				dataType:'json',
    				success:function(data){
    					if(data.result == 1) {
    						$('.resultHp').css('color', 'red').text('이미 사용중인 번호 입니다.');
							isHpOk = false;
    					} else {
    						$('.resultHp').css('color', 'green').text('사용 가능한 번호 입니다.')
							isHpOk = true;	
    					}
    				}
    			});
    		});
    		
    	});