<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String p_idx = ut.escapeHtml(request,"idx");
	try{
		StringBuffer query = new StringBuffer(" SELECT * FROM tbl_partner WHERE p_idx = ?");
		Map<String,String> p_data = dbconn.getSqlToMap(conn, query, p_idx);
		pageContext.setAttribute("p_data", p_data);
		
		if(p_data.isEmpty()){
			out.print("<script>alert('잘못된 접근입니다.');window.close();</script>");
			return;
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
<%@ include file="../inc/header.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:540px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">협력사</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write pop">
						<table class="mt15 mb10">
							<caption>협력사 보기 보기</caption>
							<colgroup>
								<col style="width:22%;">
								<col style="width:28%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">회사명</th>
									<td colspan="3">${p_data.p_name}</td>
								</tr>
								<tr>
									<th scope="row">전화번호</th>
									<td>${p_data.p_tel}</td>
									<th scope="row">팩스번호</th>
									<td>${p_data.p_fax}</td>
								</tr>
								<tr>
									<th scope="row">담당자</th>
									<td>${p_data.p_ch_person}</td>
									<th scope="row">사업자번호</th>
									<td>${p_data.p_biz_num}</td>
								</tr>
								<tr>
									<th scope="row">대표자</th>
									<td colspan="3">${p_data.p_rp_person}</td>
								</tr>
								<tr>
									<th scope="row">최종설정위치</th>
									<td colspan="3">${p_data.p_address}</td>
								</tr>
								<tr>
									<th scope="row">업태</th>
									<td>${p_data.p_type_1}</td>
									<th scope="row">종목</th>
									<td>${p_data.p_type_2}</td>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<td colspan="3">${p_data.p_email}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>