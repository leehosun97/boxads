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
						<li>DASHBOARD</li>
					</ul>
				</div>
				<div class="list_tit relative">
					<h3>게시글상세</h3>
					<div class="view_btn">
						<button class="btn_modify">수정</button>
						<a href="list.php" class="btn_list">목록</a>
						<button class="btn_del">삭제</button>
					</div>
				</div>
				<div class="view">
					<p class="tit">게시글 상세</p>
					<table class="detail mt20">
						<caption>게시글 상세</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3">
								광고 / 제휴게시판
							</td>
						</tr>
						<tr>
							<th scope="row">작성일</th>
							<td>2017-02-25</td>
							<th scope="row">조회수</th>
							<td>1234</td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td colspan="3">
								<ul>
									<li>
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn btn_download"><i>Download</i></button>
										<button class="btn btn_delete"><i>Delete</i></button>
									</li>
									<li>
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Download</i></button>
										<button class="btn_delete"><i>Delete</i></button>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3">
								진행 강사님의 아이스브레이킹이 너무 좋았습니다. 진행 강사님의 아이스브레이킹이 너무 좋았습니다. 
								진행 강사님의 아이스브레이킹이 너무 좋았습니다.진행 강사님의 아이스브레이킹이 너무 좋았습니다.진행 강사님의 아이스브레이킹이 너무 좋았습니다.
								진행 강사님의 아이스브레이킹이 너무 좋았습니다.진행 강사님의 아이스브레이킹이 너무 좋았습니다. 
								진행 강사님의 아이스브레이킹이 너무 좋았습니다.진행 강사님의 아이스브레이킹이 너무 좋았습니다.진행 강사님의 아이스브레이킹이 너무 좋았습니다. 
								진행 강사님의 아이스브레이킹이 너무 좋았습니다.
							</td>
						</tr>
						<tr>
							<th scope="row">진행상태</th>
							<td colspan="3">
								<select>
									<option>대기</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">총 배송비</th>
							<td colspan="3">25,000원</td>
						</tr>
					</table>
					<ul class="list_tab mt40">
						<li class="on"><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
					</ul>
					<table class="detail">
						<caption>결과</caption>
						<colgroup>
							<col style="width:15%">
							<col style="*">
						</colgroup>
						<tr>
							<th scope="row">맛보기 설정</th>
							<td>
								<input type="radio" id="setting_1_y" name="setting_1">
								<label for="setting_1_y">사용</label>
								<input type="radio" id="setting_1_n" name="setting_1">
								<label for="setting_1_n">사용 안 함</label>
							</td>
						</tr>
						<tr>
							<th scope="row">맛보기 설정2</th>
							<td>
								<input type="radio" id="setting_1_y" name="setting_1">
								<label for="setting_1_y">사용</label>
								<input type="radio" id="setting_1_n" name="setting_1">
								<label for="setting_1_n">사용 안 함</label>
								<button type="button" class="btn">변경하기</button>
							</td>
						</tr>
						<tr>
							<th scope="row">진행상태</th>
							<td>
								<input type="radio" id="setting_2_y" name="setting_2">
								<label for="setting_2_y">사용</label>
								<input type="radio" id="setting_2_n" name="setting_2">
								<label for="setting_2_n">사용 안 함</label>
								<button type="button" class="btn btn_change">변경</button>
								<textarea placeholder="미승인 사유"></textarea>
							</td>
						</tr>
					</table>
					<table class="detail mt50">
						<caption>결과</caption>
						<colgroup>
							<col style="width:15%">
							<col style="width:85%">
						</colgroup>
						<tr>
							<th scope="row"><i class="ico_prev">이전글</i></th>
							<td>
								<a href="#">
									이전글 제목 제목 제목 제목
								</a>
								<span class="date">2017-01-28</span>
							</td>
						</tr>
						<tr>
							<th scope="row"><i class="ico_next">다음글</i></th>
							<td>
								<p class="list_none">
									*다음글이 없습니다.
								</p>
							</td>
						</tr>
					</table>
		
					<p class="tit mt40">댓글 <span>(25)</span></p>
					<div class="reply_wrap mt20">
						<div class="one_talk relative">
							<p>
								<textarea title="댓글입력"></textarea>
							</p>
							<a href="#" class="btn_write btn_one">댓글<br>등록</a>
						</div>
						<div class="reply">
							<dl>
								<dt>
									<img src="../images/common/icon_rely_title.png" alt="icon_rely_title">
									<a href="#" class="writer">홍길동</a>
									<span class="time">2015-05-06</span>
									<p class="btn_area">
										<button class="reply_modify" >수정</button>
										<a href="#" class="reply_del">삭제</a>
									</p>
								</dt>
								<dd>
									<input type="checkbox" id="reply_1" class="modify_check">
									<div class="reply_txt">
										<i class="answer"></i>
										차가 너무 좋았어요!! 인천가서 여기저기 둘러보고 맛있는것도 먹고, 렌트는 처음인데 이렇게 좋은데가 있다는걸 이제  알았네요.
										다음에 또 렌트 하겠습니다.차가 너무 좋았어요!! 인천가서 여기저기 둘러보고 맛있는것도 먹고, 렌트는 처음인데 이렇게 좋은데가
										있다는걸 이제  알았네요. 다음에 또 렌트 하겠습니다.
									</div>
									<div class="modify">
										<textarea></textarea>
										<div class="align_c mt20">
											<button class="btn_save">저장</button>
											<button class="btn_cancel">취소</button>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									<img src="../images/common/icon_rely_title.png" alt="icon_rely_title">
									<a href="#" class="writer">홍길동111</a>
									<span class="time">2015-05-06</span>
									<p class="btn_area">
										<button class="reply_modify" >수정</button>
										<a href="#" class="reply_del">삭제</a>
									</p>
								</dt>
								<dd>
									<input type="checkbox" id="reply_2" class="modify_check">
									<div class="reply_txt">
										<i class="answer"></i>
										차가 너무 좋았어요!! 인천가서 여기저기 둘러보고 맛있는것도 먹고, 렌트는 처음인데 이렇게 좋은데가 있다는걸 이제  알았네요.
										다음에 또 렌트 하겠습니다.차가 너무 좋았어요!! 인천가서 여기저기 둘러보고 맛있는것도 먹고, 렌트는 처음인데 이렇게 좋은데가
										있다는걸 이제  알았네요. 다음에 또 렌트 하겠습니다.
									</div>
									<div class="modify">
										<textarea></textarea>
										<div class="align_c mt20">
											<button class="btn_save">저장</button>
											<button class="btn_cancel">취소</button>
										</div>
									</div>
								</dd>
							</dl>
							<dl>
								<dt>
									<img src="../images/common/icon_rely_title.png" alt="icon_rely_title">
									<a href="#" class="writer">홍길동</a>
									<span class="time">2015-05-06</span>
									<p class="btn_area">
										<button class="reply_modify" >수정</button>
										<a href="#" class="reply_del">삭제</a>
									</p>
								</dt>
								<dd>
									<input type="checkbox" id="reply_3" class="modify_check">
									<div class="deleted">
										* 삭제된 댓글 입니다.
									</div>
								</dd>
							</dl>
						</div>
					</div>
					<div class="pagination mt10">
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
</body>
</html>