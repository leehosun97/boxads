<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String p_idx = ut.escapeHtml(request, "idx");

	try{
		StringBuffer query = new StringBuffer();
		query.append(" SELECT P.p_idx ,T.* ,O.o_total_sup ,O.o_total_tax ,O.o_total_gross ,O.o_tax_state ");
		query.append(" ,CASE WHEN O.o_tax = 'Z' THEN '영세율' ELSE '세금계산서' END as o_tax_str ");
		query.append(" ,CASE WHEN M.member_type = 'C' THEN C.cod_name ELSE CONCAT(member_last_name,member_name) END as member_name ");
		query.append(" ,CASE WHEN B.e_unit = 'U' THEN 'USD' ELSE 'KRW' END as e_unit_str ");
		query.append(" FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_req_buy B ON P.p_idx = B.project_idx ");
		query.append(" LEFT JOIN tbl_order O ON P.p_idx = O.project_idx ");
		query.append(" LEFT JOIN tbl_member M ON P.p_member_idx = M.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON M.member_idx = C.member_idx ");
		query.append(" LEFT JOIN tbl_tax T ON M.member_idx = T.member_idx ");
		query.append(" WHERE P.p_idx = ? ");
		Map<String,String> t_data = dbconn.getSqlToMap(conn, query, p_idx);
		pageContext.setAttribute("t_data", t_data);
		
		// 첨부파일
		String t_idx = t_data.get("t_idx");
		if(ut.checkValue(t_idx)){
			query = new StringBuffer("SELECT * FROM tbl_tax_file WHERE tax_idx = ?");
			pageContext.setAttribute("f_list", dbconn.getSql2ListMap(conn, query, t_idx));
		}
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
 %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<div class="sub_wrap">
	<aside id="lnb">
		<h2 class="tit"><span>정산관리</span></h2>
		<%@ include file="../inc/lnb.jsp"%>
	</aside>
	<div class="container clearfix">
		<div class="content">
			<a href="javascript:location.reload();" class="btn_refresh">새로고침</a>
			<div class="navi">
				<ul class="clearfix">
					<li>HOME</li>
					<li>정산관리</li>
					<li>세금계산서 발행관리</li>
					<li>상세</li>
				</ul>
			</div>
			<div class="list_tit over_warp">
				<h3>세금계산서 발행 관리</h3>
			</div>
			<div class="list">
				<table class="search">
					<caption>세금계산서</caption>
					<colgroup>
						<col style="width: 15%;">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">구분</th>
							<td>${t_data.o_tax_str}</td>
						</tr>
						<tr>
							<th scope="row">업체명</th>
							<td>${t_data.member_name}</td>
						</tr>
						<tr>
							<th scope="row">금액</th>
							<td><fmt:formatNumber value="${t_data.o_total_sup}" pattern="#,###" /> ${t_data.e_unit_str}</td>
						</tr>
						<tr>
							<th scope="row">부가세</th>
							<td><fmt:formatNumber value="${t_data.o_total_tax}" pattern="#,###" /> ${t_data.e_unit_str}</td>
						</tr>
						<tr>
							<th scope="row">Total</th>
							<td><fmt:formatNumber value="${t_data.o_total_gross}" pattern="#,###" /> ${t_data.e_unit_str}</td>
						</tr>
					</tbody>
				</table>
				<p class="tit">* 사업자 등록정보</p>
				<table class="search">
					<caption>사업자 등록정보</caption>
					<colgroup>
						<col style="width: 15%;">
						<col>
					</colgroup>
					<tbody>
						<c:choose>
							<c:when test="${empty t_data.t_idx}">
								<tr><td colspan="2">이 업체의 세금계산서 정보가 존재하지 않습니다.</td></tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th scope="row">상호</th>
									<td>${t_data.t_name}</td>
								</tr>
								<tr>
									<th scope="row">사업자 등록번호</th>
									<td>${t_data.t_num}</td>
								</tr>
								<tr>
									<th scope="row">성명</th>
									<td>${t_data.t_holder}</td>
								</tr>
								<tr>
									<th scope="row">사업장 소재지</th>
									<td>${t_data.t_address}</td>
								</tr>
								<tr>
									<th scope="row">업태</th>
									<td>${t_data.t_b_cdt}</td>
								</tr>
								<tr>
									<th scope="row">종목</th>
									<td>${t_data.t_type}</td>
								</tr>
								<tr>
									<th scope="row">Email</th>
									<td>${t_data.t_email}</td>
								</tr>
								<tr>
									<th scope="row">사업자 등록증</th>
									<td>
										<c:forEach var="f" items="${f_list}">
											<a href="../../shop.inc/jd_download.jsp?f_no=${f.f_idx}&t=tax">${f.orgfile}</a>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">발행여부</th>
									<td>
										<input type="checkbox" id="chk01" <c:if test="${t_data.o_tax_state eq 'Y'}">checked</c:if>>
										<label for="chk01">발행</label>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<form action="../action/publish_tax.jsp">
					<input type="hidden" value="${t_data.p_idx}" name="p_idx">
					<div class="btn_area align_r mt20">
						<c:if test="${t_data.o_tax_state eq 'N'}">
							<button class="btn">발행</button>
						</c:if>
						<button type="button" onclick="history.back()" class="btn">목록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>
