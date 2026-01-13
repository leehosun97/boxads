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
		where.append(" WHERE Ph.h_date is not null AND Pm.p_total_price is not null ");
		
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
		
		// ====================== PARAM 세팅 End ======================
		
		// 프로젝트 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT COUNT(1) FROM tbl_payment Pm ");
		query.append(" LEFT JOIN tbl_project P ON Pm.project_idx = P.p_idx ");
		query.append(" LEFT JOIN tbl_project_history Ph ON P.p_idx = Ph.project_idx AND Ph.a_state = '11' ");
		query.append(" LEFT JOIN tbl_member M ON P.p_member_idx = M.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON M.member_idx = C.member_idx ");
		query.append(where);
		int list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"};
		pu = new PagingUtil(request, list_cnt, 5, 10, pageNo, disParam);
		
		// 프로젝트 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT P.p_idx ,P.p_code ,Ph.h_date ");
		query.append(" ,Pm.p_idx as pm_idx ,Pm.p_total_price ,Pm.p_commission ,Pm.p_calculate ");
		query.append(" ,CASE WHEN M.member_type = 'P' THEN CONCAT(M.member_last_name,M.member_name) ");
		query.append("   ELSE C.cod_name END as member_name ");
		query.append(" ,CASE WHEN Pm.p_unit = 'U' THEN 'USD' ELSE 'KRW' END as p_unit_str ");
		query.append(" FROM tbl_payment Pm ");
		query.append(" LEFT JOIN tbl_project P ON Pm.project_idx = P.p_idx ");
		query.append(" LEFT JOIN tbl_project_history Ph ON P.p_idx = Ph.project_idx AND Ph.a_state = '11' ");
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
						<li>매출현황</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>매출현황</h3>
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
								<th scope="row">키워드검색 </th>
								<td>
									<select name="key" class="w150">
										<option value="p_code" <c:if test="${param.key eq 'p_code'}">selected</c:if>>프로젝트  코드</option>
										<option value="m_name" <c:if test="${param.key eq 'm_name'}">selected</c:if>>발주처</option>
									</select>
									<input type="text" title="이름" name="val" value="${param.val}" style="width:150px">
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<th scope="row">기간조회</th> -->
<!-- 								<td> -->
<!-- 									<input type="text" title="시작일" placeholder="시작일" class="ico_date" id="datepicker1"> -->
<!-- 									<span class="hypen">~</span> -->
<!-- 									<input type="text" title="종료일" placeholder="종료일" class="ico_date" id="datepicker2"> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</table>
					<div class="btn_area align_r mt20">
						<button type="button" class="btn btn_down">엑셀다운로드</button>
						<button class="btn btn_search">검색</button>
					</div>
					</form>
					<div class="search_wrap">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:13%;">
								<col style="">
								<col style="width:17%;">
								<col style="width:17%;">
								<col style="width:17%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">날짜</th>
									<th scope="col">프로젝트  코드</th>
									<th scope="col">발주처</th>
									<th scope="col">전체금액</th>
									<th scope="col">수수료</th>
									<th scope="col">정산금액</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr><td colspan="6">데이터가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="p" items="${list}" varStatus="vs">
											<tr>
												<td>
													<fmt:formatDate value="${p.h_date}" pattern="yyyy-MM-dd"/>
												</td>
												<td><a href="../project/project_view.jsp?idx=${p.p_idx}">${p.p_code}</a></td>
												<td>${p.member_name}</td>
												<td><fmt:formatNumber value="${p.p_total_price}" pattern="#,###"/>${p.p_unit_str}</td>
												<td><fmt:formatNumber value="${p.p_commission}" pattern="#,###"/>${p.p_unit_str}</td>
												<td><fmt:formatNumber value="${p.p_calculate}" pattern="#,###"/>${p.p_unit_str}</td>
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
