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
	StringBuffer where = new StringBuffer(" where admin_type = 'O' and admin_use != 'D' ");

	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(*) as cnt from tbl_admin ");
		query.append(where);
		int p_list_cnt = dbconn.getCount(conn, query);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거
		pu = new PagingUtil(request, p_list_cnt, 5, 20, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT aes_decrypt(unhex(admin_id),'" + dbconn.getHashKey() + "') as admin_id, ");
		query.append(" admin_name, aes_decrypt(unhex(admin_tel),'" + dbconn.getHashKey() + "') as admin_tel, ");
		query.append(" admin_email, admin_create_date, admin_last_login, admin_idx from tbl_admin ");
		query.append(where); 
		query.append(" ORDER BY admin_create_date DESC ");
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		ArrayList<HashMap<String, String>> operator_list = dbconn.getSql2ListMap(conn, query);
		
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("operator_list", operator_list);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>기타</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="#">운영자관리</a></li>
				<li><a href="contract_list.jsp">계약서</a></li>
				<li><a href="terms_list.jsp">이용약관</a></li>
				<li><a href="privacy_list.jsp">개인정보취급방침</a></li>
				<li><a href="obtain_cont.jsp">수주확인서 약관</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>기타</li>
						<li>운영자관리</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>운영자관리</h3>
				</div>
				<div class="list">
					<div class="search_wrap">
					<form name="userForm" method="post">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:15%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input id="allCheck" type="checkbox" onclick="allChk(this);"/>
									</th>
									<th>번호</th>
									<th scope="col">아이디</th>
									<th scope="col">담당자명</th>
									<th scope="col">연락처</th>
									<th scope="col">이메일</th>
									<th scope="col">등록일</th>
									<th scope="col">최근 로그인 일시</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty operator_list }">
										<tr>
											<th colspan="8">데이터가 없습니다.</th>
										</tr>	
									</c:when>
									<c:otherwise>
										<c:forEach items="${operator_list}" var="list" varStatus="i">
											<tr>
												<td><input type="checkbox" name="RowCheck" value="${list.admin_id}"></td>
												<td>${fn:length(operator_list) - i.index}</td>
												<td><a href="operator_view.jsp?admin_idx=${list.admin_idx}">${list.admin_id}</a></td>
												<td><a href="operator_view.jsp?admin_idx=${list.admin_idx}">${list.admin_name}</a></td>
												<td>${list.admin_tel}</td>
												<td>${list.admin_email}</td>
												<td>${list.admin_create_date}</td>
												<td>${list.admin_last_login}</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<button type="button" class="btn btn_del" onclick="fn_userDel()"><span>선택삭제</span></button>
							</div>
							<div class="fl_r">
								<a href="operator_insert.jsp" class="btn">등록</a>
							</div>	
						</div>
						</form>
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
