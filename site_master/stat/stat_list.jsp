<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>게시판</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="#">FAQ</a></li>
				<li><a href="question_list.jsp">고객문의</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>게시판</li>
						<li>FAQ</li>
						<li>리스트</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>FAQ</h3>
				</div>
				<div class="list">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">키워드 검색</th>
							<td>
								<select class="w150">
									<option>제목</option>
									<option>내용</option>
								</select>
								<input type="text" title="이름"  style="width:150px">
							</td>
						</tr>
					</table>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_search">검색</button>
					</div>
					<div class="search_wrap">
						<div class="result">
							<p class="txt">검색결과 총 <span>2</span>건</p>
							<div class="btn_wrap">
								<select>
									<option>20개 출력</option>
								</select>
							</div>
						</div>
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:6%;">
								<col style="width:10%;">
								<col style="">
								<col style="width:15%;">
								<col style="width:8%;">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th>번호</th>
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>5</td>
									<td>회원</td>
									<td><a href="notice_view.jsp">회원관련 질문 입니다.</a></td>
									<td>2019-10-10</td>
									<td>5</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>4</td>
									<td>광고모집</td>
									<td></td>
									<td>2019-10-10</td>
									<td>4</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>3</td>
									<td></td>
									<td></td>
									<td>2019-10-10</td>
									<td>3</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>2</td>
									<td></td>
									<td></td>
									<td>2019-10-10</td>
									<td>2</td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td>1</td>
									<td></td>
									<td></td>
									<td>2019-10-10</td>
									<td>1</td>
								</tr>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
								<a href="#" class="btn btn_del"><span>선택삭제</span></a>
							</div>
							<div class="fl_r">
								<a href="#" class="btn">등록</a>
							</div>	
						</div>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
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
