<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String p_idx = ut.escapeHtml(request,"idx");

	try{
		StringBuffer query = new StringBuffer();
		query.append(" SELECT CASE WHEN M.member_type = 'P' THEN CONCAT(M.member_last_name,M.member_name) ");
		query.append("   ELSE C.cod_name END ");
		query.append(" FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_app A ON P.p_app_idx = A.e_idx ");
		query.append(" LEFT JOIN tbl_member M ON A.member_idx = M.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON A.member_idx = C.member_idx ");
		query.append(" WHERE P.p_idx = ? ");
		String member_name = dbconn.getString(conn, query, p_idx);
		pageContext.setAttribute("member_name", member_name);
		
		query = new StringBuffer();
		query.append(" SELECT Ph.* ,CASE WHEN Pm.p_unit = 'U' THEN 'USD' ELSE 'KRW' END as p_unit_str ");
		query.append(" ,CASE WHEN Ph.h_state = 'C' THEN '지급완료' ELSE '반려' END as h_state_str ");
		query.append(" FROM tbl_payment_history Ph LEFT JOIN tbl_payment Pm ON Ph.project_idx = Pm.project_idx ");
		query.append(" WHERE Ph.project_idx = ? ORDER BY Ph.h_date DESC ");
		List<Map<String,Object>> list = dbconn.getSql2ListObjectMap(conn, query, p_idx);
		pageContext.setAttribute("list", list);
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
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
					<h3 class="tit">${member_name} 지급 이력</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write pop" style="height: 300px;">
						<table class="mt15 mb10">
							<caption>지급 이력</caption>
							<colgroup>
								<col style="width:35%;">
								<col style="width:33%;">
								<col style="width:32%;">
							</colgroup>
							<thead>
								<tr>
									<th>지금일</th>
									<th>정산금액</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr><td colspan="3" align="center">데이터가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${list}">
											<tr>
												<td><fmt:formatDate value="${p.h_date}" pattern="yyyy-MM-dd"/></td>
												<td>
													<c:choose>
														<c:when test="${empty p.h_price}">0</c:when>
														<c:otherwise>
															<fmt:formatNumber value="${p.h_price}" pattern="#,###"/>
														</c:otherwise>
													</c:choose>
													${p.p_unit_str}
												</td>
												<td>${p.h_state_str}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>