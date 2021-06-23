
/*
날짜 : 2021/06/08
이름 : 이진유
내용 : 자바스크립트 회원가입 아이디 중복 검사
*/


// 정규표현식

var regUid = /^[a-z]+[a-z0-9]{3,10}$/ // 첫 글자

var isUidOk = false;

$(function(){
    		
    		$('input[name=uid]').focusout(function(){
    			
    			var uid = $(this).val();
    			var param = {'uid':uid};
    			alert(uid)
    			$.ajax({
    				url:'/Farmstory1/user/proc/checkUid.jsp',
    				type:'get',
    				data: param,
    				dataType:'json',
    				success:function(data){
    					if(data.result == 1) {
    						$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
							isUidOk = false;
    					} else {
							if(regUid.test(uid) == true) {
    							$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.')	;
								isUidOk = true;
							} else {
								$('.resultId').css('color', 'red').text('아이디는 영문 소문자, 숫자 조합 4 ~ 10자 입니다.');
								isUidOk = false;
							}
    					}
    				}
    			});
    		});
    		
    	});