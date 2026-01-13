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
					<h3>일반회원관리</h3>
					<button class="btn btn_add" type="button"><span>회원등록</span></button> 
				</div>
				<div class="list">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:14%;">
							<col style="width:20%;">
							<col style="width:13%;">
							<col style="width:20%;">
							<col style="width:13%;">
							<col style="width:20%;">
						</colgroup>
						<tr>
							<th scope="row">그룹/개별구분</th>
							<td colspan="5">
								<input type="radio" name="search" id="type_01">
								<label for="type_01">그룹공연</label>
								<input type="radio" name="search" id="type_02">
								<label for="type_02">개별공연</label>
							</td>
						</tr>
						<tr>
							<th scope="row">행사기간</th>
							<td colspan="5">
								<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date">
								<span class="hypen">~</span>
								<input type="text" title="행시가긴_1" placeholder="YYYY-MM-DD" class="ico_date">
								<button class="month on">1개월</button>
								<button class="month">3개월</button>
								<button class="month">6개월</button>
							</td>
						</tr>
						<tr>
							<th scope="row">기관구분</th>
							<td>
								<select>
									<option>전체</option>
								</select>
							</td>
							<th scope="row">공연장소</th>
							<td>
								<select>
									<option>전체</option>
								</select>
							</td>
							<th scope="row">장르</th>
							<td>
								<select>
									<option>전체</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">공연명</th>
							<td colspan="5">
								<input type="text" title="공연명" placeholder="공연명 입력" style="width:300px">
								<button type="button" class="btn">검색</button>
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_down">엑셀다운로드</button>
						<button  type="button" class="btn btn_search">검색</button>
					</div>
					<ul class="list_tab">
						<li class="on"><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
						<li><a href="#">월단위 결과</a></li>
					</ul>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>2</span>건</p>
							<div class="btn_wrap">
								<dl class="order">
									<dt>정렬 :</dt>
									<dd>
										<strong>가입일시</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="가입일시 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="가입일시 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
									<dd>
										<strong>이름</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="이름 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="이름 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
									<dd>
										<strong>이메일</strong>
										<span>
											<label class="up"><input type="radio" name="search_order" value="이메일 오름차순" onchange="this.form.submit();"></label>
											<label class="down"><input type="radio" name="search_order" value="이메일 내림차순" onchange="this.form.submit();"></label>
										</span>
									</dd>
								</dl>
								<select>
									<option>10개보기</option>
								</select>
								<select>
									<option>회원가입일</option>
								</select>
								<a href="#" class="btn"><span>샘플</span></a>
								
								<button class="btn btn_del"><span>선택삭제</span></button>
							</div>
						</div>
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:5%;">
								<col style="*">
								<col style="width:18%;">
								<col style="width:10%;">
								<col style="width:8%;">
								<col style="width:12%;">
								<col style="width:7%;">
								<col style="width:7%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th scope="col">번호</th>
									<th scope="col">행사명</th>
									<th scope="col">행사기간</th>
									<th scope="col">장소</th>
									<th scope="col">장르</th>
									<th scope="col">등록/수정일</th>
									<th scope="col">작업자</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>64</td>
									<td><a href="view.php">토요국악동화</a></td>
									<td>2014-01-25 ~ 2014-02-22</td>
									<td>풍유사랑방</td>
									<td>전통</td>
									<td>2017-02-25 17:00</td>
									<td>관리자</td>
									<td>
										<span>수정</span>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>64</td>
									<td><a href="view.php">토요국악동화</a></td>
									<td>2014-01-25 ~ 2014-02-22</td>
									<td>풍유사랑방</td>
									<td>전통</td>
									<td>2017-02-25 17:00</td>
									<td>관리자</td>
									<td>
										<span>대기</span>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>64</td>
									<td><a href="view.php">토요국악동화</a></td>
									<td>2014-01-25 ~ 2014-02-22</td>
									<td>풍유사랑방</td>
									<td>전통</td>
									<td>2017-02-25 17:00</td>
									<td>관리자</td>
									<td>
										<span>요청</span>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>64</td>
									<td><a href="view.php">토요국악동화</a></td>
									<td>2014-01-25 ~ 2014-02-22</td>
									<td>풍유사랑방</td>
									<td>전통</td>
									<td>2017-02-25 17:00</td>
									<td>관리자</td>
									<td>
										<span>진행</span>
									</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>64</td>
									<td><a href="view.php">토요국악동화</a></td>
									<td>2014-01-25 ~ 2014-02-22</td>
									<td>풍유사랑방</td>
									<td>전통</td>
									<td>2017-02-25 17:00</td>
									<td>관리자</td>
									<td>
										<span>완료</span>
									</td>
								</tr>
							</tbody>
							<!--
							<tfoot>
								<tr>
									<td>1</td>
									<td>2</td>
									<td>3</td>
									<td>4</td>
									<td>5</td>
									<td>6</td>
									<td>7</td>
									<td>8</td>
									<td>9</td>
								</tr>
							</tfoot>
							//tfoot
							-->
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<button type="button" class="btn">선택 가입승인</button>
								<button type="button" class="btn">선택 탈퇴처리</button>
								<a href="#" class="btn btn_del"><span>삭제</span></a>
							</div>
							<div class="fl_r">
								<a href="#" class="btn">등록</a>
							</div>	
						</div>
						<div class="pagination mt0">
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
</body>
</html>
