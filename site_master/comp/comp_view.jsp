<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ include file="../inc/header.jsp"%>
<%
	String idx = ut.escapeHtml(request, "idx");

	try {
		
		StringBuffer query = new StringBuffer();
		query.append(" SELECT C.*, ");
		query.append(" DATE_FORMAT(c_date,'%Y-%m-%d') as c_date_str, ");
		query.append(" DATE_FORMAT(o_date,'%Y-%m-%d') as o_date_str ");
		query.append(" FROM tbl_company C WHERE idx = ? ");
		
		Map<String,Object> c_data = dbconn.getSqlToMapObj(conn, query, idx);
		pageContext.setAttribute("c_data", c_data);
		
		query = new StringBuffer();
		query.append(" SELECT C.c_idx, C.c_name, CC.cp_idx ");
		query.append(" FROM tbl_category C ");
		query.append(" LEFT JOIN tbl_company_category CC ON C.c_idx = CC.ct_idx AND CC.cp_idx = ? ");
		query.append(" WHERE C.c_type = ? ");
		query.append(" ORDER BY C.c_order ");
		
		List<String> params = new ArrayList<>();
		params.add(idx);
		params.add("C");
		
		List<Map<String,Object>> c_list = dbconn.getSql2ListObjectMap(conn, query, params);
		pageContext.setAttribute("c_list", c_list);
		
		params.clear();
		params.add(idx);
		params.add("B");
		
		List<Map<String,Object>> b_list = dbconn.getSql2ListObjectMap(conn, query, params);
		pageContext.setAttribute("b_list", b_list);
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
%>
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
						<li>기업 등록/수정</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>기업 상세</h3>
				</div>
				<div class="list">
				<form method="post" action="insert_company" onsubmit="return validate_form()">
					<input type="hidden" name="idx" value="${c_data.idx}">
					<input type="hidden" id="dup_input" value="${empty c_data.idx ? 'N' : 'Y'}">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:15%;">
							<col>
							<col style="width:15%;">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>코드</th>
								<td colspan="3">
									<c:choose>
										<c:when test="${ not empty c_data.idx }">
											${c_data.code}
										</c:when>
										<c:otherwise>
											<input type="text" name="code" onkeyup="change_code()">
											<button type="button" onclick="check_dup()">중복 체크</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>기업명(Kr)</th>
								<td><input type="text" name="k_name" value="${c_data.k_name}" class="i_data"></td>
								<th>사업자번호</th>
								<td><input type="text" name="b_num" value="${c_data.b_num}" class="i_data"></td>
							</tr>
							<tr>
								<th>기업명(En)</th>
								<td><input type="text" name="e_name" value="${c_data.e_name}" class="i_data"></td>
								<th>홈페이지</th>
								<td><input type="text" name="homepage" value="${c_data.homepage}" class="i_data"></td>
							</tr>
							<tr> 
								<th>카테고리</th>
								<td id="c_td" colspan="3">
									<c:forEach var="c" items="${c_list}" varStatus="vs">
										<input type="checkbox" id="c_ck_${vs.index}" name="categoryList" value="${c.c_idx}"
											<c:if test="${not empty c.cp_idx}">checked</c:if>>
										<label for="c_ck_${vs.index}">${c.c_name}</label>
										<c:if test="${vs.index%5 eq 4}"><br></c:if>
									</c:forEach>
								</td>
							</tr>
							<tr> 
								<th>분야</th>
								<td id="b_td" colspan="3">
									<c:forEach var="c" items="${b_list}" varStatus="vs">
										<input type="checkbox" id="b_ck_${vs.index}" name="categoryList" value="${c.c_idx}"
											<c:if test="${not empty c.cp_idx}">checked</c:if>>
										<label for="b_ck_${vs.index}">${c.c_name}</label>
										<c:if test="${vs.index%5 eq 4}"><br></c:if>
									</c:forEach>
								</td>
							</tr>
							<tr> 
								<th>업종</th>
								<td colspan="3"><input type="text" name="b_type" value="${c_data.b_type}" class="i_data"></td>
							</tr>
							<tr> 
								<th>업태</th>
								<td colspan="3"><input type="text" name="b_type2" value="${c_data.b_type2}" class="i_data"></td>
							</tr>
							<tr>
								<th>업종코드</th>
								<td><input type="text" name="b_code" value="${c_data.b_code}" class="i_data"></td>
								<th>대표자</th>
								<td><input type="text" name="person" value="${c_data.person}" class="i_data"></td>
							</tr>
							<tr> 
								<th>산업분류코드(세세분류)</th>
								<td colspan="3"><input type="text" name="c_code" value="${c_data.c_code}" class="i_data"></td>
							</tr>
							<tr>
								<th>Tel</th>
								<td><input type="text" name="tel" value="${c_data.tel}" class="i_data"></td>
								<th>Fax</th>
								<td><input type="text" name="fax" value="${c_data.fax}" class="i_data"></td>
							</tr>
							<tr>
								<th>설립일자</th>
								<td><input type="text" name="c_date" value="${c_data.c_date_str}" class="i_data"></td>
								<th>개업일자</th>
								<td><input type="text" name="o_date" value="${c_data.o_date_str}" class="i_data"></td>
							</tr>
							<tr>
								<th>임직원 수</th>
								<td><input type="text" name="e_cnt" value="${c_data.e_cnt}" class="i_data"></td>
								<th>우편번호</th>
								<td><input type="text" name="post" value="${c_data.post}" class="i_data"></td>
							</tr>
							<tr> 
								<th>주소(Kr)</th>
								<td colspan="3"><input type="text" name="k_addr" value="${c_data.k_addr}" class="i_data"></td>
							</tr>
							<tr> 
								<th>주소(En)</th>
								<td colspan="3"><input type="text" name="e_addr" value="${c_data.e_addr}" class="i_data"></td>
							</tr>
							<tr> 
								<th>주요제품</th>
								<td colspan="3"><input type="text" name="product" value="${c_data.product}" class="i_data"></td>
							</tr>
							<tr> 
								<th>기업개요</th>
								<td colspan="3"><input type="text" name="c_desc" value="${c_data.c_desc}" class="i_data"></td>
							</tr>
							<tr>
								<th>등록일자</th>
								<td colspan="3">
									<fmt:parseDate value="${c_data.insert_date}" var="indate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_area align_r mt20">
						<button type="submit" class="btn btn_search">저장</button>
						<button type="button" onclick="delete_company()" class="btn btn_search">삭제</button>
						<a href="javascript:history.back();" class="btn btn_search" style="color: #fff;">목록</a>
					</div>
					</form> 
				</div>
			</div>
		</div>
	</div>
	<form id="deleteForm" action="./delete_company" method="post">
		<input type="hidden" name="idx" value="${c_data.idx}">
	</form>
</div>
<script>
	function delete_company() {
		if( confirm('정말 삭제하시겠습니까?') ) {
			$('#deleteForm').submit();
		}
	}

	function validate_form() {

		if( $('input[]') )

		if( $('#c_td').find('input[type=checkbox]:checked').length == 0 ) {
			alert('카테고리를 하나 이상 선택 해 주세요');
			return false;
		}
		if( $('#c_td').find('input[type=checkbox]:checked').length == 0 ) {
			alert('카테고리를 하나 이상 선택 해 주세요');
			return false;
		}

		return true;
	}

	function check_dup() {

		if( $('input[name=code]').val() != '' ) {
	
			$.ajax({
				url: '../ajax/check_dup_code.jsp',
				data: {code: $('input[name=code]').val()},
				type: 'post',
				success: function(data) {
	
					if( data.trim() == 'fail' ) {
						alert('중복된 코드입니다.');
						$('#dup_input').val('N');
						return false;
					} else {
						alert('사용가능한 코드입니다.');
						$('#dup_input').val('Y');
					}
					
				}
			});
			
		}
		
	}

	function change_code() {
		$('#dup_input').val('N');
	}
</script>
</body>
</html>
