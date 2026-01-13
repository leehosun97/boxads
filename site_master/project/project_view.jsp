<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%
	String pidx = ut.escapeHtml(request, "idx");
	MyDBConDao dbconn = new MyDBConDao();
	StringBuffer str = new StringBuffer();

	// 프로젝트 상세
	str.append(" where p.p_idx = ? ");
	str.append(" GROUP BY p.p_idx ");
	HashMap<String,String> hmap = sql.projectView(pidx, str);
	ArrayList<String> temp = new ArrayList<>();
	if(hmap.get("e_tech") != null){
		String et = hmap.get("e_tech");
		for (String s : et.split(",")) { temp.add(s); }		
		hmap.put("e_tech", temp.toString().replace("[", "").replace("]", ""));		
	}
	pageContext.setAttribute("pro", hmap);		
	str.setLength(0);
	
	// 수주처
	str.append(" SELECT IFNULL(C.cod_name,CONCAT(M.member_last_name, M.member_name)) AS a_member_name, M.member_idx ");
	str.append(" FROM tbl_project P ");
	str.append(" LEFT JOIN tbl_estimate_app A ON P.p_idx = A.project_idx AND A.e_state = '4' ");
	str.append(" LEFT JOIN tbl_member M ON A.member_idx = M.member_idx ");
	str.append(" LEFT JOIN tbl_cod C ON A.member_idx = C.member_idx ");
	str.append(" WHERE P.p_state != '0' AND A.project_idx = ? ");
	hmap = dbconn.getSqlToMap(str, pidx);
	pageContext.setAttribute("mem", hmap);		
	str.setLength(0);
	
	// 계약 검토
	str.append(" SELECT B.e_idx ,B.project_idx ,B.member_idx ,B.e_th ,B.e_type ,R.e_wk_type ,B.e_state ");
	str.append(" ,IFNULL(C.cod_name,CONCAT(M.member_last_name, M.member_name)) as name ");
	str.append(" ,IFNULL(B.e_total_gross,B.e_submit_pay) as price ");
	str.append(" ,CASE WHEN B.e_th = 1 AND B.e_state = 0 THEN '견적대기' WHEN B.e_state != 0 THEN CONCAT(B.e_th,'차 견적') ");
	str.append("   WHEN B.e_th > 1 AND B.e_state = 0 THEN CONCAT(B.e_th-1,'차 견적') ELSE '' END as e_state_str ");
	str.append(" ,R2.e_period_date ,B.e_insert_date ");
	str.append(" ,CASE WHEN R.e_wk_type = 'H' THEN '지원' ELSE '견적' END as wk_type ");
	str.append(" ,(SELECT COUNT(1) FROM tbl_notice N WHERE B.member_idx = N.s_member_idx AND P.p_member_idx = N.r_member_idx ");
	str.append("   AND B.project_idx = N.project_idx AND N.n_type = 'app_project' AND n_view = 'N') as n_cnt ");
	str.append(" FROM (SELECT project_idx, MAX(e_th) as e_th, member_idx FROM tbl_estimate_app ");
	str.append("   WHERE (e_state = 0 && e_th = 1) || e_state !=0 GROUP BY project_idx, member_idx) A ");
	str.append(" LEFT JOIN tbl_estimate_app B ON A.project_idx = B.project_idx AND A.e_th = B.e_th AND A.member_idx = B.member_idx ");
	str.append(" LEFT JOIN tbl_cod C ON A.member_idx = C.member_idx ");
	str.append(" LEFT JOIN tbl_member M ON A.member_idx = M.member_idx ");
	str.append(" LEFT JOIN tbl_estimate_req_ex R ON R.project_idx = B.project_idx ");
	str.append(" LEFT JOIN tbl_estimate_req_buy R2 ON B.project_idx = R2.project_idx ");
	str.append(" LEFT JOIN tbl_project P ON B.project_idx = P.p_idx ");
	str.append(" WHERE B.project_idx = ? AND P.p_state = 1");
	str.append(" ORDER BY B.e_update_date ");
	List<HashMap<String,Object>> list = dbconn.getSqlListMapObj(str, pidx);
	str.setLength(0);

	// 히스토리 내역 - 진행
	str.append(" SELECT h_idx, p.p_idx, b_state, a_state, h_desc, DATE_FORMAT(h_date,'%Y.%m.%d') AS h_date, p_field, o_idx, ob_idx ");
	str.append(" FROM tbl_project_history h ");
	str.append(" LEFT JOIN tbl_project p ON (p.p_idx = h.project_idx) ");
	str.append(" LEFT JOIN tbl_order od ON (p.p_idx = od.project_idx) ");
	str.append(" LEFT JOIN tbl_obtain ob ON (p.p_idx = ob.project_idx) ");  
	str.append(" where h.project_idx = ? AND a_state < 5 ");
	str.append(" order by h_idx asc ");
	List<HashMap<String,Object>> hList = dbconn.getSqlListMapObj(str, pidx);
	pageContext.setAttribute("hList", hList);
	str.setLength(0);
	
	// 히스토리 내역 - 완료
	str.append(" SELECT h_idx, p.p_idx, b_state, a_state, h_desc, DATE_FORMAT(h_date,'%Y.%m.%d') AS h_date, p_field, o_idx, ob_idx ");
	str.append(" FROM tbl_project_history h ");
	str.append(" LEFT JOIN tbl_project p ON (p.p_idx = h.project_idx) ");
	str.append(" LEFT JOIN tbl_order od ON (p.p_idx = od.project_idx) ");
	str.append(" LEFT JOIN tbl_obtain ob ON (p.p_idx = ob.project_idx) ");  
	str.append(" where h.project_idx = ?  AND a_state >= 5 ");
	str.append(" order by h_idx asc ");
	hList = dbconn.getSqlListMapObj(str, pidx);
	pageContext.setAttribute("hList2", hList);
	str.setLength(0);
	
	// 업무 지시서	
	str.append(" SELECT * FROM tbl_work WHERE project_idx = ? AND (d_state != 0 OR r_state != 0) ORDER BY w_idx DESC ");	
	hList = dbconn.getSqlListMapObj(str, pidx);
	pageContext.setAttribute("wList", hList);
	str.setLength(0);
	
	// 문서 정보
	str.append(" select p.p_field, od.o_idx, od.o_type, o_state, ob.ob_idx, ob_type, ob_state, GROUP_CONCAT(e.e_idx SEPARATOR ',') AS e_idx,  e.member_idx, p.p_idx ");
	str.append(" , re.r_idx, re.r_state, pm.p_idx as pm_idx, pm.p_state, GROUP_CONCAT(w.w_idx SEPARATOR ',') AS w_idx ");
	str.append(" from tbl_project p left join tbl_order od on (p.p_idx = od.project_idx) left join tbl_obtain ob on (p.p_idx = ob.project_idx) ");
	str.append(" left join tbl_estimate_app e on (p.p_idx = e.project_idx) LEFT JOIN tbl_release re ON (p.p_idx = re.project_idx) LEFT JOIN tbl_work w ON (p.p_idx = w.project_idx) ");
	str.append(" LEFT JOIN tbl_payment pm ON (p.p_idx = pm.project_idx) ");
	str.append(" where p.p_idx = "+pidx+" and e_state != 0 ");	
	hmap = dbconn.getSqlToMap(str);
	
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("doc", hmap);
%>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>프로젝트</span></h2>
			<%@ include file="../inc/lnb.jsp" %>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>프로젝트</li>
						<li>상세/수정(공통)</li>
					</ul>
				</div>
				<div class="list_tit">
					<h3>프로젝트</h3>
				</div>
				<div class="list ">
					<div class="over_warp">
						<div class="tit_box001">
							<span class="code">${pro.p_code}</span>
							<h3>${pro.p_title}</h3>
							<p>
							발주처: 
							<c:choose>
								<c:when test="${pro.member_type eq 'C'}">
									<a href="../member/enterprise_view.jsp?member_idx=${pro.member_idx}">${pro.mem_name}</a>
								</c:when>
								<c:otherwise>
									<a href="../member/individual_view.jsp?member_idx=${pro.member_idx}">${pro.mem_name}</a>
								</c:otherwise>
							</c:choose>						
							 
							<c:if test="${!empty mem.a_member_name}">
							전문가: 
							<c:choose>
								<c:when test="${pro.member_type eq 'C'}">
									<a href="../member/enterprise_view.jsp?member_idx=${mem.member_idx}">${mem.a_member_name}</a>
								</c:when>
								<c:otherwise>
									<a href="../member/individual_view.jsp?member_idx=${mem.member_idx}">${mem.a_member_name}</a>
								</c:otherwise>
							</c:choose>							
							</c:if></p>
							<p>${pro.p_ws_area_1} │ ${pro.c_name} │ ${pro.b_name} <c:if test="${!empty pro.e_tech}">│ ${pro.e_tech}</c:if></p>
						</div>	
						<div class="search_wrap no_wrap">
							<p class="tit">계약검토(의뢰중+지원)</p>
							<table class="search_list">
								<caption>계약검토</caption>
								<colgroup>
									<col>
									<col style="width:17%;">
									<col style="width:15%;">
									<col style="width:15%">
									<col style="width:15%;">
									<col style="width:15%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">업체(전문가 ) 명</th>
										<th scope="col">견적금액</th>
										<th scope="col">예상납기일자</th>
										<th scope="col">견적일자</th>
										<th scope="col">상태</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty list}">
										<tr><td colspan="6">견적 중인 업체(전문가)가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="e" items="${list}" varStatus="vs">
											<c:choose>
												<c:when test="${e.e_state eq '0' && e.e_th eq '1'}">
													<tr>														
														<td class="table_tit02">${e.name}</td>
														<td>-</td>
														<td>-</td>
														<td>-</td>
														<td>견적대기</td>
														<td>
															<a class="c_blue" href="../../chatting/view.jsp?r=${e.member_idx}" target="_blank">메시지</a>
															
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>														
														<td class="table_tit02">${e.name}</td>
														<td><fmt:formatNumber value="${e.price}" pattern="#,###"/></td>
														<td>
															<c:choose>
																<c:when test="${empty e.e_period_date}">-</c:when>
																<c:otherwise>
																	<fmt:parseDate value="${e.e_period_date}" var="indate" pattern="yyyy-MM-dd"/>
																	<fmt:formatDate value="${indate}" pattern="yyyy.MM.dd"/>
																</c:otherwise>
															</c:choose>
														</td>
														<td>
															<fmt:parseDate value="${e.e_insert_date}" var="indate" pattern="yyyy-MM-dd"/>
															<fmt:formatDate value="${indate}" pattern="yyyy.MM.dd"/>
														</td>
														<td>${e.e_state_str}</td>
														<td>
															<a class="c_blue" href="../../chatting/view.jsp?r=${e.member_idx}" target="_blank">메시지</a>
															<a class="c_blue" href="../popup/message_md.jsp?midx=${e.member_idx}&pidx=${pro.p_idx}" onclick="return popup_layer(this);">견적내역</a>
														</td>
													</tr>													
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="tit">계약진행(발주서+수주)</p>
							<table class="search_list">
								<caption>계약진행</caption>
								<colgroup>
									<col style="width:25%;">
									<col>
									<col style="width:30%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">발행일</th>
										<th scope="col">상태</th>
										<th scope="col">업무문서보기</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty hList}">
										<tr><td colspan="3">진행 중인 업체(전문가)가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="h" items="${hList}" varStatus="i">											
											<tr>
												<td>${h.h_date}</td>
												<td>${h.h_desc}</td>
												<td>
												<c:choose>
													<c:when test="${h.a_state <= 2}">-</c:when>
													<c:otherwise>
														<c:if test="${h.a_state eq 3}">
															<c:choose>
										                    	<c:when test="${h.p_field eq 'B'}">										                    
												                    <a href="../../order/pop_order_buy.jsp?cd=${h.o_idx}" target="_blank" class="c_blue">발주서</a>											                                        	
										                    	</c:when>
										                    	<c:otherwise>									                    	
												                    <a href="../../order/pop_order_ex.jsp?cd=${doc.o_idx}" target="_blank" class="c_blue">근로계약서</a>											                                        	
										                    	</c:otherwise>                    
										                    </c:choose> 													
														</c:if>
														<c:if test="${h.a_state eq 4}">
															<c:choose>
										                    	<c:when test="${h.p_field eq 'B'}">
										                    		<a href="../../order/pop_order_buy.jsp?cd=${h.o_idx}" target="_blank" class="c_blue">발주서</a>										                    
												                    <a href="../../obtain/pop_obtain_buy.jsp?p_idx=${h.p_idx}" target="_blank" class="c_blue">수주확인서</a>											                                        	
										                    	</c:when>
										                    	<c:otherwise>									                    	
										                    		<a href="../../order/pop_order_ex.jsp?cd=${h.o_idx}" target="_blank" class="c_blue">근로계약서</a>
												                    <a href="../../obtain/pop_obtain_ex.jsp?p_idx=${h.p_idx}" target="_blank" class="c_blue">수주확인서</a>											                                        	
										                    	</c:otherwise>                    
										                    </c:choose>													
														</c:if>
													</c:otherwise>
												</c:choose></td></tr>											
										</c:forEach>									
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<p class="tit">업무진행</p>
							<table class="search_list">
								<caption>업무진행</caption>
								<colgroup>
									<!-- <col class="col03_4_2"> -->
									<col class="col03_3">
									<col class="col03_6_1">
									<col class="col03_6_2">
									<col class="col03_6_3">
									<col class="col03_6_4">
									<col class="col03_6_5">
								</colgroup>
								<thead>
									<tr>
										<!-- <th scope="col">번호</th> -->
										<th scope="col">업무지시서</th>
										<th scope="col">등록일</th>
										<th scope="col">상태</th>
										<th scope="col">업무보고서</th>
										<th scope="col">등록일</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty wList}">
											<tr><td colspan="6">등록된 업무지시서가 없습니다.</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="w" items="${wList}" varStatus="vs">
												<tr>													
													<td class="table_tit">
														<c:choose>
															<c:when test="${empty w.d_code}">-</c:when>															
															<c:otherwise>
																<div class="inner">
																	<a href="../../order/pop_busi.jsp?idx=${w.w_idx}" target="_blank" class="line">${w.d_code}</a>
																</div>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${empty w.d_insert_date}">-</c:when>
															<c:otherwise>
																<fmt:parseDate value="${w.d_insert_date}" var="indate" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${w.d_state eq '0'}">작성중</c:when>
															<c:when test="${w.d_state eq '1'}">발송</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${empty w.r_code || w.d_state eq '0'}">-</c:when>
															<c:otherwise>
																<a href="../../obtain/pop_obtain_busi.jsp?idx=${w.w_idx}" target="_blank" class="btn line">${w.r_code}</a>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>
															<c:when test="${empty w.r_insert_date}">-</c:when>
															<c:otherwise>
																<fmt:parseDate value="${w.r_insert_date}" var="indate" pattern="yyyy-MM-dd"/>
																<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<c:choose>															
															<c:when test="${w.r_state eq '1'}">발송</c:when>
															<c:when test="${w.d_state eq '1'}">수신</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<p class="tit">완료/결제대기</p>
							<table class="search_list">
								<caption>완료/결제대기</caption>
								<colgroup>
									<col style="width:25%;">
									<col>
									<col style="width:30%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">발행일</th>
										<th scope="col">상태</th>
										<th scope="col">문서보기</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${empty hList2}">
										<tr><td colspan="3">해당하는 업체(전문가)가 없습니다.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="h" items="${hList2}" varStatus="i">
											<%-- <c:if test="${h.a_state >= 5}"> --%>
											<tr>
												<td>${h.h_date}</td>
												<td>${h.h_desc}</td>
												<td>
												<c:choose>							
													<c:when test="${h.a_state eq 7 && h.p_field eq 'B'}">
														<a href="../../obtain/pop_release.jsp?idx=${doc.r_idx}" target="_blank" class="c_blue">출고알림장</a>
													</c:when>
													<c:when test="${h.a_state eq 10}">
														<c:choose>
															<c:when test="${h.p_field eq 'B' }">
																<a href="../../obtain/pop_bill.jsp?idx=${doc.pm_idx}" target="_blank" class="c_blue">대금청구서</a>															
															</c:when>
															<c:otherwise>
																<a href="../../obtain/pop_bill_ex.jsp?idx=${doc.pm_idx}" target="_blank" class="c_blue">대금청구서</a>
															</c:otherwise>
														</c:choose>
													</c:when>
													<c:otherwise>-</c:otherwise>
												</c:choose></td></tr>
											<%-- </c:if> --%>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
							<c:if test="${pro.p_state ne 12}">
							<p class="tit">취소/환불</p>
						<form method="post" id="fmt" action="../../action/update_project_idx.jsp">
							<input type="hidden" name="p_idx" value="${pro.p_idx}">
							<input type="hidden" name="p_state" value="${pro.p_state}">
							<input type="hidden" name="desc" value="confirm">							
							<input type="hidden" name="rtUrl" value="../admin/project/project_view.jsp?idx=${pro.p_idx}">
						</form>
							<table class="search">
								<caption>완료/결제대기</caption>
								<colgroup>
									<col style="width:20%;">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">취소/환불</th>
										<td>
											<span><input type="radio" id="setting_01" name="setting" value="C"><label for="setting_01">취소</label></span>
											<span><input type="radio" id="setting_02" name="setting" value="R"><label for="setting_02">환불</label></span>
										</td>
									</tr>
									<tr>
										<th scope="row">사유입력</th>
										<td>
											<input type="text" title="사유" style="width:200px" name="reason"><label for="setting_01" class="blind"></label>
											<button class="month on" onclick="confirmCancel()">확인</button>
										</td>
									</tr>
								</tbody>
							</table>
							</c:if>
						<c:if test="${!empty pro.p_admin_desc}">
							<div class="result_t">
									<c:choose>
										<c:when test="${pro.p_cancel_btn eq 'C'}">
											<p>[취소] ${pro.p_admin_desc}</p>
										</c:when>
										<c:otherwise>
											<p>[환불] ${pro.p_admin_desc}</p>
										</c:otherwise>
									</c:choose>
							</div>
						</c:if>								
							<div class="table_btn text_r">
								<a href="project_list.jsp" class="btn">목록</a>
								<c:if test="${pro.p_state eq '1' && pro.p_show eq 'S'}">
									<c:choose>
										<c:when test="${pro.p_recommand eq 'Y'}">
											<button type="button" class="btn c_list" onclick="recommand_project('${pro.p_idx}','N')">추천 프로젝트 제외</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn c_list" onclick="recommand_project('${pro.p_idx}','Y')">추천 프로젝트 추가</button>
										</c:otherwise>
									</c:choose>
								</c:if>
							</div>
						</div>
					</div>
					<div class="over_r search_wrap no_wrap">
						<!-- <p class="tit">세금계산서</p> -->
						<table class="search">
							<caption>계약</caption>
							<colgroup>
								<col style="width:130px;">
								<col>
							</colgroup>							
							<tr>
								<th scope="row">희망금액</th>
									<td>
									<fmt:formatNumber value="${pro.p_ws_sum}" pattern="#,###"/>                                        
	                                <c:choose>
	                                	<c:when test="${pro.p_ws_sum_type eq 'U'}">
	                                	USD
	                                	</c:when>
	                                	<c:otherwise>
	                                	KRW
	                                	</c:otherwise>
	                                </c:choose>
	                                </td>
							</tr>
							<c:if test="${!empty pro.p_plan_date}">
                                <tr>
                                    <th>예상기간</th>
                                    <td>${pro.p_plan_date}</td>
                                </tr>
                            </c:if>
							<tr>
								<th scope="row">소개</th>
								<td>${pro.p_info}</td>
							</tr>
							<c:if test="${!empty pro.p_tech}">
                                <tr>
                                    <th>관련기술</th>
                                    <td>
                                       ${pro.p_tech}
                                    </td>
                                </tr>
                            </c:if>
							<tr>
                                <th>선호 파트너 유형</th>
                                <td>
                                    <c:choose>
                                    	<c:when test="${pro.p_partner eq 'C'}">법인</c:when>
                                    	<c:when test="${pro.p_partner eq 'P'}">개인</c:when>
                                    	<c:when test="${pro.p_partner eq 'T'}">팀</c:when>
                                    	<c:otherwise>상관없음</c:otherwise>                                        
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <th>사전미팅 여부</th>
                                <td>
                                 <c:choose>
                                 	<c:when test="${pro.p_meet eq 'Y'}">필요</c:when>
                                 	<c:otherwise>필요없음</c:otherwise>
                                 </c:choose>
                                </td>
                            </tr>
                            <c:if test="${!empty pro.p_ws_area}">
                            <tr>
                                <th>희망지역</th>
                                <td>
                                   ${pro.p_ws_area}
                                </td>
                            </tr>
                            </c:if>
							<tr>
								<th scope="row">의뢰목적</th>
								<c:choose>
									<c:when test="${pro.p_purpose eq 'R'}">
										<td>실제 프로젝트 진행용</td>		
									</c:when>
									<c:otherwise>
										<td>예산 작성용</td>									
									</c:otherwise>
								</c:choose>
							</tr>
						</table>
						<p class="tit">수수료 율</p>
						<div class="tit_box002">
							<input type="text" id="pj_cms" title="퍼센트" style="width:200px" value="${pro.p_commission}"><label for="text_112">%</label>
							<button type="button" onclick="set_cms('${pro.p_idx}')" class="btn">설정</button>
						</div>
						<p class="tit">계약관련문서</p>
						<div class="tit_box001">
							<c:if test="${!empty doc && !empty doc.e_idx}">
			                    <c:choose>
			                    	<c:when test="${doc.p_field eq 'B'}">
					                    <c:if test="${!empty doc.e_idx}">
					                    	<c:forEach var="d" items="${doc.e_idx.split(',')}" varStatus="status">
					                    		<span><a href="../../project/pop_app_buy.jsp?idx=${d}" target="_blank" class="btn line">${status.count}차견적서</a></span>
					                    	</c:forEach>
					                    </c:if>
					                    <c:if test="${!empty doc.o_idx && doc.o_state eq '1'}"><span><a href="../../order/pop_order_buy.jsp?cd=${doc.o_idx}" target="_blank" class="btn line">발주서</a></span></c:if>
					                    <c:if test="${!empty doc.ob_idx && doc.ob_state eq '1'}"><span><a href="../../obtain/pop_obtain_buy.jsp?p_idx=${doc.p_idx}" target="_blank" class="btn line">수주확인서</a></span></c:if>
					                    <c:if test="${!empty doc.r_idx && doc.r_state eq '1'}"><span><a href="../../obtain/pop_release.jsp?idx=${doc.r_idx}" target="_blank" class="btn line">출고알림장</a></span></c:if>
					                    <c:if test="${!empty doc.pm_idx && doc.p_state eq '1'}"><span><a href="../../obtain/pop_bill.jsp?idx=${doc.pm_idx}" target="_blank" class="btn line">대금청구서</a></span></c:if>                  	
			                    	</c:when>
			                    	<c:otherwise>
				                    	<c:if test="${!empty doc.e_idx}">
					                    	<c:forEach var="d" items="${doc.e_idx.split(',')}" varStatus="status">
					                    		<span><a href="../../project/pop_app_ex.jsp?idx=${d}" target="_blank" class="btn line">${status.count}차견적서</a></span>
					                    	</c:forEach>
					                    </c:if>
					                    <c:if test="${!empty doc.o_idx &&  doc.o_state eq '1'}"><span><a href="../../order/pop_order_ex.jsp?cd=${doc.o_idx}" target="_blank" class="btn line">근로계약서</a></span></c:if>
					                    <c:if test="${!empty doc.ob_idx && doc.ob_state eq '1'}"><span><a href="../../obtain/pop_obtain_ex.jsp?p_idx=${doc.p_idx}" target="_blank" class="btn line">수주확인서</a></span></c:if>
					                    <c:if test="${!empty doc.pm_idx && doc.p_state eq '1'}"><span><a href="../../obtain/pop_bill_ex.jsp?idx=${doc.pm_idx}" target="_blank" class="btn line">대금청구서</a></span></c:if>                    	
			                    	</c:otherwise>                    
			                    </c:choose>   					
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	//추천프로젝트 등록/삭제
	function recommand_project(idx,value){
		var confirm_msg = '추천 프로젝트에서 제외 하시겠습니까?';

		if(value == 'Y') confirm_msg = '추천 프로젝트에 추가 하시겠습니까?';
		
		if(confirm(confirm_msg)){
			$.ajax({
				url:'../ajax/recommand_project.jsp',
				data: {p_idx: idx, value: value},
				success: function(data){
					if(data.trim()=='true'){
						alert('저장 되었습니다.');
						location.reload();
					}else{
						alert('오류가 발생했습니다.');
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	}
	// 취소처리
	function confirmCancel(){
		var txt = $('input[name=reason]').val(); 
		var radio = $('input[name=setting]:checked');
		if(radio.length==0){ alert("선택된 상태가 없습니다."); return false; }
		if(txt == ""){ alert("사유를 입력해 주십시오."); return false; }
		if(confirm("취소 처리 하시겠습니까?")){		
			$(".result_t").append('<p>['+radio.val()+'] '+txt+'</p>');		
			$("form").append('<input type="hidden" name="setting" value="'+radio.val()+'">');
			$("form").append('<input type="hidden" name="reason" value="'+txt+'">');
			$("form").submit();
		}
	}
	
	// 수수료율 설정
	function set_cms(idx){
		$.ajax({
			url: '../ajax/set_cms.jsp',
			data: {idx: idx, cms: $('#pj_cms').val()},
			success: function(data){
				if(data.trim()=='success') alert('설정되었습니다.');
				else alert('오류가 발생했습니다.');
			}
		});
	}
</script>
</body>
</html>
