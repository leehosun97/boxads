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
					<h3>수수료 관리</h3>
				</div>
				<div class="list">
					<ul class="s_lnb s_lnb_02">
						<li class="on"><a href="#" >박스애드</a></li>
					</ul>
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
										<th>광고</th>
										<td><input type="text" id="bnr" name="bnr" class="align_r"><label for="bnr" class="blind">광고</label><span class="ml15">%</span></td>
									</tr>
									<tr>
										<th>인쇄</th>
										<td><input type="text" id="cpy" name="cpy" class="align_r"><label for="cpy" class="blind">인쇄</label><span class="ml15">%</span></td>
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
	$('#lnb ul.menu > li').eq(3).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(3).addClass('on');
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
