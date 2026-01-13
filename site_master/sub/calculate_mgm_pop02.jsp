<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:500px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">사유입력</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write view">
							<div class="t_area">
								<textarea name="reason_alert01" id="reason_alert01"  style="width:90%; height:300px;"></textarea>
							</div>
							<div class="btn_area align_c">
								<button class="btn" type="button">입력</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>