

$(function(){
    		
    		// 유효성 검증
    		$('#regForm').submit(function(){
    			if(!isUidOk) {
    				alert('아이디가 유효하지 않습니다. 다시 확인하십시오.')
    				return false;
    			}
    			
    			if(!isPassOk) {
    				alert('비밀번호가 유효하지 않습니다. 다시 확인하십시오.')
    				return false;
    			}
    			
    			if(!isNameOk) {
    				alert('이름 유효하지 않습니다. 다시 확인하십시오.')
    				return false;
    			}
    			
    			if(!isNickOk) {
    				alert('닉네임 유효하지 않습니다. 다시 확인하십시오.')
    				return false;
    			}
    			
    			if(!isEmailOk) {
    				alert('이메일가 유효하지 않습니다. 다시 확인하십시오.')
    				return false;
    			}
    			
    			
    			return true;
    		});
    		//
    	});