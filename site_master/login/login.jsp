<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>

    <script src="/js/common.js"></script>
    <script>
      function validate_frm() {
			var check = chkFrm('frm');
			if (check) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	<div class="login_bg"></div>
	<div class="login_box">
		<div class="logo">
			<h1><img src="/images/common/main_logo.png" alt="logo:factomars"></h1>
			<h2>ADMINISTRATOR</h2>
		</div>
		<div class="login">
			<p class="txt">관리자 페이지 입니다.<br>아이디와 패스워드를 입력해주세요</p>
			<form name="frm" action="login_action.jsp" method="post" onsubmit="return validate_frm();">
				<fieldset>
					<legend>아이디, 비밀번호</legend>
					<div class="input_id">
						<span><input type="text" name="id" placeholder="Username" value="" required is_required="yes" item_name="아이디"></span>
						<!-- value 항상 기본값 ""넣어줘야  -->
					</div>
					<div class="input_pw mt10">
						<span><input type="password" name="password" placeholder="Password" value="" required is_required="yes" item_name="비밀번호"></span>
					</div>
					<button type="submit" class="btn_login"><span>LOGIN</span></button>
				</fieldset>
			</form>
		</div>
	</div>
</div>
</body>
</html>