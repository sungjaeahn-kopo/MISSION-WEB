/**
 * 	Form check와 관련된 라이브러리
 */
function isNull(obj, msg) {
		if(obj.value == '') {
			alert(msg)
			obj.focus()
			return true
		}
		return false
	}