<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>설정</span></h2>
			<ul class="menu">
				<li><a href="#">카테고리</a></li>
				<li><a href="field.jsp">분야</a></li>
				<li class="on"><a href="area.jsp">영문지역</a></li>
				<li><a href="fees.jsp">수수료 설정</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>설정</li>
						<li>영문지역</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>영문지역</h3>
				</div>
				<div class="list">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">카테고리</th>
							<td>
								<input type="text" title="키워드"  style="width:350px">
								<button class="month on">입력</button>
							</td>
						</tr>
					</table>
					<div class="search_wrap">
						<table class="search_list pl20">
							<caption>카테고리</caption>
							<colgroup>
								<col style="width:4%;">
								<col style="width:20%;">
								<col>
							</colgroup>
							<thead>
								<tr>
									<th scope="col">
										<input type="checkbox">
									</th>
									<th>순서</th>
									<th scope="col">카테고리 명</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td><input type="text" value="1" title="순서"></td>
									<td><input type="text" value="서울시" title="카테고리"></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td><input type="text" value="2" title="순서"></td>
									<td></td>
								</tr>
								<tr>
									<td>
										<input type="checkbox">
									</td>
									<td><input type="text" value="3" title="순서"></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
							<div class="fl_l">
							</div>
							<div class="fl_r">
								<button type="button" class="btn">저장</button>
								<a href="#" class="btn btn_del"><span>선택삭제</span></a>
							</div>	
						</div>
						<div class="table_btn align_l mt20 pl20 pr20 clearfix">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
