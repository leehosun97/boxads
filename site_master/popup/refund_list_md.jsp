<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%
	String pidx = ut.escapeHtml(request, "idx");
	MyDBConDao dbconn = new MyDBConDao();
	StringBuffer str = new StringBuffer();
	
	str.append(" SELECT p_admin_desc FROM tbl_project WHERE p_idx = ? ");
	HashMap<String,String> hmap = dbconn.getSqlToMap(str, pidx);
	pageContext.setAttribute("pro", hmap);
	
%>
<%@ include file="../inc/header.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:540px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">사유보기 </h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write pop" style="height: 200px;">
						<p class="refund_txt">${pro.p_admin_desc}</p>
						<div class="write_btn align_c mt10">
							<button class="btn_modify" onclick="popup_layer_close()">확인</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>