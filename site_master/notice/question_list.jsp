<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import = "factomars.PagingUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	PagingUtil pu = null;
	
	int pageNo = ut.escapeInt(request, "page", 1);
	int line_cnt = ut.escapeInt(request, "line_cnt", 10);
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where b.b_parent is null ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
	String cate = ut.escapeHtml(request, "category"); // 유형
		
	if(ut.checkValue(field) && ut.checkValue(searchtext)){				
		switch(field){
			case "b_title" : where.append(" and b_title LIKE CONCAT('%',?,'%') "); break;
			case "b_content" : where.append(" and b_content LIKE CONCAT('%',?,'%') "); break;
			case "b_name" : where.append(" and b_name LIKE CONCAT('%',?,'%') "); break;
		}
		params.add(searchtext);
	}
	
	// 유형
	if(ut.checkValue(cate)){
		where.append(" AND b_category = ? ");
		params.add(cate);
	}
	
	// 시작일자
	String start_date = ut.escapeHtml(request, "start_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(b.b_regdate,'%Y-%m-%d') >= ? ");
		params.add(start_date);
	}
	// 종료일자
	String end_date = ut.escapeHtml(request, "end_date");
	if(ut.checkValue(end_date)){
		where.append(" AND DATE_FORMAT(b.b_regdate,'%Y-%m-%d') <= ? ");
		params.add(end_date);
	}
	
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	StringBuffer order = new StringBuffer(" ORDER BY ");
	order.append(" b.b_idx desc ");
	// ====================== ORDERBY End ======================
	
	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_board b ");
		query.append(where);
		int c_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, c_list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT b_idx, member_idx, b_name, b_company, aes_decrypt(unhex(b.b_email),'" + dbconn.getHashKey() + "') as b_email, b_tel, b_category, b_title, b_content, b_parent, b_viewcnt, date_format(b_regdate, '%Y-%m-%d') AS b_regdate, ");
		query.append(" case when b_reply = 'N' then '답변대기' when b_reply = 'Y' then '답변완료' end as b_reply ");
		query.append(" FROM tbl_board b " );		
		query.append(where);
		query.append(order);
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		ArrayList<HashMap<String, String>> list = dbconn.getSql2ListMap(conn, query, params);
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("c_list_cnt", c_list_cnt);
		pageContext.setAttribute("list", list);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
<script src="/js/common.js"></script>
<<script>

</script>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>게시판</span></h2>
			<ul class="menu">
				<li><a href="notice_list.jsp">FAQ</a></li>
				<li class="on"><a href="question_list.jsp">고객문의</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>게시판</li>
						<li>문의</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>고객문의</h3>
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
								<select name="field" class="w150">
									<option value="b_title" <c:if test="${param.field eq 'b_title'}">selected</c:if>>제목</option>
									<option value="b_content" <c:if test="${param.field eq 'b_content'}">selected</c:if>>내용</option>
									<option value="b_name" <c:if test="${param.field eq 'b_name'}">selected</c:if>>작성자</option>
								</select>
								<input name="searchtext" type="text" style="width:150px" title="검색어" value="${param.searchtext}">
							</td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td>
								<input type="text" title="시작일" placeholder="시작일" class="ico_date" id="datepicker1" name="start_date" value="${param.start_date}" readonly>
								<span class="hypen">~</span>
								<input type="text" title="종료일" placeholder="종료일" class="ico_date" id="datepicker2" name="end_date" value="${param.end_date}" readonly>
							</td>
						</tr>
							<tr>
							<th scope="row">유형</th>
							<td>       
								<span><input type="radio" id="setting_01" name="category" value="" checked="checked"><label for="setting_01">전체</label></span>
								<span><input type="radio" id="setting_02" name="category" value="J" <c:if test="${!empty param.category && param.category eq 'J'}"> checked="checked"</c:if>><label for="setting_02">제휴 문의</label></span>
								<span><input type="radio" id="setting_03" name="category" value="U" <c:if test="${!empty param.category && param.category eq 'U'}"> checked="checked"</c:if>><label for="setting_03">이용 방법 문의</label></span>
								<span><input type="radio" id="setting_04" name="category" value="S" <c:if test="${!empty param.category && param.category eq 'S'}"> checked="checked"</c:if>><label for="setting_04">시스템 오류</label></span>
								<span><input type="radio" id="setting_05" name="category" value="R" <c:if test="${!empty param.category && param.category eq 'R'}"> checked="checked"</c:if>><label for="setting_05">회원가입</label></span>
								<span><input type="radio" id="setting_06" name="category" value="E" <c:if test="${!empty param.category && param.category eq 'E'}"> checked="checked"</c:if>><label for="setting_06">기타</label></span>								
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="submit" class="btn btn_search">검색</button>
					</div>
					</form>
					<div class="search_wrap">
						<!-- <div class="result">
							<p class="txt">검색결과 총 <span>2</span>건</p>
							<div class="btn_wrap">
								<select>
									<option>20개 출력</option>
								</select>
							</div>
						</div> -->
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:8%;">
								<col style="width:15%;">
								<col style="">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:12%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col"><input type="checkbox" class="chkAll"></th>
									<th>번호</th>
									<th scope="col">유형</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">등록일</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<th colspan="7">데이터가 없습니다.</th>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${ list }" var="b" varStatus="i">
											<tr>
												<td><input type="checkbox" value="${b.b_idx}" name="idx" class="justone"></td>
												<td>${page_start_num - i.index}</td>
												<td>
													<c:choose>
														<c:when test="${b.b_category eq 'J'}">제휴 문의</c:when>
														<c:when test="${b.b_category eq 'U'}">이용 방법 문의</c:when>
														<c:when test="${b.b_category eq 'S'}">시스템 오류</c:when>
														<c:when test="${b.b_category eq 'R'}">회원가입</c:when>
														<c:when test="${b.b_category eq 'E'}">기타</c:when>													
													</c:choose>
												</td>
												<td><a href="question_view.jsp?idx=${b.b_idx}">${b.b_title}</a></td>
												<td>${b.b_name}</td>
												<td>${b.b_regdate}</td>
												<td>${b.b_reply}</td>
											</tr>										
										</c:forEach>
									</c:otherwise>
								</c:choose>								
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
						<div class="pagination mt0">
							<%=pu.showPage()%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
