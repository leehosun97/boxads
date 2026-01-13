<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="./project_list.inc.jsp"%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>프로젝트</span></h2>
			<%@ include file="../inc/lnb.jsp" %>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>프로젝트</li>
						<li>전체</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>프로젝트</h3>
				</div>
				<form action="?">
					<input type="hidden" name="p_type" value="${param.p_type}">
					<div class="list">
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">키워드 검색</th>
								<td>
									<select name="search_type" class="w150">
										<option value="p_title">프로젝트명</option>
										<option value="r_member_name" <c:if test="${param.search_type eq 'r_member_name'}">selected</c:if>>발주처</option>
										<option value="a_member_name" <c:if test="${param.search_type eq 'a_member_name'}">selected</c:if>>전문가</option>
										<option value="p_code" <c:if test="${param.search_type eq 'p_code'}">selected</c:if>>프로젝트 코드</option>
									</select>
									<input type="text" name="search_text" value="${param.search_text}" title="이름" style="width:150px">
								</td>
							</tr>
							<tr>
								<th scope="row">구분</th>
								<td>       
									<span>
										<input type="radio" id="setting_01" name="p_field" value=""
											onclick="this.form.submit();" checked>
										<label for="setting_01">전체</label>
									</span>
									<span>
										<input type="radio" id="setting_02" name="p_field" value="B"
											onclick="this.form.submit();" <c:if test="${param.p_field eq 'B'}">checked</c:if>>
										<label for="setting_02">구매</label>
									</span>
									<span>
										<input type="radio" id="setting_03" name="p_field" value="E"
											onclick="this.form.submit();" <c:if test="${param.p_field eq 'E'}">checked</c:if>>
										<label for="setting_03">채용</label>
									</span>
								</td>
							</tr>
							<c:choose>
								<c:when test="${empty param.p_type}">
									<tr>
										<th scope="row">상태</th>
										<td>
											<span>
												<input type="radio" id="state_01" name="p_state" value="4"
													onclick="this.form.submit();" <c:if test="${param.p_state eq '4'}">checked</c:if>>
												<label for="state_01">입금확인</label>
											</span>
											<span>
												<input type="radio" id="state_02" name="p_state" value="R"
													onclick="this.form.submit();" <c:if test="${param.p_state eq 'R'}">checked</c:if>>
												<label for="state_02">조정신청</label>
											</span>
										</td>
									</tr>
								</c:when>
								<c:when test="${param.p_type eq '2'}">
									<tr>
										<th scope="row">상태</th>
										<td>
											<span>											
												<input type="radio" id="state_01" name="p_state" value="4"
													onclick="this.form.submit();" <c:if test="${param.p_state eq '4'}">checked</c:if>>
												<label for="state_01">입금확인</label>
											</span>											
										</td>
									</tr>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
															
							<tr>
								<th scope="row">기간</th>
								<td>
									<input type="text" name="start_date" value="${param.start_date}" onchange="this.form.submit();"
										title="시작일" placeholder="시작일" class="ico_date" id="datepicker1">
									<span class="hypen">~</span>
									<input type="text" name="end_date" value="${param.end_date}" onchange="this.form.submit();"
										title="종료일" placeholder="종료일" class="ico_date" id="datepicker2">
								</td>
							</tr>
						</table>
						<div class="btn_area align_r mt20">
							<button type="button" onclick="excel_download(this,'project_list_excel');" class="btn btn_down">엑셀다운로드</button>
							<button class="btn btn_search">검색</button>
						</div>
						<div class="search_wrap">
							<div class="result">
								<p class="txt">검색결과 총 <span>${list_cnt}</span>건</p>
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
									<col style="width:6%;">
									<col style="">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:8%;">
									<col style="width:12%;">
									<col style="width:10%;">
									<col style="width:10%;">
									<col style="width:10%;">
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th scope="col">프로젝트  코드</th>
										<th scope="col">발주처</th>
										<th scope="col">전문가</th>
										<th scope="col">구분</th>
										<th scope="col">금액</th>
										<th scope="col">시작일</th>
										<th scope="col">마감일</th>
										<th scope="col">비고</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr><td colspan="9">데이터가 없습니다</td></tr>
										</c:when>
										<c:otherwise>
											<c:forEach var="p" items="${list}" varStatus="vs">
												<tr>
													<td>${page_start_num - vs.index}</td>
													<td><a href="project_view.jsp?idx=${p.p_idx}">${p.p_code} / ${p.p_title}</a></td>
													<td><a href="project_view.jsp?idx=${p.p_idx}">${p.r_member_name}</a></td>
													<td><a href="project_view.jsp?idx=${p.p_idx}">${p.a_member_name}</a></td>
													<td>${p.p_field_str}</td>
													<td>
														<c:choose>
															<c:when test="${empty p.p_ws_sum}">-</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${p.p_ws_sum}" pattern="#,###"/>
																${p.p_ws_sum_type_str}
															</c:otherwise>
														</c:choose>
													</td>
													<td>
														<fmt:parseDate value="${p.p_insert_date}" var="indate" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
													</td>
													<td>
														<fmt:parseDate value="${p.p_re_date}" var="indate" pattern="yyyy-MM-dd"/>
														<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/>
													</td>
													<td>
														<c:choose>
															<c:when test="${p.p_state eq '4'}">
																<%-- <button type="button" onclick="confirm_deposit('${p.p_idx}')">입금확인</button> --%>
																<a href="javascript:confirm_deposit('${p.p_idx}');" class="btn_t num2">입금확인</a>
															</c:when>
															<c:when test="${p.e_state eq '3'}">조정신청</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
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
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	// 입금확인
	function confirm_deposit(idx){
		if(confirm('입금확인 하시겠습니까?')){
			$.ajax({
				url:'/action/confirm_deposit',
				data: {p_idx: idx},
				method: 'post',
				success: function(data){
					if(data.trim()=='true'){
						alert('입금확인 되었습니다.');
						location.reload();
					}else{
						alert('오류가 발생했습니다.');
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		}
	}
</script>
</body>
</html>
