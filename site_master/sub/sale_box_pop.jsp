<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:60%;height:460px;">
				<div class="list_tit">
					<h3 class="tit">광고 진행내역</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="height:500px;overflow-y:auto;">
					<div class="write">
						<table class="detail mt15 mb10">
							<caption>팝업</caption>
							<colgroup>
								<col style="width:80%;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<tr>
									<th>내역</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="align_l">광고가 완료되었습니다</td>
									<td></td>
								</tr>
								<tr>
									<td class="align_l">2차 인증 사진을 승인하였습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">
										<p>판매자 업체님이 2차 인증사진을 등록하였습니다.</p>
										<div class="mt20">
											<img src="http://placehold.it/95x85?text=sample" alt="2차 인증 사진 이미지01">
											<img src="http://placehold.it/95x85?text=sample" alt="2차 인증 사진 이미지02" class="ml15">
										</div>
									</td>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">1차 인증 사진을 승인하였습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">
										<p>판매자 업체님이 1차 인증사진을 등록하였습니다.</p>
										<div class="mt20">
											<img src="http://placehold.it/95x85?text=sample" alt="1차 인증 사진 이미지01">
											<img src="http://placehold.it/95x85?text=sample" alt="1차 인증 사진 이미지02" class="ml15">
										</div>
									</td>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">광고가 진행되었습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">디자인 수정되었습니다. <a href="#" class="btn ml15" download>다운로드</a></th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">배송 처리 되었습니다. <span class="ml15 bdr">로젠 택배 121231231</span></th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">홍보물 제작완료 되었습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">홍보물 제작중 입니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">디자인 검수 되었습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">판매자업체명님이 광고를 승인하였습니다.</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">광고주 업체명님이 광고를 구매하였습니다.</th>
									<td>yy.mm.00 00:00:00</td>
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