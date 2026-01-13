<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>정산 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">정산관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">결제(충전)관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">출금관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">증빙자료 관리</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>증빙자료 관리</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:15%">
									<col>
									<col style="width:15%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">발행구분</th>
										<td>
											<input type="checkbox" id="all01" name="all01"><label for="all01">전체</label>
											<input type="checkbox" id="sale" name="sale"><label for="sale">매출(충전)</label>
											<input type="checkbox" id="pchs" name="pchs"><label for="pchs">매입(출금)</label>
										</td>
										<th scope="row">증빙유형</th>
										<td>
											<input type="checkbox" id="all02" name="all02"><label for="all02">전체</label>
											<input type="checkbox" id="taxe" name="taxe"><label for="taxe">세금계산서</label>
											<input type="checkbox" id="cultion" name="cultion"><label for="cultion">계산서</label>
											<input type="checkbox" id="bill" name="bill"><label for="bill">영수증</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
										</td>
										<th scope="row">증빙유형</th>
										<td>
											<input type="checkbox" id="all03" name="all03"><label for="all03">전체</label>
											<input type="checkbox" id="publisher01" name="publisher01"><label for="publisher01">발행 요청</label>
											<input type="checkbox" id="publisher02" name="publisher02"><label for="publisher02">발행완료</label>
											<input type="checkbox" id="fix" name="fix"><label for="fix">수정발행</label>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button href="#" class="btn">검색</button>
					</div>
					<div class="btn_area excel fl_r">
						<a href="#" class="btn" download>엑셀다운로드</a>
					</div>
						<div class="table_wrap">
								<div class="mt20">
									<h4>총 : <span class="txt_red">00</span>건</h4>
								</div>
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
										<col>
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">요청일자</th>
										<th scope="col">업체명</th>
										<th scope="col">발행구분</th>
										<th scope="col">증빙 유형</th>
										<th scope="col">공급가액</th>
										<th scope="col">세액</th>
										<th scope="col">합계</th>
										<th scope="col">처리 일자</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>yy-mm-dd</td>
											<td>업체명</td>
											<td><a href="#" style="width:100%">매출(캐치충전)</a></td>
											<td><a href="#" style="width:100%">세금계산서</a></td>
											<td class="align_r">1,000,000원</td>
											<td class="align_r">100,000원</td>
											<td  class="align_r">1,100,000원</td>
											<td>yy.mm.dd</td>
											<td>발행요청</td>
										</tr>
										<tr>
											<td>10</td>
											<td>yy-mm-dd</td>
											<td>업체명</td>
											<td><a href="#" style="width:100%">매출(캐치충전)</a></td>
											<td><a href="#" style="width:100%">세금계산서</a></td>
											<td class="align_r">1,000,000원</td>
											<td class="align_r">100,000원</td>
											<td  class="align_r">1,100,000원</td>
											<td>yy.mm.dd</td>
											<td>발행완료</td>
										</tr>
										<tr>
											<td>10</td>
											<td>yy-mm-dd</td>
											<td>업체명</td>
											<td><a href="#" style="width:100%">매출(캐치충전)</a></td>
											<td><a href="#" style="width:100%">세금계산서</a></td>
											<td class="align_r">1,000,000원</td>
											<td class="align_r">100,000원</td>
											<td  class="align_r">1,100,000원</td>
											<td>yy.mm.dd</td>
											<td>수정발생</td>
										</tr>
										<tr>
											<td>10</td>
											<td>yy-mm-dd</td>
											<td>업체명</td>
											<td><a href="#" style="width:100%">(매입)캐치출금</a></td>
											<td><a href="#" style="width:100%">영수증</a></td>
											<td class="align_r"></td>
											<td class="align_r"></td>
											<td  class="align_r"></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table>
								<div class="pagination mt50">
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
</div>
<script>
	$('#lnb ul.menu > li').eq(3).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$('#gnb ul li').eq(3).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
</body>
</html>
