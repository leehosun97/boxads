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
					<h3>애드 신청</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="tit02">
							<h4>전체</h4>
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
												<option value="">박스 명</option>
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
										<th scope="row">광고상태</th>
										<td>
											<div>
												<input type="checkbox" id="all02" name="all02"><label for="all02">전체</label>
												<input type="checkbox" id="stay_bnr" name="stay_bnr"><label for="stay_bnr">광고 대기</label>
												<input type="checkbox" id="advertising" name="advertising"><label for="advertising">광고 중</label>
												<input type="checkbox" id="pause" name="pause"><label for="pause">광고 중</label>
												<input type="checkbox" id="fsh_br" name="fsh_br"><label for="fsh_br">광고완료</label>
											</div>
										</td>
									</tr>
									<tr>
										<th scope="row">신청상태</th>
										<td>
											<div>
												<input type="checkbox" id="all03" name="all03"><label for="all03">전체</label>
												<input type="checkbox" id="ape_bnr" name="ape_bnr"><label for="ape_bnr">광고 신청</label>
												<input type="checkbox" id="con_bnr" name="con_bnr"><label for="con_bnr">광고 승인</label>
												<input type="checkbox" id="def_bnr" name="def_bnr"><label for="def_bnr">광고 집행</label>
												<input type="checkbox" id="can_bnr" name="can_bnr"><label for="can_bnr">광고 취소</label>
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
						<div class="table_wrap">
								<table class="detail mt20 eree">
									<caption>박스 판매 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:14%">
										<col style="width:8%">
										<col style="*">
										<col style="width:8%">
										<col style="*">
										<col style="width:10%">
										<col style="width:10%">
										<col style="width:8%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">신청일시</th>
										<th scope="col">신청번호</th>
										<th scope="col">애드(Ads)</th>
										<th scope="col">광고주</th>
										<th scope="col">박스(BOX)</th>
										<th scope="col">판매자</th>
										<th scope="col">광고 상태</th>
										<th scope="col">신청상태</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">박스명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>광고대기</td>
											<td>광고 신청</td>
										</tr>
										<tr>
											<td>9</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">박스명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>광고대기</td>
											<td>광고승인</td>
										</tr>
										<tr>
											<td>8</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">박스명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>광고대기</td>
											<td>광고집행</td>
										</tr>
										<tr>
											<td>7</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>0000</td>
											<td><a href="#">광고명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td><a href="#">박스명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>광고대기</td>
											<td>광고취소</td>
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
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
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
