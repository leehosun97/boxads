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
					<h3>결제(충전) 관리</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="tit02">
							<h4>전체</h>
						</div>
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">키워드</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select name="" id="kwd01" name="kwd01">
												<option value="">아이디</option>
												<option value="">결제번호</option>
												<option value="">광고주</option>
											</select>
											<input type="text" id="kwd02" name="kwd02">
											<label for="kwd02" class="blind">키워드 입력란</label>
										</td>
									</tr>
									<tr>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행시가긴_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
											<button type="button" class="btn">오늘</button>
											<button type="button" class="btn">1주일</button>
											<button type="button" class="btn">1달</button>
										</td>
									</tr>
									<tr>
										<th scope="row">정산상태</th>
										<td>
											<input type="checkbox" id="all" name="all"><label for="all">전체</label>
											<input type="checkbox" id="card" name="card"><label for="card">신용카드</label>
											<input type="checkbox" id="account" name="account"><label for="account">계좌이체</label>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="button" class="btn">검색</button>
					</div>
					<div class="btn_area excel fl_r">		
						<a href="#" class="btn" download>엑셀다운로드</a>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:4%">
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
										<th scope="col">결제일시</th>
										<th scope="col">결제승인번호</th>
										<th scope="col">충전상품</th>
										<th scope="col">결제금액</th>
										<th scope="col">결제방식</th>
										<th scope="col">결제결과</th>
										<th scope="col">회원명</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>000000</td>
											<td class="align_r">10만원</td>
											<td class="align_r">100,000원</td>
											<td>신용카드</td>
											<td>신한카드 3개월</td>
											<td>업체명</td>
										</tr>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>000000</td>
											<td class="align_r">20만원</td>
											<td class="align_r">100,000원</td>
											<td>계좌이체</td>
											<td>신한카드 일시불</td>
											<td>업체명</td>
										</tr>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>000000</td>
											<td class="align_r">30만원</td>
											<td class="align_r">300,000원</td>
											<td></td>
											<td>신한 000-000-0000</td>
											<td>업체명</td>
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
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
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
