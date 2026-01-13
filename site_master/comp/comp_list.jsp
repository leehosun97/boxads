<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "factomars.PagingUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	PagingUtil pu = null;
	
	int pageNo = ut.escapeInt(request, "page", 1);
	int line_cnt = ut.escapeInt(request, "line_cnt", 10);
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where 1=1 ");
	
	// 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
		
	if(ut.checkValue(field) && ut.checkValue(searchtext)){				
		switch(field){
			case "k_name" : where.append(" and k_name LIKE CONCAT('%',?,'%') "); break;
			case "person" : where.append(" and person LIKE CONCAT('%',?,'%') "); break;			
		}
		params.add(searchtext);
	}
	
	// 연결 여부
	String link = ut.escapeHtml(request, "link");
	if(ut.checkValue(link)) {
		if(link.equals("Y")) {
			where.append(" and member_idx is not null ");
		} else {
			where.append(" and member_idx is null ");
		}
	}
	
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	StringBuffer order = new StringBuffer(" ORDER BY ");
	order.append(" code desc ");
	// ====================== ORDERBY End ======================
	
	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) cnt from tbl_company ");
		query.append(where);
		int c_list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, c_list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT * FROM tbl_company ");
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
			<h2 class="tit"><span>기업관리</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="comp_list.jsp">기업 리스트</a></li>
				<li><a href="e_upload.jsp">엑셀 업로드</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>기업관리</li>
						<li>기업 리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>기업 리스트</h3>
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
							<th scope="row">연결 여부</th>
							<td>
								<input type="radio" id="link_all" name="link" value="" checked>
								<label for="link_all" style="width: 50px;">전체</label> 
								<input type="radio" id="link_Y" name="link" value="Y" <c:if test="${param.link eq 'Y'}">checked</c:if>>
								<label for="link_Y" style="width: 20px;">Y</label>
								<input type="radio" id="link_N" name="link" value="N" <c:if test="${param.link eq 'N'}">checked</c:if>>
								<label for="link_N" style="width: 20px;">N</label> 
							</td>
						</tr>
						<tr>
							<th scope="row">키워드 검색</th>
							<td>
								<select class="w150" name="field">
									<option value="k_name" <c:if test="${param.field eq 'k_name'}">selected</c:if>>기업명</option>
									<option value="person" <c:if test="${param.field eq 'person'}">selected</c:if>>대표</option>
								</select>
								<input type="text" name="searchtext" title="검색어" style="width:50%" value="${param.searchtext}">
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
								<col style="width:8%;">
								<col style="">
								<col style="width:17%;">
								<col style="width:17%;">
								<col style="width:8%;">
								<col style="width:9%;">
								<col style="width:10%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>코드</th>
									<th scope="col">기업명(KR)</th>
									<th scope="col">업종</th>
									<th scope="col">업태</th>
									<th scope="col">대표</th>
									<th scope="col">tel</th>
									<th scope="col">등록일자</th>
									<th scope="col">링크</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="9">데이터가 없습니다.</td>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${list}" var="c" varStatus="i">
											<tr>
												<td>${page_start_num - i.index}</td>
												<td>${c.code}</td>
												<td><a href="./comp_view.jsp?idx=${c.idx}">${c.k_name}</a></td>
												<td>${c.b_type}</td>
												<td>${c_b_type2}</td>
												<td>${c.person}</td>
												<td>${c.tel}</td>
												<td>
													<fmt:parseDate value="${c.insert_date}" var="indate" pattern="yyyy-MM-dd"/>
													<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
												</td>
												<td>
													<c:if test="${not empty c.member_idx}">
														<a href="../member/enterprise_view.jsp?member_idx=${c.member_idx}">연결</a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>								
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">						
							<input type="hidden" name="idx" value="">
							<div class="fl_r">
								<a href="comp_view.jsp" class="btn">등록</a>
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
