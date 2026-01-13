<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:60%;height:460px;">
				<div class="list_tit">
					<h3 class="tit">신청진행내역</h3>
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
									<td class="align_l">업체명님이 광고 유치 신청을 취소하였습니다</td>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">광고주 OOO님이 신청 받은 박스 상품을 구매하였습니다..</th>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">
										<p>광고주 OOO님이 광고 유치 신청을 "좋아요" 승인하였습니다.</p>
										<div class="mt20">	yy.mm.00 00:00:00</div>
									</td>
									<td>yy.mm.00 00:00:00</td>
								</tr>
								<tr>
									<td class="align_l">업체명님이 광고 유치를 신청하였습니다.</th>
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