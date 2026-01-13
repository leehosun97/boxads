<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>프로젝트</span></h2>
			<ul class="menu">
				<li class="on btn_sub" >
					<a href="#">프로젝트</a>
					<ul class="sub_menu">
						<li class="on"><a href="#">전체</a></li>
						<li><a href="project_list01.jsp">계약검토</a></li>
						<li><a href="project_list02.jsp">계약진행</a></li>
						<li><a href="project_list03.jsp">업무진행</a></li>
						<li><a href="project_list04.jsp">완료/결제대기</a></li>
						<li><a href="project_list05.jsp">관리자의뢰</a></li>
					</ul>
				</li>
				<li class="btn_sub"><a href="cancel_list.jsp">취소요청리스트</a></li>
				<li><a href="refund_list.jsp">취소/환불리스트</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>프로젝트</li>
						<li>프로젝트</li>
						<li>계약진행</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>프로젝트 _계약진행</h3>
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
								<select class="w150">
									<option>프로젝트명</option>
									<option>발주처</option>
									<option>전문가</option>
									<option>프로젝트 코드</option>
								</select>
								<input type="text" title="이름"  style="width:150px">
							</td>
						</tr>
						<tr>
							<th scope="row">진행상태</th>
							<td>       
								<span><input type="radio" id="setting_01" name="setting"><label for="setting_01">전체</label></span>
								<span><input type="radio" id="setting_02" name="setting"><label for="setting_02">구매</label></span>
								<span><input type="radio" id="setting_03" name="setting"><label for="setting_03">채용</label></span>
							</td>
						</tr>
						<tr>
							<th scope="row">입금처리</th>
							<td>       
								<span><input type="checkbox" id="chk_01" name="setting"><label for="chk_01">입금처리</label></span>
							</td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td>
								<input type="text" title="시작일" placeholder="시작일" class="ico_date" id="datepicker1">
								<span class="hypen">~</span>
								<input type="text" title="종료일" placeholder="종료일" class="ico_date" id="datepicker2">
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_down">엑셀다운로드</button>
						<button  type="button" class="btn btn_search">검색</button>
					</div>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>2</span>건</p>
							<div class="btn_wrap">
								<select>
									<option>20개 출력</option>
								</select>
							</div>
						</div>
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="">
								<col style="width:10%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:12%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th>번호</th>
									<th scope="col">프로젝트  코드</th>
									<th scope="col">발주처</th>
									<th scope="col">전문가</th>
									<th scope="col">구분</th>
									<th scope="col">금액</th>
									<th scope="col">시작일</th>
									<th scope="col">마감일</th>
									<th scope="col">입금처리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>10</td>
									<td><a href="project_view.jsp">P20190201-001 <br> 선박라인교체</a></td>
									<td><a href="project_view.jsp">웹비즈</a></td>
									<td><a href="project_view.jsp">홍길동</a></td>
									<td>구매</td>
									<td>25,000원</td>
									<td>2019-10-10</td>
									<td>2019-10-10</td>
									<td><button type="button" class="btn_t">입금확인</button></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>9</td>
									<td><a href="project_view.jsp">P20190201-001 <br>용접사 구인</a></td>
									<td><a href="project_view.jsp">(주)다날</a></td>
									<td><a href="project_view.jsp">이승주</a></td>
									<td>채용</td>
									<td>25,000원</td>
									<td>2019-10-10</td>
									<td>2019-10-10</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>8</td>
									<td><a href="project_view.jsp">P20190201-001 <br>	 ABR 시스템</a></td>
									<td><a href="project_view.jsp">박비은</a></td>
									<td><a href="project_view.jsp">박비은</a></td>
									<td>구매</td>
									<td>25,000원</td>
									<td>2019-10-10</td>
									<td>2019-10-10</td>
									<td><button type="button" class="btn_t">입금확인</button></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>7</td>
									<td><a href="project_view.jsp">P20190201-001 <br> 엔지니어링 구인구직</a></td>
									<td><a href="project_view.jsp">이명밥</a></td>
									<td><a href="project_view.jsp">이명밥</a></td>
									<td>채용</td>
									<td>25,000원</td>
									<td>2019-10-10</td>
									<td>2019-10-10</td>
									<td><button type="button" class="btn_t">입금확인</button></td>
								</tr>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
						<div class="pagination mt0">
							<a href="#" class="prev">이전 페이지</a>
							<a href="#" class="on">1</a>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">99</a>
							<a href="#" class="next">다음 페이지</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
