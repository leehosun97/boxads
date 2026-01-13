<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>부가기능 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">쿠폰관리</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>쿠폰 관리</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">쿠폰관리</th>
										<td>
											<input type="text" id="kwd02" name="kwd02" placeholder="쿠폰 명">
											<label for="kwd02" class="blind">쿠폰명 입력란</label>
										</td>
										<th scope="row">기간</th>
										<td>
											<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
											<span class="mlr15">~</span>
											<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button type="button" class="btn">검색</button>
					</div>
					<div class="btn_area excel fl_r">		
						<a href="coupon_mgm_write.jsp" class="btn">쿠폰등록</a>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:10%">
										<col>
										<col style="width:10%">
										<col>
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:6%">
									</colgroup>
									<thead>
										<th scope="col"><input type="checkbox"></th>
										<th scope="col">쿠폰 명</th>
										<th scope="col">쿠폰 혜택</th>
										<th scope="col">할인</th>
										<th scope="col">시작일</th>
										<th scope="col">종료일</th>
										<th scope="col">발급일자</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">회원가입 쿠폰</a></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">간단한 쿠폰 혜택 설명</a></td>
											<td>0,000원</td>
											<td>YY-MM-DD</td>
											<td >YY-MM-DD</td>
											<td>YY-MM-DD</td>
											<td>발급</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">쿠폰 명</a></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">간단한 쿠폰 혜택 설명</a></td>
											<td>0,000원</td>
											<td>YY-MM-DD</td>
											<td >YY-MM-DD</td>
											<td>YY-MM-DD</td>
											<td>유효</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">입력한 쿠폰명</a></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">간단한 쿠폰 혜택 설명</a></td>
											<td>0,000원</td>
											<td>YY-MM-DD</td>
											<td >YY-MM-DD</td>
											<td>YY-MM-DD</td>
											<td>만료</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">회원가입 쿠폰</a></td>
											<td><a href="coupon_mgm_view.jsp" style="width:100%">간단한 쿠폰 혜택 설명</a></td>
											<td>0,000원</td>
											<td>YY-MM-DD</td>
											<td >YY-MM-DD</td>
											<td>YY-MM-DD</td>
											<td>취소</td>
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
								<button class="btn" type="button">취소</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$('#gnb ul li').eq(4).addClass('on');

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
