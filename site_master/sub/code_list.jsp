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
					<div class="code_wrap mt50">
						<div>
						  <h4>1차 카테고리</h4>
						 <button type="button" class="btn">추가 +</button>
						 <table>
						 	<colgroup>
								<col style="width:20%">
								<col style="*">
								<col style="width:20%">
								<col style="width:18%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순서</th>
									<th scope="col">카테고리명</th>
									<th scope="col">노출여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text"></td>
									<td>패션의류</td>
									<td>미노출</td>
									<td><a href="#" class="btn">수정</a></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>뷰티,잡화</td>
									<td>노출</td>
									<td><a href="#" class="btn">수정</a></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>출산.육아</td>
									<td>노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
							</tbody>
						 </table>
						 <div class="btn_area fl_r">
							<div class="btn" type="button">순서저장</div>
						 </div>
						</div>
						<div>
						  <h4>2차 카테고리</h4>
						 <button type="button" class="btn">추가 +</button>
						 <table>
						 	<colgroup>
								<col style="width:20%">
								<col style="*">
								<col style="width:20%">
								<col style="width:18%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순서</th>
									<th scope="col">카테고리명</th>
									<th scope="col">노출여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
							</tbody>
						 </table>
						 <div class="btn_area fl_r">
							<div class="btn" type="button">순서저장</div>
						 </div>
						</div>
						<div>
						  <h4>3차 카테고리</h4>
						 <button type="button" class="btn">추가 +</button>
						 <table>
						 	<colgroup>
								<col style="width:20%">
								<col style="*">
								<col style="width:20%">
								<col style="width:18%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">순서</th>
									<th scope="col">카테고리명</th>
									<th scope="col">노출여부</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>
								<tr>
									<td><input type="text"></td>
									<td>카테고리명 표시</td>
									<td>미노출</td>
									<td></td>
								</tr>

							</tbody>
						 </table>
						 <div class="btn_area fl_r">
							<div class="btn" type="button">순서저장</div>
						 </div>
						</div>
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
