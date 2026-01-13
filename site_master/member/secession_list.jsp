<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "factomars.PagingUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ include file="../inc/header.jsp"%>
<%
	PagingUtil pu = null;

	int pageNo = ut.escapeInt(request, "page", 1);
	int line_cnt = ut.escapeInt(request, "line_cnt", 10);
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where member_use != 'Y' ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
	if(ut.checkValue(field) && ut.checkValue(searchtext)){
		if(field.equals("member_email")){
			where.append(" and aes_decrypt(unhex(member_email),'" + dbconn.getHashKey() + "') LIKE CONCAT('%',?,'%') ");
		}else if(field.equals("member_name")){
			where.append(" and CONCAT(M.member_last_name,M.member_name) LIKE CONCAT('%',?,'%') ");
		}
		params.add(searchtext);
	}
	
	// 검색조건 ㅡ 정지회원P/탈퇴회원N
	String member_use = ut.escapeHtml(request, "member_use");
	if(ut.checkValue(member_use)){
		where.append(" and member_use = ? ");
		params.add(member_use);
	}
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	String search_order = ut.escapeHtml(request, "search_order");
	StringBuffer order = new StringBuffer(" ORDER BY ");
	switch(search_order){
		case "이름 오름차순": 	order.append(" member_name "); 				break;
		case "이름 내림차순": 	order.append(" member_name desc "); 		break;
		case "이메일 오름차순": 	order.append(" member_email "); 			break;
		case "이메일 내림차순": 	order.append(" member_email desc "); 		break;
		case "가입일 오름차순": 	order.append(" member_registdate "); 		break;
		case "가입일 내림차순": 	order.append(" member_registdate desc "); 	break;
		default: 			order.append(" member_idx desc "); 			break;
	}
	// ====================== ORDERBY End ======================

	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_member ");
		query.append(where);
		int p_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, p_list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT CONCAT(member_last_name,member_name) as member_name, aes_decrypt(unhex(member_email),'" + dbconn.getHashKey() + "') as member_email, ");
		query.append(" member_deletedate, member_registdate, member_use, member_type, member_idx from tbl_member " );
		query.append(where); 
		query.append(order);
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		ArrayList<HashMap<String, String>> secession_list = dbconn.getSql2ListMap(conn, query, params);
		
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("secession_list", secession_list);
		pageContext.setAttribute("p_list_cnt", p_list_cnt);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
	<%@ include file="../inc/gnb.jsp"%>
<form name="frm" method="get" action="?">
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>회원</span></h2>
			<%@ include file="../inc/lnb.jsp" %>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>회원</li>
						<li>기업</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>탈퇴회원</h3>
				</div>
				<div class="list">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">분류선택</th>
							<td>
								<select name="field" class="w150">
									<option value="member_name" <c:if test="${param.field eq 'member_name'}">selected</c:if>>이름</option>
									<option value="member_email" <c:if test="${param.field eq 'member_email'}">selected</c:if>>이메일</option>
								</select>
								<input name="searchtext" type="text" style="width:150px" value="${param.searchtext}">
							</td>
						</tr>
						<tr>
							<th scope="row">상태</th>
							<td>
								<span>
									<input type="radio" id="setting_01" name="member_use" value="" <c:if test="${empty param.member_use || param.member_use eq ''}">checked</c:if>>
									<label for="setting_01">전체</label>
								</span>
								<span>
									<input type="radio" id="setting_02" name="member_use" value="P" <c:if test="${param.member_use eq 'P'}">checked</c:if>>
									<label for="setting_02">정지</label>
								</span>
								<span>
									<input type="radio" id="setting_03" name="member_use" value="D" <c:if test="${param.member_use eq 'D'}">checked</c:if>>
									<label for="setting_03">탈퇴</label>
								</span>
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_down">엑셀다운로드</button>
						<button  type="submit" class="btn btn_search">검색</button>
					</div>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>${p_list_cnt}</span>건</p>
							<div class="btn_wrap">
								<dl class="order">
									<dt>정렬 :</dt>
									<dd>
										<strong>이름</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="이름 오름차순" onclick="this.form.submit()"></label>
											<label class="down"><input type="radio" name="search_order" value="이름 내림차순" onclick="this.form.submit()"></label>
										</span>
									</dd>
									<dd>
										<strong>이메일</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="이메일 오름차순" onchange="this.form.submit()"></label>
											<label class="down"><input type="radio" name="search_order" value="이메일 내림차순" onchange="this.form.submit()"></label>
										</span>
									</dd>
									<dd>
										<strong>가입일</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="가입일 오름차순" onchange="this.form.submit()"></label>
											<label class="down"><input type="radio" name="search_order" value="가입일 내림차순" onchange="this.form.submit()"></label>
										</span>
									</dd>
								</dl>
								<select name="line_cnt" onchange="this.form.submit();">
									<option value="10" <c:if test="${param.line_cnt eq 10}">selected</c:if>>10개 출력</option>
									<option value="20" <c:if test="${param.line_cnt eq 20}">selected</c:if>>20개 출력</option>
									<option value="50" <c:if test="${param.line_cnt eq 50}">selected</c:if>>50개 출력</option>
								</select>
							</div>
						</div>
						<table class="search_list mb30" id="sort_table">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:5%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:12%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">탈퇴일</th>
									<th scope="col">가입일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty secession_list }">
										<tr>
											<th colspan="6">데이터가 없습니다.</th>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${secession_list}" var="list" varStatus="i">
												<tr>
													<td>${page_start_num - i.index}</td>
													<td>
														<c:choose>
															<c:when test="${list.member_type eq 'P'}">
																<a href="./individual_view.jsp?member_idx=${list.member_idx}">${list.member_name}</a>
															</c:when>
															<c:otherwise>
																<a href="./enterprise_view.jsp?member_idx=${list.member_idx}">${list.member_name}</a>
															</c:otherwise>
														</c:choose>
													</td>
													<td>${list.member_email}</td>
													<td>${list.member_deletedate}</td>
													<td>${list.member_registdate}</td>
													<td>
														<c:if test ="${list.member_use eq 'Y'}">정상</c:if>
														<c:if test ="${list.member_use eq 'P'}">정지</c:if>
														<c:if test ="${list.member_use eq 'D'}">탈퇴</c:if>
													</td>
													</tr>
												</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<button type="button" class="btn" onclick="fn_userDel()">선택 탈퇴처리</button>
							</div>
						</div>
						
						<div class="pagination mt0">
							<%=pu.showPage()%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script src="sort.js"></script>
</html>

