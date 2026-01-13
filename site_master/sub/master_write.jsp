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
					<h3>운영자관리</h3>
				</div>
				<div class="list">
					<div class="table_wrap view">
						<table class="detail mt20">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:20%">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">성명 <span class="txt_red">*</span> </th>
									<td>
										<input type="text" id="us_name" name="us_name">
										<label for="us_name" class="blind">성명</label>
									</td>
								</tr>
								<tr>
									<th scope="row">아이디 <span class="txt_red">*</span> </th>
									<td>
										<input type="text" id="us_id" name="us_id">
										<label for="us_id" class="blind">아이디</label>
									</td>
								</tr>
								<tr>
									<th scope="row">비밀번호 <span class="txt_red">*</span> </th>
									<td>
										<input type="password" id="us_ps" name="us_ps">
										<label for="us_ps" class="blind">비밀번호</label>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="txt_red">*</span> </th>
									<td>
										<input type="password" id="us_mal" name="us_mal">
										<label for="us_mal" class="blind">이메일</label>
									</td>
								</tr>
								<tr>
									<th scope="row">전화번호 <span class="txt_red">*</span> </th>
									<td>
										<input type="password" id="us_num" name="us_num">
										<label for="us_num" class="blind">전화번호</label>
									</td>
								</tr>
								<tr>
									<th scope="row">소속</th>
									<td>
										<label for="belong" class="blind">소속</label>
										<select name="" id="belong" name="belong">
											<option value="">소속부서명 선택</option>
											<option value="">박스애드 운영팀</option>
											<option value="">박스애드 개발팀</option>
											<option value="">인쇄-이지펍</option>
											<option value="">인쇄-TBD1</option>
											<option value="">디자인-TDB2</option>
											<option value="">디자인-TDB2</option>
											<option value="">쇼핑몰-TDB4</option>
											<option value="">쇼핑몰-TDB5</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">그룹</th>
									<td>
										<label for="group" class="blind">그룹</label>
										<select name="" id="group" name="group">
											<option value="">권한그룹명 선택</option>
											<option value="">슈퍼관리자</option>
											<option value="">운영자-총괄</option>
											<option value="">운영자-기획/MD</option>
											<option value="">운영자-상품검수</option>
											<option value="">운영자-결제정산</option>
											<option value="">운영자-CS</option>
											<option value="">제휴-인쇄</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row">상태 <span class="txt_red">*</span></th>
									<td>
										<input type="radio" id="normal" name="state">
										<label for="normal">정상</label>
										<input type="radio" id="stop" name="state">
										<label for="stop">정지</label>
									</td>
								</tr>
								<tr>
									<th scope="row">권한</th>
									<td>
										<input type="checkbox" id="all" name="all">
										<label for="all">전체</label>
										<input type="checkbox" id="prd_mgmt" name="prd_mgmt">
										<label for="prd_mgmt">상품관리</label>
										<input type="checkbox" id="ord_mgmt" name="ord_mgmt">
										<label for="ord_mgmt">주문관리</label>
										<input type="checkbox" id="culc_mgmt" name="culc_mgmt">
										<label for="culc_mgmt">정산관리</label>
										<input type="checkbox" id="mrst_mgmt" name="mrst_mgmt">
										<label for="mrst_mgmt">부가기능 관리</label>
										<input type="checkbox" id="mem_mgmt" name="mem_mgmt">
										<label for="mem_mgmt">회원관리</label>
										<input type="checkbox" id="site_mgmt" name="site_mgmt">
										<label for="site_mgmt">사이트관리</label>
										<input type="checkbox" id="stt" name="stt">
										<label for="stt">설정</label>
										<input type="checkbox" id="hf" name="hf">
										<label for="hf">통계</label>
										<input type="checkbox" id="cpy_mgmt" name="cpy_mgmt">
										<label for="cpy_mgmt">인쇄관리</label>
									</td>
								</tr>
								<tr>
									<th scope="row">가입일자</th>
									<td>2019.05.06</td>
								</tr>
								<tr>
									<th scope="row">최근 방문일시</th>
									<td>2019.06.06 10:00:01</td>
								</tr>
							</tbody>
						</table>						
					</div>
					<div class="btn_area align_c">
						<a href="#" class="btn">목록</a>
						<button class="btn" type="button">저장</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
	$('#gnb ul li').eq(6).addClass('on');

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
