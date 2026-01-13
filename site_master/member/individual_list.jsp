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
	StringBuffer where = new StringBuffer(" where M.member_type = 'P' and M.member_use != 'D' ");
	where.append(" and M.member_email_authstatus = 'Y' ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
	if(ut.checkValue(field) && ut.checkValue(searchtext)){
		if(field.equals("member_email")){
			where.append(" and CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) LIKE CONCAT('%',?,'%') ");
		}else if(field.equals("member_name")){
			where.append(" and CONCAT(M.member_last_name,M.member_name) LIKE CONCAT('%',?,'%') ");
		}
		params.add(searchtext);
	}
	
	// 시작일자
	String start_date = ut.escapeHtml(request, "start_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(M.member_registdate,'%Y-%m-%d') >= ? ");
		params.add(start_date);
	}
	// 종료일자
	String end_date = ut.escapeHtml(request, "end_date");
	if(ut.checkValue(end_date)){
		where.append(" AND DATE_FORMAT(M.member_registdate,'%Y-%m-%d') <= ? ");
		params.add(end_date);
	}
	
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	String search_order = ut.escapeHtml(request, "search_order");
	StringBuffer order = new StringBuffer(" ORDER BY ");
	switch(search_order){
		case "이름 오름차순": 	order.append(" CONCAT(M.member_last_name,M.member_name) "); 			break;
		case "이름 내림차순": 	order.append(" CONCAT(M.member_last_name,M.member_name) desc "); 		break;
		case "이메일 오름차순": 	order.append(" CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) "); 			break;
		case "이메일 내림차순": 	order.append(" CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) desc "); 		break;
		case "가입일 오름차순": 	order.append(" M.member_registdate "); 		break;
		case "가입일 내림차순": 	order.append(" M.member_registdate desc "); 	break;
		default: 			order.append(" M.member_idx desc "); 			break;
	}
	// ====================== ORDERBY End ======================

	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_member M LEFT OUTER JOIN tbl_profile_p P using(member_idx) ");
		query.append(where);
		int p_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, p_list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT M.member_idx ,CONCAT(M.member_last_name,' ',M.member_name) as member_name ");
		query.append(" ,CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) as member_email ");
		query.append(" ,create_phoneNum(P.p_address1, REPLACE(P.p_tel,'-','')) as p_tel ");
		query.append(" ,CASE WHEN M.member_path = 'G' THEN '구글' WHEN M.member_path = 'F' THEN '페이스북' ELSE '이메일' END as member_path ");
		query.append(" ,CASE WHEN M.member_use='Y' THEN '정상' ELSE '정지' END  as member_use ");
		query.append(" ,DATE_FORMAT(M.member_registdate,'%Y-%m-%d') as member_registdate ");
		query.append(" FROM tbl_member M ");
		query.append(" LEFT JOIN tbl_profile_p P ON M.member_idx = P.member_idx ");
		query.append(where);
		query.append(order);
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		ArrayList<HashMap<String, String>> individual_list = dbconn.getSql2ListMap(conn, query, params);
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("p_list_cnt", p_list_cnt);
		pageContext.setAttribute("individual_list", individual_list);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
	<%@ include file="../inc/gnb.jsp"%>
	<form name="frm" method="get" action="individual_list.jsp">
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
					<h3>개인</h3>
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
							<th scope="row">기간</th>
							<td>
								<input type="text" title="행사기간" placeholder="시작일" class="ico_date" id="datepicker1" name="start_date" value="${param.start_date}" readonly>
								<span class="hypen">~</span>
								<input type="text" title="행시기간_1" placeholder="종료일" class="ico_date" id="datepicker2" name="end_date" value="${param.end_date}" readonly>
								<div class="chk_wrap">
									<div class="chk_area">
										<input type="radio" name="month" id="today" onchange="setToday();" value="1">
										<label for="today" class="chk">
											오늘
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="week" onchange="setWeek();" value="2">
										<label for="week" class="chk">
											1주일
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="month" onchange="setMonth(1);" value="3">
										<label for="month" class="chk">
											1달
										</label>
									</div>
									<div class="chk_area">
										<input type="radio" name="month" id="half" onchange="setMonth(6);" value="4">
										<label for="half" class="chk">
											6개월
										</label>
									</div>
								</div>
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button type="button" onclick="excel_download(this,'individual_list_excel');" class="btn btn_down">엑셀다운로드</button>
						<button type="submit" class="btn btn_search">검색</button>
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
											<label class="up">
												<input type="radio" name="search_order" value="이름 오름차순" onclick="this.form.submit()"
													<c:if test="${param.search_order eq '이름 오름차순'}">checked</c:if>>
											</label>
											<label class="down">
												<input type="radio" name="search_order" value="이름 내림차순" onclick="this.form.submit()"
													<c:if test="${param.search_order eq '이름 내림차순'}">checked</c:if>>
											</label>
										</span>
									</dd>
									<dd>
										<strong>이메일</strong>
										<span>
											<label class="up">
												<input type="radio" name="search_order" value="이메일 오름차순" onchange="this.form.submit()"
													<c:if test="${param.search_order eq '이메일 오름차순'}">checked</c:if>>
											</label>
											<label class="down">
												<input type="radio" name="search_order" value="이메일 내림차순" onchange="this.form.submit()"
													<c:if test="${param.search_order eq '이메일 내림차순'}">checked</c:if>>
											</label>
										</span>
									</dd>
									<dd>
										<strong>가입일</strong>
										<span>
											<label class="up">
												<input type="radio" name="search_order" value="가입일 오름차순" onchange="this.form.submit()"
													<c:if test="${param.search_order eq '가입일 오름차순'}">checked</c:if>>
											</label>
											<label class="down">
												<input type="radio" name="search_order" value="가입일 내림차순" onchange="this.form.submit()"
													<c:if test="${param.search_order eq '가입일 내림차순'}">checked</c:if>>
											</label>
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
						<table class="search_list" id="sort_table">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:4%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:10%;">
								<col style="width:14%;">
								<col style="width:14%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input id="allCheck" type="checkbox" onclick="allChk(this);">
									</th>
									<th scope="col">번호</th>
									<th scope="col">이름</th>
									<th scope="col">이메일</th>
									<th scope="col">휴대폰 번호</th>
									<th scope="col">가입경로</th>
									<th scope="col">가입일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty individual_list }">
										<tr>
											<td colspan="8">데이터가 없습니다.</td>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${ individual_list }" var="list" varStatus="i">	
											<tr>
												<td><input type="checkbox" name="RowCheck" value="${list.member_idx}"></td>
												<td>${page_start_num - i.index}</td>
												<td><a href="individual_view.jsp?member_idx=${list.member_idx}">${list.member_name}</a></td>
												<td>${list.member_email}</td>
												<td>${list.p_tel}</td>
												<td>${list.member_path}</td>
												<td>${list.member_registdate}</td>
												<td>${list.member_use}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose> 
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<button type="button" class="btn" onclick="del_check_member()">선택 탈퇴처리</button>
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
	<form action="../action/member_list_delete.jsp" method="post" id="delForm">
		<input type="hidden" name="member_type" value="P">
		<input type="hidden" name="del_member_idx">
	</form>
<script>
	// 회원 탈퇴처리
	function del_check_member(){
		if($('tbody input[type=checkbox]:checked').length>0){
			if(confirm('정말 탈퇴처리하시겠습니까?')){
				var del_idxs = '';
				$('tbody input[type=checkbox]:checked').each(function(){
					del_idxs += ',' + $(this).val();
				});
				$('input[name=del_member_idx]').val(del_idxs.substr(1));
				$('#delForm').submit();
			}
		}
	}
</script>
</body>
</html>

