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
					<h3>정산관리</h3>
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
										<th scope="row">정산상태</th>
										<td>
											<input type="checkbox" id="all" name="all"><label for="all">전체</label>
											<input type="checkbox" id="request" name="request"><label for="request">요청</label>
											<input type="checkbox" id="dispose" name="dispose"><label for="dispose">처리</label>
											<input type="checkbox" id="hold" name="hold"><label for="hold">보류</label>
											<input type="checkbox" id="se_cens" name="se_cens"><label for="se_cens">부분취소</label>
										</td>
									</tr>
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
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="button" class="btn">검색</button>
					</div>
					<div class="btn_area excel fl_r">		
						<a href="#" class="btn" download>엑셀다운로드</a>
					</div>
						<div class="mt20">
							<h4>총 : <span class="txt_red">00</span>건</h4>
						</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>정산관리 리스트</caption>
									<colgroup>
										<col style="width:4%">
										<col style="*">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="*">
										<col style="width:8%">
									</colgroup>
									<thead>
										<th scope="col">
											<input type="checkbox">
										</th>
										<th scope="col">요청일시</th>
										<th scope="col">결제번호</th>
										<th scope="col">총결제금액</th>
										<th scope="col">광고주</th>
										<th scope="col">광고비정산</th>
										<th scope="col">판매자</th>
										<th scope="col">쿠폰</th>
										<th scope="col">판매수익</th>
										<th scope="col">정산일시</th>
										<th scope="col">정산상태</th>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="checkbox">
											</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td class="align_r">00,000</td>
											<td ><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000</td>
											<td><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000원</td>
											<td class="align_r">00,000원</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>요청</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox">
											</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td class="align_r">00,000</td>
											<td ><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000</td>
											<td><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000원</td>
											<td class="align_r">00,000원</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>처리</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox">
											</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td class="align_r">00,000</td>
											<td ><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000</td>
											<td><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000원</td>
											<td class="align_r">00,000원</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>보류</td>
										</tr>
										<tr>
											<td>
												<input type="checkbox">
											</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td class="align_r">00,000</td>
											<td ><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000</td>
											<td><a href="calculate_mgm_pop01.jsp" onclick="return popup_layer(this);">업체명</a></td>
											<td class="align_r">00,000원</td>
											<td class="align_r">00,000원</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>부분취소</td>
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
							<div class="btn_area align_r">
								<button class="btn" type="button">처리</button>
								<button class="btn inner_m_btn" type="button">보류</button>
								<button class="btn inner_m_btn" type="button">부분취소</button>
							</div>
							
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal_wrap inner_modal">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:500px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">사유입력</h3>
					<button class="popup_close pop_clo" type="button">×</button>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write view">
							<div class="t_area">
								<textarea name="reason_alert01" id="reason_alert01"  style="width:90%; height:300px;"></textarea>
							</div>
							<div class="btn_area align_c">
								<button class="btn" type="button">입력</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$('#gnb ul li').eq(3).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
	$(".inner_m_btn").on("click",function(){
		$(".inner_modal").css({"display":"table"});
	});
	$(".pop_clo").on("click",function(){
		$(".inner_modal").css({"display":"none"});
	});
</script>
</body>
</html>
