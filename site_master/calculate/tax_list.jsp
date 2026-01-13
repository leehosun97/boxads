<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="factomars.PagingUtil"%>
<%
	PagingUtil pu = null;
	
	int pageNo = ut.escapeInt(request, "page", 1);
	
	try{
		//====================== PARAM 세팅 Start ======================
		List<String> params = new LinkedList<>();
		StringBuffer where = new StringBuffer();
		where.append(" WHERE P.p_state IN ('11','12') AND O.o_tax IN ('T','Z') ");
		
		// 키워드 검색
		String key = ut.escapeHtml(request, "key");
		String val = ut.escapeHtml(request, "val");
		if(ut.checkValue(key) && ut.checkValue(val)){
			if(key.equals("p_code")){
				where.append(" AND P.p_code LIKE CONCAT('%',?,'%') ");
			}else if(key.equals("m_name")){
				where.append(" AND CASE WHEN M.member_type = 'P' THEN CONCAT(M.member_last_name,M.member_name) ELSE C.cod_name END ");
				where.append(" LIKE CONCAT('%',?,'%') ");
			}
			params.add(val);
		}
		// 진행상태
		String o_tax_state = ut.escapeHtml(request, "o_tax_state");
		if(ut.checkValue(o_tax_state)){
			where.append(" AND O.o_tax_state = ? ");
			params.add(o_tax_state);
		}
		// 기간조회
		String start_date = ut.escapeHtml(request, "start_date");
		if(ut.checkValue(start_date)){
			where.append(" AND DATE_FORMAT(Ph.h_date,'%Y-%m-%d') >= ? ");
			params.add(start_date);
		}
		String end_date = ut.escapeHtml(request, "end_date");
		if(ut.checkValue(end_date)){
			where.append(" AND DATE_FORMAT(Ph.h_date,'%Y-%m-%d') <= ? ");
			params.add(end_date);
		}
		
		// ====================== PARAM 세팅 End ======================
		
		// 프로젝트 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT COUNT(1) FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_order O ON P.p_idx = O.project_idx ");
		query.append(" LEFT JOIN tbl_project_history Ph ON P.p_idx = Ph.project_idx AND Ph.a_state = '11' ");
		query.append(" LEFT JOIN tbl_estimate_req_buy B ON P.p_idx = B.project_idx ");
		query.append(" LEFT JOIN tbl_member M ON P.p_member_idx = M.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON M.member_idx = C.member_idx ");
		query.append(where);
		int list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"};
		pu = new PagingUtil(request, list_cnt, 5, 10, pageNo, disParam);
		
		// 프로젝트 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT P.p_idx ,Ph.h_date ,O.o_total_sup ,O.o_total_tax ,O.o_total_gross ");
		query.append(" ,CASE WHEN O.o_tax = 'Z' THEN '영세율' ELSE '세금계산서' END as o_tax_str ");
		query.append(" ,CASE WHEN O.o_tax_state = 'Y' THEN '발행' ELSE '미발행' END as o_tax_state_str ");
		query.append(" ,CASE WHEN B.e_unit = 'U' THEN 'USD' ELSE 'KRW' END as e_unit_str ");
		query.append(" ,CASE WHEN M.member_type = 'C' THEN C.cod_name ELSE CONCAT(member_last_name,member_name) END as member_name ");
		query.append(" FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_order O ON P.p_idx = O.project_idx ");
		query.append(" LEFT JOIN tbl_project_history Ph ON P.p_idx = Ph.project_idx AND Ph.a_state = '11' ");
		query.append(" LEFT JOIN tbl_estimate_req_buy B ON P.p_idx = B.project_idx ");
		query.append(" LEFT JOIN tbl_member M ON P.p_member_idx = M.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON M.member_idx = C.member_idx ");
		query.append(where);
		query.append(" ORDER BY Ph.h_date DESC ");
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		List<Map<String, Object>> list = dbconn.getSql2ListObjectMap(conn, query, params);
		
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("list", list);
		
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
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>정산관리</li>
						<li>세금계산서 발행관리</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>세금계산서발행 관리</h3>
				</div>
				<div class="list">
					<form action="?">
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">진행상태</th>
								<td>       
									<span>
										<input type="radio" id="setting_01" name="o_tax_state" value="" checked>
										<label for="setting_01">전체</label>
									</span>
									<span>
										<input type="radio" id="setting_02" name="o_tax_state" value="Y" <c:if test="${param.o_tax_state eq 'Y'}">checked</c:if>>
										<label for="setting_02">발행</label>
									</span>
									<span>
										<input type="radio" id="setting_03" name="o_tax_state" value="N" <c:if test="${param.o_tax_state eq 'N'}">checked</c:if>>
										<label for="setting_03">미발행</label>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">키워드검색 </th>
								<td>
									<select name="key" class="w150">
										<option value="p_code">프로젝트 코드</option>
										<option value="m_name">업체명</option>
									</select>
									<input type="text" name="val" value="${param.val}" title="이름" style="width:150px">
								</td>
							</tr>
							<tr>
								<th scope="row">기간조회</th>
								<td>
									<input type="text" name="start_date" value="${param.start_date}" title="시작일" placeholder="시작일" class="ico_date" id="datepicker1">
									<span class="hypen">~</span>
									<input type="text" name="end_date" value="${param.end_date}" title="종료일" placeholder="종료일" class="ico_date" id="datepicker2">
								</td>
							</tr>
						</table>
						<div class="btn_area align_r mt20">
							<button class="btn btn_search">검색</button>
						</div>
					</form>
					<div class="search_wrap">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:13%;">
								<col style="">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:13%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th scope="col">업체명</th>
									<th scope="col">구분</th>
									<th scope="col">요청일자</th>
									<th scope="col">금액</th>
									<th scope="col">부가세</th>
									<th scope="col">Total</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr><td colspan="8">데이터가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${list}">
											<tr>
												<td>
													<input type="checkbox">
												</td>
												<td><a href="tax_view.jsp?idx=${p.p_idx}">${p.member_name}</a></td>
												<td><a href="tax_view.jsp?idx=${p.p_idx}">${p.o_tax_str}</a></td>
												<td><fmt:formatDate value="${p.h_date}" pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatNumber value="${p.o_total_sup}" pattern="#,###"/> ${p.e_unit_str}</td>
												<td><fmt:formatNumber value="${p.o_total_tax}" pattern="#,###"/> ${p.e_unit_str}</td>
												<td><fmt:formatNumber value="${p.o_total_gross}" pattern="#,###"/> ${p.e_unit_str}</td>
												<td>${p.o_tax_state_str}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
						<div class="pagination mt0">
							<%= pu.showPage() %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
