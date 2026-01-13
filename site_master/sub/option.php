<?php include "../inc/header.php"; ?>
	<?php include "../inc/gnb.php"; ?>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>회원관리</span></h2>
			<ul class="menu">
				<li class="on"><a href="#">Dashboard</a></li>
				<li class="btn_sub">
					<a href="#">일반회원관리</a>
					<ul class="sub_menu">
						<li class="on"><a href="#">승인대기 회원</a></li>
						<li><a href="#">승인완료 회원</a></li>
					</ul>
				</li>
				<li><a href="#">강사회원관리</a></li>
				<li><a href="#">회원탈퇴</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>상품등록관리</li>
                        <li>옵션관리</li>
					</ul>
				</div>
				<div class="list_tit">
					<h3>옵션관리</h3>
				</div>
				<div class="list">
					<div class="search_wrap">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:30%;">
								<col style="width:auto;">
								<col style="width:10%;">
								<col style="width:6%;">
								<col style="width:10%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th scope="col">옵션명</th>
									<th scope="col">옵션항목</th>
									<th scope="col">가격추가</th>
									<th scope="col">필수여부</th>
									<th scope="col">관리</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>Ring</td>
									<td>Diamond</td>
                                    <td>50000원</td>
                                    <td>필수</td>
                                    <td></td>
 								</tr>
                                 <tr>
									<td>
										<input type="checkbox">
									</td>
									<td>Ring</td>
									<td>Diamond</td>
                                    <td>50000원</td>
                                    <td>필수</td>
                                    <td></td>
 								</tr>
							</tbody>
						</table>
						<div class="table_btn mt20 mb70 pl20 pr20 clearfix">
							<div class="fl_l ml10">
								<button class="btn btn_del"><span>선택삭제</span></button>
							</div>
							<div class="fl_r mr10">
                                <button type="button" class="btn" onclick="PopupCenter('../sub/option_write.php', '옵션작성', 540, 460);">추가(팝업)</button>
                              
                                <a class="btn" href="option_write.php" onclick="return popup_layer(this);">추가(모달)</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
</script>
</body>
</html>
