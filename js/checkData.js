/**
 *	객체 값이 비어있는지 확인하는 function
 *	form 관련 기능 파일
 */

	function isNull(obj, msg){
		if(obj.value == ''){
			alert(msg);
			obj.focus();
			return true;
		}
			return false;
	}
	
	// 회원가입시 입력안했을 때 * 넣어줌
	function notInput(obj){
		if(obj.value == ''){
			obj.value = '*';
		}
	}