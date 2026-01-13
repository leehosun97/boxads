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
					<button type="button" class="btn btn_add"><span>회원등록</span></button>
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
								<button type="button" class="month on">1개월</button>
								<button type="button" class="month">3개월</button>
								<button type="button" class="month">6개월</button>
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
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button class="btn btn_down">엑셀다운로드</button>
						<button class="btn btn_search">검색</button>
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
								<select>
									<option>10개보기</option>
								</select>
								<select>
									<option>회원가입일</option>
								</select>
								<button class="btn_del"><span>선택삭제</span></button>
							</div>
						</div>
						<div class="thumbnail">
							<div class="thumb_list">
								<div class="img">
									<img src="../images/sub/thumb_img01.png" alt="thumb_img01">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
									<img src="../images/sub/thumb_img02.png" alt="thumb_img01">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
									<img src="../images/sub/thumb_img01.png" alt="thumb_img01">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
									<img src="../images/sub/thumb_img02.png" alt="thumb_img01">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
							<div class="thumb_list">
								<div class="img">
								</div>
								<div class="txt relative">
									<a href="#" class="tit">한위싱동타이 몬스터엑스 출연 제품</a>
									<span class="sub_txt">중국 한위싱방송 프로그램중 몬스터엑스</span>
									<span class="check_box">
										<input type="checkbox">
									</span>
									<span class="date">2016.02.25</span>
									<a href="#" class="btn_view"><i>바로보기</i></a>
								</div>
							</div>
						</div>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<button type="button" type="button" class="btn">선택 가입승인</button>
								<button type="button" type="button" class="btn">선택 탈퇴처리</button>
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
