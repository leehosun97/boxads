<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp"%>
<%
	String member_idx = ut.escapeHtml(request, "member_idx");
	
	try{
		StringBuffer query = new StringBuffer();
		
		// 회원정보 조회
		query.append(" SELECT M.member_idx ,CONCAT(M.member_last_name, M.member_name) as member_name ,M.member_registdate ,M.member_use ");
		query.append(" ,M.member_recommand ,M.member_recommand_date ");
		query.append(" ,cast(aes_decrypt(unhex(M.member_email),'" + dbconn.getHashKey() + "')as char(100)) as member_email ");
		query.append(" ,CASE WHEN M.member_path='G' THEN '구글' WHEN M.member_path='F' THEN '페이스북' ELSE '이메일' END as member_path ");
		query.append(" ,C.cod_name ,C.cod_businessNumber ,C.cod_address1 ,C.cod_address2 ,CONCAT(C.filepath ,C.savefile) as file_path ");
		query.append(" ,C.cod_isConfirm ,C.orgfile ,C.cod_idx ");
		query.append(" FROM tbl_member M LEFT JOIN tbl_cod C using(member_idx) ");
		query.append(" WHERE member_idx = ? AND member_type = 'C' ");
		Map<String, String> info_c = dbconn.getSqlToMap(conn, query, member_idx);
		
		if(info_c.isEmpty()){
			out.print(ut.rejectAccess());
			return;
		}
		
		// 담당자 조회
		query = new StringBuffer();
		query.append(" SELECT *,cast(aes_decrypt(unhex(manager_email),'" + dbconn.getHashKey() + "')as char(100)) as email FROM tbl_manager WHERE member_idx = ? ORDER BY manager_idx ");
		List<HashMap<String, String>> manager = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 마스터프로젝트 조회
		query = new StringBuffer();
		query.append(" SELECT * FROM tbl_master_project WHERE member_idx = ? ORDER BY m_idx ");
		List<HashMap<String, String>> m_project = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 협력사 조회
		query = new StringBuffer();
		query.append(" SELECT * FROM tbl_partner WHERE member_idx = ? ORDER BY p_idx ");
		List<HashMap<String,String>> partner = dbconn.getSql2ListMap(conn, query, member_idx);
		
		// 은행 정보
		query = new StringBuffer("SELECT * FROM tbl_member_bank WHERE member_idx = ?");
		Map<String,String> bank_info = dbconn.getSqlToMap(conn, query, member_idx);
		
		pageContext.setAttribute("info_c", info_c);
		pageContext.setAttribute("m_project", m_project);
		pageContext.setAttribute("manager", manager);
		pageContext.setAttribute("partner", partner);
		pageContext.setAttribute("bank_info", bank_info);
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<form name="frm" method="post" action="../action/update_member.jsp">
<input type="hidden" name="member_type" value="C">
<input type="hidden" name="member_idx" value="<%=member_idx%>">
<div class="sub_wrap">
	<aside id="lnb">
		<h2 class="tit">
			<span>회원<span>
		</h2>
		<ul class="menu">
			<li class="btn_sub on"><a href="enterprise_list.jsp">기업</a></li>
			<li><a href="individual_list.jsp">개인</a></li>
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
				<h3>기업</h3>
			</div>
			<div class="list ">
				<div class="over_warp">
					<p class="tit">기업</p>
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width: 170px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">이메일</th>
								<td>${ info_c.member_email }</td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td>${ info_c.member_name }</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>
									<input id="pw_txt01" name="member_password" type="password" title="패스워드" style="width: 300px" placeholder="변경시 입력">
									<label for="pw_txt01"></label>
								</td>
							</tr>
							<tr>
								<th scope="row">가입일</th>
								<td>
									<fmt:parseDate value="${ info_c.member_registdate }" var="indate" pattern="yyyy-MM-dd" />
									<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
								<th scope="row">가입경로</th>
								<td>${ info_c.member_path }</td>
							</tr>
							<tr>
								<th scope="row">기업확인승인</th>
								<td>
									<input type="checkbox" name="cod_isConfirm" id="chk_main01" value="Y"
										<c:if test="${ info_c.cod_isconfirm eq 'Y' }">checked</c:if>>
									<label for="chk_main01">승인</label>
								</td>
							</tr>
							<tr>
								<th scope="row">이용상태</th>
								<td>
									<span>
										<input type="radio" id="setting_01" name="member_use" value="Y"
											<c:if test="${ info_c.member_use eq 'Y' }">checked</c:if>>
										<label for="setting_01">정상 </label>
									</span>
									<span>
										<input type="radio" id="setting_02" name="member_use" value="P"
											<c:if test="${ info_c.member_use eq 'P' }">checked</c:if>>
										<label for="setting_02">정지</label>
									</span>
									<span>
										<input type="radio" id="setting_03" name="member_use" value="D"
											<c:if test="${ info_c.member_use eq 'D' }">checked</c:if>>
										<label for="setting_03">탈퇴</label>
									</span>
								</td>
							</tr>
							<tr>
								<th scope="row">추천전문가 여부</th>
								<td>
									<span>
										<input type="radio" id="recom_01" name="member_recommand" value="Y"
											<c:if test="${ info_c.member_recommand eq 'Y' }">checked</c:if>>
										<label for="recom_01">Y</label>
									</span>
									<span>
										<input type="radio" id="recom_02" name="member_recommand" value="N"
											<c:if test="${ info_c.member_recommand eq 'N' }">checked</c:if>>
										<label for="recom_02">N</label>
									</span>
								</td>
							</tr>
						</table>
					<div class="search_wrap no_wrap">
						<p class="tit">담당자</p>
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width: 10%;">
								<col style="width: 12%;">
								<col style="width: 20%;">
								<col style="">
								<col style="width: 20%;">
								<col style="width: 10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">직급/부서</th>
									<th scope="col">이메일</th>
									<th scope="col">등록일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty manager }">
										<tr>
											<td colspan="6">데이터가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${ manager }" var="m" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${m.manager_name}</td>
												<td>${m.manager_rank}/${m.manager_department}</td>
												<td>${m.email}</td>
												<td>
													<fmt:parseDate value="${m.manager_registdate}" var="indate" pattern="yyyy-MM-dd" />
													<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd" /></td>
												<td><c:choose>
														<c:when test="${m.manager_usecase eq 'Y'}">
														이용
														</c:when>
														<c:otherwise>
														정지
														</c:otherwise>
													</c:choose></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
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
					<p class="tit">세금계산서</p>
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width: 130px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">상호명</th>
							<td>${ info_c.cod_name }</td>
						</tr>
						<tr>
							<th scope="row">사업자번호</th>
							<td>${ info_c.cod_businessnumber }</td>
						</tr>
						<tr>
							<th scope="row">성명</th>
							<td>${ info_c.member_name }</td>
						</tr>
						<tr>
							<th scope="row">사업장소재지</th>
							<td>${ info_c.cod_address1 }${ info_c.cod_address2 }</td>
						</tr>
						<tr>
							<th scope="row">업태</th>
							<td>도소매업</td>
						</tr>
						<tr>
							<th scope="row">종목</th>
							<td>웹사이트개발</td>
						</tr>
						<tr>
							<th scope="row">E-MAIL</th>
							<td>${ info_c.member_email }</td>
						</tr>
						<tr>
							<th scope="row">사업자등록증</th>
							<td><a href="../../shop.inc/jd_download.jsp?f_no=${ info_c.member_idx }&t=cod" class="flie_txt">
								${ info_c.orgfile }
							</a></td>
						</tr>
					</table>
					<p class="tit">은행정보</p>
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width: 130px;">
							<col>
						</colgroup>
						<c:choose>
							<c:when test="${empty bank_info}">
								<tr><td colspan="2">정보 없음</td></tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th scope="row">국내계좌</th>
									<td>· ${bank_info.b_bank} │${bank_info.b_account_number} │${bank_info.b_holder}</td>
								</tr>
								<tr>
									<th scope="row">외화계좌</th>
									<td>
										<p>· ${bank_info.b_fc_bank} │${bank_info.b_fc_account_number} │${bank_info.b_fc_holder}</p>
										<p>· ${bank_info.bic}</p>
										<p>· ${bank_info.iban}</p>
										<p>· ${bank_info.swiftcode}</p>
										<p>· ${bank_info.b_address}</p>
										<p>· ${bank_info.b_tel}</p>
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
					<div class="table_btn  mt20 ">
						<div class="fl_l">
							<button type="button" class="btn" onclick="PopupCenter('../popup/profile.jsp?member_idx='+<%=member_idx%>, '옵션작성', 540, 650);">프로필보기</button>
							<button type="submit" class="btn">저장</button>
							<a href="./enterprise_list.jsp" class="btn c_list"><span>목록</span></a>
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
