<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>상품관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">박스</a>
					</li>
					<li class="btn_sub">
						<a href="#">애드</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>애드</h3>
				</div>
				<div class="list">
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:20%">
									<col>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">
											키워드 
										
										</th>
										<td>
											<label for="kwd01" class="blind">키워드 선택</label>
											<select name="" id="kwd01" name="kwd01">
												<option>박스번호</option>
												<option>박스 판매자</option>
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
										</td>
									</tr>
									<tr>
										<th scope="row">상태</th>
										<td>
											<div>
												<input type="checkbox" id="all01" name="all01"><label for="all01">전체</label>
												<input type="checkbox" id="sele01" name="sele01"><label for="sele01">광고 대기</label>
												<input type="checkbox" id="sele02" name="sele02"><label for="sele02">광고중</label>
												<input type="checkbox" id="sele03" name="sele03"><label for="sele03">광고 중지</label>
												<input type="checkbox" id="sele04" name="sele04"><label for="sele04">광고 완료</label>
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
									<caption>애드 리스트</caption>
									<colgroup>
										<col style="width:5%">
										<col style="width:10%">
										<col style="width:8%">
										<col style="*">
										<col style="width:6%">
										<col style="width:10%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
										<col style="width:8%">
									</colgroup>
									<thead>
										<th scope="col">번호</th>
										<th scope="col">등록일시</th>
										<th scope="col">박스번호</th>
										<th scope="col">애드(Ads)</th>
										<th scope="col">광고주</th>
										<th scope="col">광고유형</th>
										<th scope="col">판매월</th>
										<th scope="col">광고비</th>
										<th scope="col">조회수</th>
										<th scope="col">찜수</th>
										<th scope="col">판매수</th>
										<th scope="col">상태</th>
									</thead>
									<tbody>
										<tr>
											<td>10</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>BX1909-00000</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>000</td>
											<td>000</td>
											<td>00/000</td>
											<td>광고대기</td>
										</tr>
										<tr>
											<td>9</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>BX1909-00000</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>000</td>
											<td>000</td>
											<td>00/000</td>
											<td>광고중</td>
										</tr>
										<tr>
											<td>8</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>BX1909-00000</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>000</td>
											<td>000</td>
											<td>00/000</td>
											<td>광고중지</td>
										</tr>
										<tr>
											<td>7</td>
											<td>yy.mm.dd 10:00:00</td>
											<td>BX1909-00000</td>
											<td><a href="#">입력한 박스 명 길면 한줄처리되는부분입니다</a></td>
											<td>업체명</td>
											<td>전단지A4</td>
											<td>전단지A4</td>
											<td>00,000원</td>
											<td>000</td>
											<td>000</td>
											<td>00/000</td>
											<td>광고완료</td>
										</tr>
									</tbody>
								</table>
							</div>
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
<script>
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
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
