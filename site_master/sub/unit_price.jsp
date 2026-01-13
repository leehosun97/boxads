<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>설정</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">운영자관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">코드관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">단가관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">수수료 관리</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="list_tit">
					<h3>단가관리</h3>
				</div>
				<div class="list">
					<ul class="s_lnb s_lnb_02">
						<li class="on"><a href="#" >전단지A4</a></li>
						<li><a href="#">전단지B5</a></li>
						<li><a href="#">전단지 쿠폰</a></li>
						<li><a href="#">스티커 중</a></li>
						<li><a href="#">스티커 소</a></li>
					</ul>
					<div class="view">
						<div class="table_wrap">
							<table class="detail mt20 eree">
								<caption>카테고리</caption>
								<colgroup>
									<col style="width:15%">
									<col>
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구간코드</th>
										<th scope="col">인쇄구간</th>
										<th scope="col">단면</th>
										<th scope="col">양면</th>
										<th scope="col"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<input type="text" id="p_code" name="p_code" class="align_c">
											<label for="p_code" class="blind">구간코드</label>
										</td>
										<td style="text-align: center;">
											<input type="text" id="copy01" name="copy01" class="align_r">
											<label for="copy01" class="blind">인쇄구간</label>
											<span class="ml15">개</span>
											<i class="mlr15">~</i>
											<input type="text" id="copy02" name="copy02" class="align_r">
											<label for="copy02" class="blind">인쇄구간</label>
											<span class="ml15">개</span>
										</td>
										<td style="text-align: center;">
											<input type="text" id="part" name="part" class="align_r">
											<label for="part" class="blind">단면</label>
											<span class="ml15">원</span>
										</td>
										<td>
											<input type="text" id="both" name="both" class="align_r">
											<label for="both" class="blind">양면</label>
											<span class="ml15">원</span>
										</td>
										<td>
										</td>
									</tr>
									<tr>
										<td>
											<input type="text" id="p_code" name="p_code" class="align_c">
											<label for="p_code" class="blind" >구간코드</label>
										</td>
										<td style="text-align: center;">
											<input type="text" id="copy01" name="copy01" class="align_r">
											<label for="copy01" class="blind">인쇄구간</label>
											<span class="ml15">개</span>
											<i class="mlr15">~</i>
											<input type="text" id="copy02" name="copy02" class="align_r">
											<label for="copy02" class="blind">인쇄구간</label>
											<span class="ml15">개</span>
										</td>
										<td style="text-align: center;">
											<input type="text" id="part" name="part" class="align_r">
											<label for="part" class="blind">단면</label>
											<span class="ml15">원</span>
										</td>
										<td>
											<input type="text" id="both" name="both" class="align_r">
											<label for="both" class="blind">양면</label>
											<span class="ml15">원</span>
										</td>
										<td class="plus_btn">
											<button class="btn" type="button">삭제</button>
											<button class="btn" type="button">추가 +</button>
										</td>
									</tr>
								</tbody>
							</table>						
						</div>
					</div>
					<div class="btn_area fl_r">		
						<button href="#" class="btn">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(2).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(2).addClass('on');
	$('#gnb ul li').eq(7).addClass('on');

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
