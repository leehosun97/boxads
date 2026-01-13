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
					<h3>출금 관리</h3>
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
										<th scope="row">출금상태</th>
										<td>
											<input type="checkbox" id="all" name="all"><label for="all">전체</label>
											<input type="checkbox" id="add" name="add"><label for="add">신청</label>
											<input type="checkbox" id="dispose" name="dispose"><label for="dispose">처리</label>
											<input type="checkbox" id="hold" name="hold"><label for="hold">보류</label>
										</td>
									</tr>
									<tr>
										<th scope="row">검색</th>
										<td>
											<label for="kwd01" class="blind">검색 선택</label>
											<select name="" id="kwd01" name="kwd01">
												<option value="">아이디</option>
												<option value="">업체명</option>
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
											<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					<div class="btn_area tac">		
						<button class="btn" type="btn">검색</button>
					</div>
					<div class="btn_area excel fl_r">		
						<a href="#" class="btn" download>엑셀다운로드</a>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>결제(충전) 리스트</caption>
									<colgroup>
										<col style="width:4%">
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
										<th scope="col"><input type="checkbox"></th>
										<th scope="col">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">업체명</th>
										<th scope="col">계좌정보</th>
										<th scope="col">출금 신청 캐시</th>
										<th scope="col">세엑</th>
										<th scope="col">출금 합계액</th>
										<th scope="col">출금신청일</th>
										<th scope="col">출금처리일</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox"></td>
											<td>10</td>
											<td>sazita@naver.com</td>
											<td>웹비즈</td>
											<td>하나 0000000000000 홍길동</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">22000원</td>
											<td>yy.mm.dd</td>
											<td>yy.mm.dd</td>
											<td>신청</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>9</td>
											<td>sazita@naver.com</td>
											<td>웹비즈</td>
											<td>하나 0000000000000 홍길동</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">22000원</td>
											<td>yy.mm.dd</td>
											<td>yy.mm.dd</td>
											<td>처리</td>
										</tr>
										<tr>
											<td><input type="checkbox"></td>
											<td>8</td>
											<td>sazita@naver.com</td>
											<td>웹비즈</td>
											<td>하나 0000000000000 홍길동</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">20,000원</td>
											<td class="align_r">22000원</td>
											<td>yy.mm.dd</td>
											<td>yy.mm.dd</td>
											<td>보류</td>
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
								<button class="btn" type="button">출금 처리</button>
								<button class="btn" type="button">출금 보류</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(2).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$('#gnb ul li').eq(2).addClass('on');

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
