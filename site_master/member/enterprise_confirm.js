/**
 * 
 */

function isConfirm(tag, member_idx) {
	var userForm = document.forms["userForm"];
	if ($(tag).val() == '승인') {
		console.log("YYYㅡㅡㅡㅡㅡmember_idxㅡㅡㅡㅡㅡ" + member_idx)
		var agree = confirm("승인 하시겠습니까?");
		if (agree) {
			document.userForm.action = "confirm_action.jsp?member_idx=" + member_idx + "&confirm=Y";
			document.userForm.method = "post";
			document.userForm.submit();
		}
	}
	if ($(tag).val() == '미승인')  {
		console.log("NNNㅡㅡㅡㅡㅡmember_idxㅡㅡㅡㅡㅡ" + member_idx)
		var agree = confirm("승인 취소하시겠습니까?");
		if (agree) {
			document.userForm.action = "confirm_action.jsp?member_idx=" + member_idx + "&confirm=N";
			document.userForm.method = "post";
			document.userForm.submit();
		}
	}
}