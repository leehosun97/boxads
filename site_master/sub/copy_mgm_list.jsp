<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>인쇄관리</h3>
				</div>
				<div class="score_wrap">
					<ul>
						<li>
							<div>
								<p>신규 발주</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
						<li>
							<div>
								<p>디자인 검수</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
						<li>
							<div>
								<p>디자인 수정</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
						<li>
							<div>
								<p>홍보물<br>제작중</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
						<li>
							<div>
								<p>홍보물<br>제작완료</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
						<li>
							<div>
								<p>배송처리</p>
								<span class="txt_blue">00</span>
							</div>
						</li>
					</ul>
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
										<th scope="row">키워드</th>
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
										<th scope="row">키워드</th>
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
						<button href="#" class="btn">검색</button>
					</div>
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>인쇄관리</caption>
									<colgroup>
										<col style="width:5%">
										<col>
										<col>
										<col>
										<col style="width:7%">
										<col style="width:7%">
										<col style="width:7%">
										<col>
										<col>
										<col style="width:10%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">주문번호</th>
										<th scope="col">박스 명</th>
										<th scope="col">애드명</th>
										<th scope="col">판매 월</th>
										<th scope="col">광고유형</th>
										<th scope="col">인쇄수량</th>
										<th scope="col">발주일시</th>
										<th scope="col">완료일시</th>
										<th scope="col">인쇄 상태</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>전단지A4</td>
											<td>00,000</td>
											<td >yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>디자인 검수</td>
										</tr>
										<tr>
											<td>9</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>전단지b5</td>
											<td>00,000</td>
											<td >yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>디자인 수정</td>
										</tr>
										<tr>
											<td>8</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>전단지쿠폰</td>
											<td>00,000</td>
											<td >yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>배송처리</td>
										</tr>
										<tr>
											<td>7</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>스티커 중</td>
											<td>00,000</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>홍보물제작중</td>
										</tr>
										<tr>
											<td>6</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>스티커 소</td>
											<td>00,000</td>
											<td >yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>홍보물 제작완료</td>
										</tr>
										<tr>
											<td>5</td>
											<td>P1909-00748</td>
											<td class="align_l"><a href="copy_mgm_view.jsp">입력한 박스 명 길면 한줄로 표시됩니다</a></td>
											<td class="align_l"><a href="copy_mgm_view">광고명</a></td>
											<td>2019.06</td>
											<td>샘플</td>
											<td>00,000</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>발주 취소</td>
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
	$('#lnb ul.menu > li').eq(2).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
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
