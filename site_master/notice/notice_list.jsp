<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import = "factomars.PagingUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	PagingUtil pu = null;
	
	int pageNo = ut.escapeInt(request, "page", 1);
	int line_cnt = ut.escapeInt(request, "line_cnt", 10);
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where ab_category = 'F' ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
		
	if(ut.checkValue(field) && ut.checkValue(searchtext)){				
		switch(field){
			case "ab_title" : where.append(" and ab_title LIKE CONCAT('%',?,'%') "); break;
			case "ab_content" : where.append(" and ab_content LIKE CONCAT('%',?,'%') "); break;			
		}
		params.add(searchtext);
	}
	
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	StringBuffer order = new StringBuffer(" ORDER BY ");
	order.append(" b.ab_idx desc ");
	// ====================== ORDERBY End ======================
	
	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_admin_board ab ");
		query.append(where);
		int c_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, c_list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT ab_idx, member_idx, ab_category, ab_title, ab_content, ab_public, date_format(ab_regdate, '%Y-%m-%d') AS ab_regdate, ab_viewcnt ");		
		query.append(" FROM tbl_admin_board b " );		
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
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>게시판</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="#">FAQ</a></li>
				<li><a href="question_list.jsp">고객문의</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>게시판</li>
						<li>FAQ</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>FAQ</h3>
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
							<th scope="row">키워드 검색</th>
							<td>
								<select class="w150" name="field">
									<option value="ab_title"<c:if test="${param.field eq 'ab_title'}">selected</c:if>>제목</option>
									<option value="ab_content"<c:if test="${param.field eq 'ab_content'}">selected</c:if>>내용</option>
								</select>
								<input type="text" name="searchtext" title="검색어" style="width:150px" value="${param.searchtext}">
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="submit" class="btn btn_search">검색</button>
					</div>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>${c_list_cnt}</span>건</p>
							<div class="btn_wrap">
								<select name="line_cnt" onchange="this.form.submit();">
									<option value="10" <c:if test="${param.line_cnt eq 10}">selected</c:if>>10개 출력</option>
									<option value="20" <c:if test="${param.line_cnt eq 20}">selected</c:if>>20개 출력</option>
									<option value="50" <c:if test="${param.line_cnt eq 50}">selected</c:if>>50개 출력</option>
								</select>
							</div>
						</div>
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="">
								<col style="width:15%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox" class="chkAll">
									</th>
									<th>번호</th>									
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<th colspan="5">데이터가 없습니다.</th>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="ab" varStatus="i">
											<tr>
												<td><input type="checkbox" value="${ab.ab_idx}" name="b_idx" class="justone"></td>										
												<td>${page_start_num - i.index}</td>												
												<td><a href="notice_view.jsp?idx=${ab.ab_idx}">${ab.ab_title}</a></td>
												<td>${ab.ab_regdate}</td>
												<td>${ab.ab_viewcnt}</td>
											</tr>									
										</c:forEach>
									</c:otherwise>
								</c:choose>								
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">						
							<input type="hidden" name="idx" value="">
							<div class="fl_l">
								<a href="#" class="btn btn_del btn_b_del"><span>선택삭제</span></a>
							</div>
						
							<div class="fl_r">
								<a href="notice_view.jsp" class="btn">등록</a>
							</div>	
						</div>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
						<div class="pagination mt0">
							<%=pu.showPage()%>
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

</script>
</body>
</html>
