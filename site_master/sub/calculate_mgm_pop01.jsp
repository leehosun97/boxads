<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:60%;height:460px;">
				<div class="list_tit">
					<h3 class="tit">웹비즈님 지급 이력</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="height:500px;overflow-y:auto;">
					<div class="write view">
						<table class="detail mt15 mb10 eree">
							<caption>지급이력 팝업</caption>
							<colgroup>
								<col style="width:8%">
								<col style="width:15%">
								<col>
								<col>
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
								<col style="width:8%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">결제번호</th>
									<th scope="col">결제일시</th>
									<th scope="col">박스(Box)</th>
									<th scope="col">애드(Ads)</th>
									<th scope="col">판매월</th>
									<th scope="col">박스수</th>
									<th scope="col">광고수수료</th>
									<th scope="col">인쇄비</th>
									<th scope="col">쿠폰비</th>
									<th scope="col">판매수익</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>000000</td>
									<td>yymmdd 10:00</td>
									<td><a href="#">입력된 박스명 길면한줄로입력됩니다</a></td>
									<td><a href="#">입력된 애드명 길면한줄로입력됩니다</a></td>
									<td>19.01</td>
									<td>00</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
								</tr>
								<tr>
									<td>000000</td>
									<td>yymmdd 10:00</td>
									<td><a href="#">입력된 박스명 길면한줄로입력됩니다</a></td>
									<td><a href="#">입력된 애드명 길면한줄로입력됩니다</a></td>
									<td>19.01</td>
									<td>00</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
								</tr>
								<tr>
									<td>000000</td>
									<td>yymmdd 10:00</td>
									<td><a href="#">입력된 박스명 길면한줄로입력됩니다</a></td>
									<td><a href="#">입력된 애드명 길면한줄로입력됩니다</a></td>
									<td>19.01</td>
									<td>00</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
									<td class="align_r">00,000</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td class="align_r"></td>
									<td class="align_r"></td>
									<td class="align_r"></td>
									<td class="align_r"></td>
								</tr>
							</tbody>
						</table>
						 <div class="pagination mt50">
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