<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>주문 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">박스 판매</a>
					</li>
					<li class="btn_sub">
						<a href="#">애드 신청</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>박스 판매</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="tit02">
							<h4>박스</h4>
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
										<th scope="row">키워드 
											
										</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select name="" id="kwd01" name="kwd01">
												<option value="">주문번호</option>
												<option value="">박스명</option>
												<option value="">애드명</option>
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
										<th scope="row">광고유형</th>
										<td>
											<div>
												<input type="checkbox" id="all01" name="all01"><label for="all01">전체</label>
												<input type="checkbox" id="bra4" name="bra4"><label for="bra4">전단지 - A4</label>
												<input type="checkbox" id="brb5" name="brb5"><label for="brb5">전단지 - B5</label>
												<input type="checkbox" id="brcup" name="brcup"><label for="brcup">전단지 - 쿠폰</label>
												<input type="checkbox" id="stimd" name="stimd"><label for="stimd">스티커 - 중</label>
												<input type="checkbox" id="stism" name="stism"><label for="stism">스티커 - 소</label>
												<input type="checkbox" id="smpsm" name="smpsm"><label for="smpsm">샘플 - 소</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">광고상태</th>
										<td>
											<div>
												<input type="checkbox" id="all02" name="all02"><label for="all02">전체</label>
												<input type="checkbox" id="br_sel" name="br_sel"><label for="br_sel">광고 구매</label>
												<input type="checkbox" id="br_conf" name="br_conf"><label for="br_conf">광고 승인</label>
												<input type="checkbox" id="br_ing" name="br_ing"><label for="br_ing">광고 진행</label>
												<input type="checkbox" id="frs_bnr" name="frs_bnr"><label for="frs_bnr">1차 광고 인증</label>
												<input type="checkbox" id="sc_bnr" name="sc_bnr"><label for="sc_bnr">2차 광고 인증</label>
												<input type="checkbox" id="cs_sel" name="cs_sel"><label for="cs_sel">구매 취소</label>
												<input type="checkbox" id="fsh_br" name="fsh_br"><label for="fsh_br">광고완료</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">인쇄상태</th>
										<td>
											<div>
												<input type="checkbox" id="all03" name="all03"><label for="all03">전체</label>
												<input type="checkbox" id="des_con" name="des_con"><label for="des_con">디자인 검수</label>
												<input type="checkbox" id="des_fix" name="des_fix"><label for="des_fix">디자인 수정</label>
												<input type="checkbox" id="deliy" name="deliy"><label for="deliy">배송처리</label>
												<input type="checkbox" id="pampl_fn" name="pampl_fn"><label for="pampl_fn">홍보물 제작완료</label>
												<input type="checkbox" id="pampl_ing" name="pampl_ing"><label for="pampl_ing">홍보물 제작 중</label>
											</div>
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
						<div class="table_wrap ofa">
								<table class="detail mt20 eree">
									<caption>박스 판매 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:10%">
										<col style="width:8%">
										<col style="*">
										<col style="width:6%">
										<col style="*">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:8%">
										<col style="width:5%">
										<col style="width:6%">
										<col style="width:6%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">거래일시</th>
										<th scope="col">거래번호</th>
										<th scope="col">박스(BOX)</th>
										<th scope="col">판매자</th>
										<th scope="col">애드(Ads)</th>
										<th scope="col">광고주</th>
										<th scope="col">광고유형</th>
										<th scope="col">판매월</th>
										<th scope="col">총결제금액</th>
										<th scope="col">광고상태</th>
										<th scope="col">인쇄상태</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>P1909-00748</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지-A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>광고구매</td>
											<td>-</td>
										</tr>
										<tr>
											<td>9</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>P1909-00748</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지-A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>광고승인</td>
											<td>디자인 검수</td>
										</tr>
										<tr>
											<td>8</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>P1909-00748</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지-A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>1차광고인증</td>
											<td>배송처리</td>
										</tr>
									</tbody>
								</table>						
							</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
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
