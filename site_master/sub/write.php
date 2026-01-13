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
				<div class="list_tit">
					<h3>게시글 등록</h3>
				</div>
				<div class="write">
					<p class="tit">게시글 등록 <span>&#40;&#42; 필수입력&#41;</span></p>
					<table>
						<caption>게시글 등록</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tr>
							<th scope="row"><span class="ast">&#42;</span> 게시판종류</th>
							<td>
								<select>
									<option>광고 / 제휴 게시판</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="ast">&#42;</span> 제목</th>
							<td>
								<input type="text" title="제목" placeholder="공연명 입력">
							</td>
						</tr>
						<tr>
							<th scope="row"><span class="ast">&#42;</span> 게시글 양식</th>
							<td>
								<select>
									<option>선택없음</option>
								</select>
								<button class="btn">게시글 양식등록</button>
								<input type="radio" name="show" id="show_group">
								<label for="show_group" class="radio_label">그룹공연</label>
								<input type="radio" name="show" id="show_each">
								<label for="show_each" class="radio_label">개별공연</label>
							</td>
						</tr>
						<tr>
							<th scope="row">부가설명</th>
							<td>
								<span class="txt">※ 부가설명은 최대 125자 이내로작성해 주세요</span>
								<input type="text" title="부가설명" placeholder="부가설명 입력">
							</td>
						</tr>
						<tr>
							<th scope="row">이벤트기간</th>
							<td>
								<input type="text" title="이벤트기간" placeholder="YYYY-MM-DD" class="ico_date">
								<span class="hype">~</span>
								<input type="text" title="이벤트기간_1" placeholder="YYYY-MM-DD" class="ico_date">
							</td>
						</tr>
						<tr>
							<th scope="row">이미지 등록_1</th>
							<td>
								<ul>
									<li>
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</li>
								</ul>
								<div class="file_area">
									<div class="img_type01">
										<p>
											<input type="text" title="이미지 등록" placeholder="이미지 등록">
										</p>
										<input type="file" id="file_type01">
										<label for="file_type01" class="btn_file">파일찾기</label>
									</div>
									<div class="btn_area txt_btn">
										<button class="btn btn_add">추가</button>
										<button class="btn btn_del">삭제</button>
									</div>
								</div>
							</td>
						</tr>	
						<tr>
							<th scope="row">이미지 등록_2</th>
							<td>
								<div class="file_area">
									<div class="img_type02">
										<p>
											<input type="text" title="이미지 등록" placeholder="이미지 등록">
										</p>
										<input type="file" id="file_type02">
										<label for="file_type02" class="btn_file">파일찾기</label>
									</div>
									<div class="btn_area img_btn">
										<button class="btn btn_add">추가</button>
										<button class="btn btn_del">삭제</button>
									</div>
									<span class="txt">※ 파일 사이즈는 최대 500px입니다.</span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">이미지 등록_3</th>
							<td>
								<div class="thumbnail">
									<div class="img_area">
										<img src="../images/sub/thumbnail.png" alt="thumbnail">
									</div>
									<div class="mt10 thumb_txt">
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</div>
								</div>
								<div class="thumbnail">
									<div class="img_area">
										<img src="../images/sub/thumbnail.png" alt="thumbnail">
									</div>
									<div class="mt10 thumb_txt">
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</div>
								</div>
								<div class="thumbnail">
									<div class="img_area">
										<img src="../images/sub/thumbnail.png" alt="thumbnail">
									</div>
									<div class="mt10 thumb_txt">
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</div>
								</div>
								<div class="thumbnail">
									<div class="img_area">
										<img src="../images/sub/thumbnail.png" alt="thumbnail">
									</div>
									<div class="mt10 thumb_txt">
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</div>
								</div>
								<div class="thumbnail">
									<div class="img_area">
										<img src="../images/sub/thumbnail.png" alt="thumbnail">
									</div>
									<div class="mt10 thumb_txt">
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</div>
								</div>
								<div class="file_area">
									<div class="img_type03">
										<p>
											<input type="text" title="이미지 등록" placeholder="이미지 등록">
										</p>
										<input type="file" id="file_type03">
										<label for="file_type03" class="btn_file">파일찾기</label>
									</div>
									<div class="btn_area txt_btn">
										<button class="btn btn_add">추가</button>
										<button class="btn btn_del">삭제</button>
									</div>
								</div>
								<div class="mt10 thumb_txt">
									<p class="txt">※ 파일은 최대 5개까지 업로드 추가가 가능합니다. </p>
									<p class="txt">※ 파일 사이즈는 최대 500px입니다.</p>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">이미지 등록_4</th>
							<td>
								<ul>
									<li>
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</li>
									<li>
										<span class="file_name">파일명 : image.jpg</span>
										<button class="btn_download"><i>Link</i></button>
									</li>
								</ul>
								<div class="file_area">
									<div class="img_type04">
										<p>
											<input type="text" title="이미지 등록" placeholder="이미지 등록">
										</p>
										<input type="file" id="file_type04">
										<label for="file_type04" class="btn_file">파일찾기</label>
									</div>
									<div class="btn_area txt_btn">
										<button type="button" class="btn btn_add">추가</button>
										<button type="button" class="btn btn_del">삭제</button>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">주소 등록</th>
							<td>
								<p class="address">
									<input type="text" title="주소">
									<button type="button" class="btn">우편번호 검색</button>
								</p>
								<p class="address_detail">
									<input type="text" placeholder="상세주소">
									<input type="text" placeholder="상세주소">
								</p>
							</td>
						</tr>
						<tr>
							<th scope="row">우선 진열여부</th>
							<td>
								<input type="checkbox" title="우선 진열여부" id="txt_1" name="txt">
								<label for="txt_1" class="radio_label">내용_1</label>
								<input type="checkbox" title="우선 진열여부" id="txt_2" name="txt">
								<label for="txt_2" class="radio_label">내용_2</label>
							</td>
						</tr>
					</table>
					<p class="tit">내용 등록</p>
					<table>
						<caption>내용 등록</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tr>
							<th scope="row">비밀글</th>
							<td>
								<input type="radio" name="secret" id="secret_y_1">
								<label for="secret_y_1" class="radio_label">사용</label>
								<input type="radio" name="secret" id="secret_n_1">
								<label for="secret_n_1" class="radio_label">사용 안 함</label>
							</td>
						</tr>
						<tr>
							<th scope="row">내용입력</th>
							<td>
								<textarea></textarea>
							</td>
						</tr>
					</table>
					
					<ul class="list_tab mt40">
						<li class="on"><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
					</ul>
					<table>
						<caption>내용 등록</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:85%;">
						</colgroup>
						<tr>
							<th scope="row">비밀글</th>
							<td>
								<input type="radio" name="secret" id="secret_y_2">
								<label for="secret_y_2" class="radio_label">사용</label>
								<input type="radio" name="secret" id="secret_n_2">
								<label for="secret_n_2" class="radio_label">사용 안 함</label>
							</td>
						</tr>
						<tr>
							<th scope="row">내용입력</th>
							<td>
								<textarea></textarea>
							</td>
						</tr>
					</table>
					<div class="write_btn align_r mt35">
						<button class="btn btn_modify bg_skincolor">저장</button>
						<a href="list.php" class="btn">목록</a>
						<button class="btn btn_del">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
