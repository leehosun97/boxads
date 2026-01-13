<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String member_idx = ut.escapeHtml(request, "idx");

	try{
		// 프로필
		StringBuffer query = new StringBuffer();
		query.append(" SELECT *, CASE WHEN p_gender = 'M' THEN '남' ELSE '여' END gender ");
		query.append(" FROM tbl_profile_p WHERE member_idx = ? ");
		Map<String, String> profile = dbconn.getSqlToMap(conn, query, member_idx);
		
		// 보유기술
		query = new StringBuffer(" SELECT * FROM tbl_tech_p WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String, String>> tech = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 학력
		query = new StringBuffer(" SELECT * FROM tbl_loe_p WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String, String>> loe = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 경력
		query = new StringBuffer(" SELECT * FROM tbl_career_p WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String, String>> career = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 언어
		query = new StringBuffer(" SELECT * FROM tbl_language_p WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String, String>> language = dbconn.getSql2ListMap(conn, query, member_idx);
		for(HashMap<String, String> map : language){
			map.put("p_level", ut.getLanguageLevel(map.get("p_level")));
		}
		
		// 포트폴리오
		query = new StringBuffer(" SELECT * FROM tbl_pf_file_p WHERE member_idx = ? ORDER BY pf_idx ");
		List<HashMap<String, String>> portfolio = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// CV파일
		query = new StringBuffer(" SELECT * FROM tbl_cv_file_p WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String, String>> cv = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 카테고리
		List<String> params = new ArrayList<>();
		StringBuffer category_query = new StringBuffer();
		category_query.append(" SELECT c_name FROM tbl_member_category A ");
		category_query.append(" LEFT JOIN tbl_category B ON A.category_idx = B.c_idx ");
		category_query.append(" WHERE A.member_idx = ? AND B.c_type = ? ");
		
		params.add(member_idx);
		params.add("C");
		List<HashMap<String, String>> c_list = dbconn.getSql2ListMap(conn, category_query, params);
		params.remove(1);
		params.add("B");
		List<HashMap<String, String>> f_list = dbconn.getSql2ListMap(conn, category_query, params);
		
		pageContext.setAttribute("profile", profile);
		pageContext.setAttribute("tech", tech);
		pageContext.setAttribute("loe", loe);
		pageContext.setAttribute("career", career);
		pageContext.setAttribute("language", language);
		pageContext.setAttribute("portfolio", portfolio);
		pageContext.setAttribute("cv", cv);
		pageContext.setAttribute("route",ut.getRoute(profile.get("p_route")));
		pageContext.setAttribute("c_list", c_list);
		pageContext.setAttribute("f_list", f_list);
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
			<div class="modal" id="layerpopup" style="width:700px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">프로필보기</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<ul class="list_tab pj2">
						<li class="on"><a href="#" onclick="return false;">자기소개</a></li>
						<li><a href="#" onclick="return false">보유기술*</a></li>
						<li><a href="#" onclick="return false">학력 &amp; 경력</a></li>
						<li><a href="#" onclick="return false">언어</a></li>
						<li><a href="#" onclick="return false">기타</a></li>
					</ul>
					<div class="write pop">
						<div class="tab_pop on">
							<table class="mt15 mb10">
								<caption>프로필 보기</caption>
								<colgroup>
									<col style="width:20%;">
									<col style="width:30%;">
									<col style="width:20%;">
									<col style="width:30%;">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">제목</th>
										<td colspan="3">${profile.p_title}</td>
									</tr>
									<tr>
										<th scope="row">카테고리</th>
										<td colspan="3">
											<c:forEach var="c" items="${c_list}" varStatus="vs">
												<c:if test="${!vs.first}">/ </c:if> 
												${c.c_name}
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row">분야</th>
										<td colspan="3">
											<c:forEach var="c" items="${f_list}" varStatus="vs">
												<c:if test="${!vs.first}">/ </c:if> 
												${c.c_name}
											</c:forEach>
										</td>
									</tr>
									<tr>
										<th scope="row">생년월일/성</th>
										<td>${profile.p_birth_y}.${profile.p_birth_m}.${profile.p_birth_d} / ${profile.gender}</td>
										<th scope="row">국적</th>
										<td>${profile.p_address1}</td>
									</tr>
									<tr>
										<th scope="row">지역</th>
										<td>${profile.p_address2}</td>
										<th scope="row">경력</th>
										<td>${profile.p_career}년</td>
									</tr>
									<tr>
										<th scope="row">주소</th>
										<td colspan="3">${profile.p_address3}</td>
									</tr>
									<tr>
										<th scope="row">휴대폰번호</th>
										<td colspan="3">${profile.p_tel}</td>
									</tr>
									<tr>
										<th scope="row">로고 및 <br>대표사진</th>
										<td colspan="3">
											<div class="thumbnail">
												<div class="img_area">
													<img src="${profile.filepath}${profile.savefile}" alt="thumbnail">
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="tab_pop">
							<c:forEach var="t" items="${tech}" varStatus="vs">
								<div class="pop_liat2" <c:if test="${!vs.last}">style="border-bottom: none;"</c:if>>
									<h5>${t.p_tech_name}</h5>
									<p>${t.p_desc}</p>
									<p>${t.p_lc_name } │ ${t.p_expert}</p>
									<a href="../../shop.inc/jd_download.jsp?f_no=${t.p_idx}&t=tech_p" class="flie_txt">${t.orgfile}</a>
								</div>
							</c:forEach>
						</div>
						<div class="tab_pop">
							<h4>학력</h4>
							<table class="mt15 mb10">
								<caption>학력 보기</caption>
								<colgroup>
									<col style="width:40%;">
									<col style="width:25%;">
									<col style="width:35%;">
								</colgroup>
								<thead>
									<tr>
										<th>학교명</th>
										<th>소재지</th>
										<th>재학기간</th>
									</tr>
								</thead>	
								<tbody>
									<c:choose>
										<c:when test="${empty loe}">
											<tr><td colspan="3">데이터가 없습니다.</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="l" items="${loe}">
												<tr>
													<td>${l.p_sc_name}</td>
													<td>${l.p_area}</td>
													<td>${l.p_start_date} ~ ${l.p_end_date}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<h4>경력</h4>
							<table class="mt15 mb10">
								<caption>경력 보기</caption>
								<colgroup>
									<col style="width:60%;">
									<col style="width:40%;">
								</colgroup>
								<thead>
									<tr>
										<th>회사명 </th>
										<th>근무기간</th>
									</tr>
								</thead>	
								<tbody>
									<c:choose>
										<c:when test="${empty career}">
											<tr><td colspan="2">데이터가 없습니다.</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="c" items="${career}">
												<tr>
													<td>${c.p_comp_name}</td>
													<td>${c.p_start_date} ~ ${c.p_end_date}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<div class="tab_pop">
							<table class="mt15 mb10">
								<caption>언어 보기</caption>
								<colgroup>
									<col style="width:60%;">
									<col style="width:40%;">
								</colgroup>
								<thead>
									<tr>
										<th>Language</th>
										<th>LEVEL</th>
									</tr>
								</thead>	
								<tbody>
									<c:choose>
										<c:when test="${empty language}">
											<tr><td colspan="2">데이터가 없습니다.</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="l" items="${language}">
											<tr>
												<td>
													<c:choose>
														<c:when test="${l.p_name eq '기타'}">${l.p_etc}</c:when>
														<c:otherwise>${l.p_name}</c:otherwise>
													</c:choose>
												</td>
												<td>${l.p_level}</td>
											</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<div class="tab_pop">
							<h4>포트폴리오</h4>
							<c:forEach var="pf" items="${portfolio}" varStatus="vs">
								<div class="pop_liat2" <c:if test="${!vs.last}">style="border-bottom: none;"</c:if>>
									<h5>${pf.p_title}</h5>
									<a href="../../shop.inc/jd_download.jsp?f_no=${pf.pf_idx}&t=p_pf" class="flie_txt">${pf.orgfile}</a>
								</div>
							</c:forEach>
							<h4>개인 CV</h4>
							<div class="pop_liat3">
								<p>
									<c:forEach var="c" items="${cv}" varStatus="vs">
										<a href="../../shop.inc/jd_download.jsp?f_no=${c.p_idx}&t=p_cv" class="flie_txt">${c.orgfile}</a>
										<c:if test="${!vs.last}"><br></c:if>
									</c:forEach>
								</p>
							</div>
							<h4>알게 된  경위</h4>
							<div class="pop_liat3">
								<p>${route}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>