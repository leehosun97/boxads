<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>사이트 관리</span></h2>
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
					<h3>코드 관리</h3>
				</div>
				<div class="list">
					<ul class="s_lnb">
						<li class="on"><a href="#" >상품유형</a></li>
						<li><a href="#">카테고리</a></li>
						<li><a href="#">FAQ 메뉴</a></li>
					</ul>
					<div class="table_wrap view">
						<table class="detail mt20">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">노출상태</th>
									<td>
										<input type="radio" id="open_y" name="open">
										<label for="open_y">노출</label>
										<input type="radio" id="open_n" name="open">
										<label for="open_n">비노출</label>
									</td>
								</tr>
								<tr>
									<th scope="row">1차 카테고리명</th>
									<td>
										<input type="text" id="kate01" name="kate01">
										<label for="kate01" class="blind">1차 카테고리명</label>
									</td>
								</tr>
								<!-- <tr>
									<th scope="row">2차 카테고리명</th>
									<td>
										<input type="text" id="kate02" name="kate02">
										<label for="kate02" class="blind">2차 카테고리명</label>
									</td>
								</tr>
								<tr>
									<th>3차 카테고리명</th>
									<td>
										<input type="text" id="kate03" name="kate03">
										<label for="kate03" class="blind">3차 카테고리명</label>
									</td>
								</tr> -->
							</tbody>
						</table>						
					</div>
					<div class="btn_area align_c">
						<a href="#" class="btn">목록</a>
						<button class="btn" type="button">등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
	$('#gnb ul li').eq(0).addClass('on');

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
