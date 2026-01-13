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
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where m.member_type = 'C' and m.member_use != 'N' ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "target"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
	if(ut.checkValue(field) && ut.checkValue(searchtext)){
		where.append(" and " + field + " LIKE CONCAT('%',?,'%') ");
		params.add(searchtext);
	}
	
	// 시작일자
	String datepicker1 = ut.escapeHtml(request, "datepicker1");
	if(ut.checkValue(datepicker1)){
		where.append(" AND DATE_FORMAT(m.member_registdate,'%Y-%m-%d') >= ? ");
		params.add(datepicker1);
	}
	// 종료일자
	String datepicker2 = ut.escapeHtml(request, "datepicker2");
	if(ut.checkValue(datepicker2)){
		where.append(" AND DATE_FORMAT(m.member_registdate,'%Y-%m-%d') <= ? ");
		params.add(datepicker2);
	}
	
	// ====================== PARAM 세팅 End ======================

	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_member m join tbl_cod c using(member_idx) ");
		query.append(where);
		int p_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"};
		pu = new PagingUtil(request, p_list_cnt, 5, 10, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
	
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT m.member_name, c.cod_name, aes_decrypt(unhex(member_email),'" + dbconn.getHashKey() + "') as member_email, ");
		query.append(" c.cod_phonenumber, m.member_registdate, m.member_use, c.cod_isconfirm " );
		query.append(" from tbl_member m join tbl_cod c using(member_idx) ");
		query.append(where); 
		query.append(" ORDER BY member_registdate DESC ");
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		ArrayList<HashMap<String, String>> company_list = dbconn.getSql2ListMap(conn, query, params);
		
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("company_list", company_list);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
	<%@ include file="../inc/gnb_jd.jsp"%>
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
					<h3>기업</h3>
				</div>
				<div class="list">
				<form name="frm" method="get" action="?">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">분류선택</th>
							<td>
								<select name="target" class="w150">
									<option value="member_name" <%=("member_name".equals(field))?"selected":"" %> >이름</option>
									<option value="member_email" <%=("member_email".equals(field))?"selected":"" %> >이메일</option>
								</select>
								<input name="searchtext" type="text" style="width:150px" value="<%=searchtext%>">
							</td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td>
								<input type="text" title="행사기간" placeholder="시작일" class="ico_date" id="datepicker1" name="datepicker1" value="<%=datepicker1%>" readonly>
								<span class="hypen">~</span>
								<input type="text" title="행시기간_1" placeholder="종료일" class="ico_date" id="datepicker2" name="datepicker2" value="<%=datepicker2%>" readonly>
								<div class="chk_wrap">
									<div class="chk_area">
										<input type="radio" name="month" id="today" onchange="mydateselect();" value="1">
										<label for="today" class="chk">
											오늘
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="week" onchange="mydateselect();" value="2">
										<label for="week" class="chk">
											1주일
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="month" onchange="mydateselect();" value="3">
										<label for="month" class="chk">
											1달
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="half" onchange="mydateselect();" value="4">
										<label for="half" class="chk">
											6개월
										</label>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_down">엑셀다운로드</button>
						<button  type="submit" class="btn btn_search">검색</button>
					</div>
					</form>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>${fn:length(company_list)}</span>건</p>
							<div class="btn_wrap">
								<dl class="order">
									<dt>정렬 :</dt>
									<dd>
										<strong>이름</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="이름 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="이름 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
									<dd>
										<strong>아이디</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="아이디 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="아이디 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
									<dd>
										<strong>가입일시</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="가입일시 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="가입일시 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
								</dl>
								<select>
									<option>20개 출력</option>
								</select>
							</div>
						</div>
						<form name="userForm" method="post">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:5%;">
								<col style="width:8%;">
								<col style="*">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:10%;">
								<col style="width:12%;">
								<col style="width:7%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input id="allCheck" type="checkbox" onclick="allChk(this);">
									</th>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">업체 명</th>
									<th scope="col">이메일</th>
									<th scope="col">휴대폰 번호</th>
									<th scope="col">가입경로</th>
									<th scope="col">가입일</th>
									<th scope="col">상태</th>
									<th scope="col">승인</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty company_list }">
										<tr>
											<th colspan="10">데이터가 없습니다.</th>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${ company_list }" var="list" varStatus="i">	
											<tr>
												<td><input type="checkbox" name="RowCheck" value="${list.member_email}"></td>
												<td>${fn:length(company_list) - i.index}</td>
												<td><a href="enterprise_view.jsp">${list.member_name}</a></td>
												<td><a href="enterprise_view.jsp">${list.cod_name}</a></td>
												<td>${list.member_email}</td>
												<td>${list.cod_phonenumber}</td>
												<td>이메일</td>
												<td><fmt:parseDate value="${list.member_registdate}" var="indate" pattern="yyyy-MM-dd"/>
													<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/></td>
												<td>${list.member_use}</td>
												<td>
												<select>
													<c:choose>
														<c:when test="${list.cod_isconfirm eq 'Y'}">
															<option>승인</option>
															<option>미승인</option>
														</c:when>
														<c:otherwise>
															<option>미승인</option>
															<option>승인</option>
														</c:otherwise>
													</c:choose>
												</select>
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
						</form>
						<div class="pagination mt0">
							<%=pu.showPage()%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="./checkbox_del_e.js"></script>
</body>
</html>

