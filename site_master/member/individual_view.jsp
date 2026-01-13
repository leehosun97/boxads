<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<%
	String member_idx = ut.escapeHtml(request, "member_idx");
	
	try{
		StringBuffer query = new StringBuffer();
		
		// 회원정보 조회
		query.append(" SELECT member_idx ,CONCAT(member_last_name, member_name) as member_name ,member_registdate ,member_use ");
		query.append(" ,member_recommand ,member_recommand_date ");
		query.append(" ,cast(aes_decrypt(unhex(member_email),'" + dbconn.getHashKey() + "')as char(100)) as member_email ");
		query.append(" ,CASE WHEN member_path='G' THEN '구글' WHEN member_path='F' THEN '페이스북' ELSE '이메일' END as member_path ");
		query.append(" FROM tbl_member ");
		query.append(" WHERE member_idx = ? ");
		Map<String, String> info_p = dbconn.getSqlToMap(conn, query, member_idx);
		
		if(info_p.isEmpty()){
			out.print(ut.rejectAccess());
			return;
		}
		
		// 마스터프로젝트 조회
		query = new StringBuffer();
		query.append(" SELECT * FROM tbl_master_project WHERE member_idx = ? ORDER BY m_idx ");
		List<HashMap<String, String>> m_project = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 협력사 조회
		query = new StringBuffer();
		query.append(" SELECT * FROM tbl_partner WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String,String>> partner = dbconn.getSql2ListMap(conn, query, member_idx);
		
		pageContext.setAttribute("info_p", info_p);
		pageContext.setAttribute("m_project", m_project);
		pageContext.setAttribute("partner", partner);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
<form name="frm" action="../action/update_member.jsp" method="post">
	<input type="hidden" name="member_type" value="P">
	<input type="hidden" name="member_idx" value="<%=member_idx%>">
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>회원<span></h2>
			<ul class="menu">
				<li class="btn_sub"><a href="enterprise_list.jsp">기업</a></li>
				<li class="on">
					<a href="individual_list.jsp">개인</a>
				</li>
				<li><a href="secession_list.jsp">탈퇴회원</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>회원</li>
						<li>기업</li>
						<li>상세/수정</li>
					</ul>
				</div>
				<div class="list_tit">
					<h3>개인</h3>
				</div>
				<div class="list ">
					<div class="over_warp">
						<p class="tit">개인</p>
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:170px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">이메일</th>
								<td>${ info_p.member_email }</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>${ info_p.member_name }</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td><input id="pw_txt01" name="member_password" type="password" title="패스워드" style="width:300px"><label for="pw_txt01"></label></td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>
									<fmt:parseDate value="${info_p.member_registdate }" var="indate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
								<th scope="row">가입경로</th>
								<td>이메일</td>
							</tr>
							<tr>
								<th scope="row">이용상태</th>
								<td>
									<span>
										<input type="radio" id="setting_01" name="member_use" value="Y"
											<c:if test="${ info_p.member_use eq 'Y' }">checked</c:if>>
										<label for="setting_01">정상 </label>
									</span>
									<span>
										<input type="radio" id="setting_02" name="member_use" value="P"
											<c:if test="${ info_p.member_use eq 'P' }">checked</c:if>>
										<label for="setting_02">정지</label>
									</span>
									<span>
										<input type="radio" id="setting_03" name="member_use" value="D"
											<c:if test="${ info_p.member_use eq 'D' }">checked</c:if>>
										<label for="setting_03">탈퇴</label>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">추천전문가 여부</th>
								<td>
									<span>
										<input type="radio" id="recom_01" name="member_recommand" value="Y"
											<c:if test="${ info_p.member_recommand eq 'Y' }">checked</c:if>>
										<label for="recom_01">Y</label>
									</span>
									<span>
										<input type="radio" id="recom_02" name="member_recommand" value="N"
											<c:if test="${ info_p.member_recommand eq 'N' }">checked</c:if>>
										<label for="recom_02">N</label>
									</span>
								</td>
							</tr>
						</table>
						<div class="search_wrap no_wrap">
							<p class="tit">마스터프로젝트</p>
							<table class="search_list">
								<caption>검색결과</caption>
								<colgroup>
									<col style="width:10%;">
									<col style="width:12%;">
									<col style="width:20%;">
									<col style="*">
									<col style="width:20%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">프로젝트 코드</th>
										<th scope="col">프로젝트/현장 명</th>
										<th scope="col">담당자</th>
										<th scope="col">시작일</th>
										<th scope="col">종료일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${ empty m_project }">
											<tr>
												<td colspan="6">데이터가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="list" items="${m_project}" varStatus="status">
												<tr>
													<td>${status.count}</td>
													<td><a href="#" onclick="PopupCenter('../popup/project.jsp?m_idx='+${list.m_idx}, '협력사', 540, 600);">${list.m_code}</a></td>
													<td>${list.m_name}</td>
													<td>${list.m_ch_person}</td>
													<td>
														<fmt:parseDate value="${list.m_start_date}" var="indate" pattern="yyyy-MM-dd" />
														<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" /></td>
													<td>
														<fmt:parseDate value="${list.m_end_date}" var="indate" pattern="yyyy-MM-dd" />
														<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" />
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<p class="tit">협력사</p>
							<table class="search_list">
								<caption>검색결과</caption>
								<colgroup>
									<col style="width:15%;">
									<col style="*">
									<col style="width:30%;">
									<col style="width:20%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">회사 명</th>
										<th scope="col">이메일</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty partner}">
											<tr><td colspan="4">데이터가 없습니다.</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="p" items="${partner}" varStatus="vs">
												<tr>
													<td>${vs.count}</td>
													<td><a href="javascript:PopupCenter('../popup/partners.jsp?idx='+${p.p_idx}, '${p.p_name }', 540, 600);">${p.p_name}</a></td>
													<td>${p.p_email}</td>
													<td>
														<fmt:parseDate value="${p.p_insert_date}" var="indate" pattern="yyyy-MM-dd" />
														<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" />
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
					<div class="over_r search_wrap no_wrap">
						<p class="tit">은행정보</p>
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:130px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">국내계좌</th>
								<td>· 우리은행 │0100232 │홍길동</td>
							</tr>
							<tr>
								<th scope="row">외화계좌</th>
								<td>
									<p>· 우리은행 │0100232 │홍길동 </p>
									<p>· BIC</p>
									<p>· IBAN</p>
									<p>· SWFTCODE</p>
									<p>· 은행주소</p>
									<p>· 전화번호</p>
								</td>
							</tr>
						</table>
						<div class="table_btn  mt20 ">
							<div class="fl_l">
								<button type="button" class="btn" onclick="PopupCenter('../popup/profile02.jsp?idx=<%=member_idx%>', '옵션작성', 700, 600);">프로필보기</button>
								<button class="btn">저장</button>
								<a href="./individual_list.jsp" class="btn c_list"><span>목록</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>
