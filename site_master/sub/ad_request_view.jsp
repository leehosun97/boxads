<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>주문 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">박스 판매</a>
					</li>
					<li class="btn_sub">
						<a href="#">애드 신청</a>
					</li>
				</ul>
			</aside>
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>애드 신청</h3>
            </div>
      <div class="view">
		<div class="fl type01">
              <div class="table_wrap">
			  	<div class="tit02 mt20">
					<h4>신청정보</h4>
				</div>
				<table class="detail mt20">
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row">신청번호</th>
							<td colspan="3">
								0000000
							</td>
						</tr>
						<tr>
							<th scope="row">신청일자</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">신청상태</th>
							<td colspan="3">
								광고신청
							</td>
						</tr>
					</tbody>
                </table>
			</div>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>박스정보</h4>
				</div>
				<table class="detail mt20">
                    <caption>박스정보</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row">상품코드</th>
							<td colspan="3">
								BX1909-00748
							</td>
						</tr>
						<tr>
							<th scope="row">박스 명</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">
								패션의류 > 여성잡화
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								전단지 A4
							</td>
						</tr>
						<tr>
							<th scope="row">판매자명</th>
							<td colspan="3">
								업체명
							</td>
						</tr>
						<tr>
							<th scope="row">판매 월</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">박스 수(인쇄수량)</th>
							<td colspan="3">
								3,000 개
							</td>
						</tr>
						<tr>
							<th scope="row">판매 상태</th>
							<td colspan="3">
								판매중
							</td>
						</tr>
					</tbody>
                </table>
			</div>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>애드정보</h4>
				</div>
				<table class="detail mt20">
                    <caption>애드정보</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
						<tr>
							<th scope="row">상품코드</th>
							<td colspan="3">
								AD1909-00748
							</td>
						</tr>
						<tr>
							<th scope="row">애드 명</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리</th>
							<td colspan="3">
								패션의류 ▷ 여성잡화.뷰티잡화. ▷ 신발.디지털.가전 ▷ 카메라.식품 ▷ 가공식품.도서.문구.티켓 ▷ 도서
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								전단지 A4
							</td>
						</tr>
						<tr>
							<th scope="row">홍보웹페이지</th>
							<td colspan="3">
								https://www.daum.net
							</td>
						</tr>
						<tr>
							<th scope="row">광고주 명</th>
							<td colspan="3">
								업체명
							</td>
						</tr>
						<tr>
							<th scope="row">광고기간</th>
							<td colspan="3">
								18.08.09 ~ 20.02.25
							</td>
						</tr>
						<tr>
							<th scope="row">광고 상태</th>
							<td colspan="3">
								광고중
							</td>
						</tr>
					</tbody>
                </table>
			</div>
				<div class="tit02 mt20">
					<h4>상세소개</h4>
				</div>
				<div class="mt20">
					<textarea name="sel_txtarea" id="sel_txtarea" style="width:100%" rows="10" class="mt20"></textarea>
					<label for="sel_txtarea" class="blind">상세소개</label>
				</div>
        </div>
		<div class="fl type02">
					<div class="tit02 mt20"> 
						<h4>애드 관련 이미지 <span><a href="#"  class="txt_blue" download>QR 다운로드</a><a href="#"  class="txt_blue ml15" download>이미지 다운로드</a></span></h4>
					</div>
					<div class="img_box mt20">
						<div class="img_l">
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span>앞면이미지</span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
						</div>
						<div class="img_r">
							<div>
								<img src="http://placehold.it/85x85?text=QR코드" alt="QR코드" class="fl_r">
							</div>
						</div>
					</div>
					<div class="mt20" style="font-size: 18px;">
						<span class="txt_blue">단축URL : </span><a href="https://www.daum.net:000">https://www.daum.net:000</a>
					</div>
					<div class="tit02 mt20"> 
						<h4>거래관리 메모 </h4>
					</div>
					<div class="mt20">
						<input type="text" id="sel_mgm" name="sel_mgm" style="width:85%;height:25px;">
						<label for="sel_mgm" class="blind">거래관리메모</label>
						<button class="btn" type="button">저장</button>
					</div>
					<p class="memo">입력된 관리자 메모입니다. <span>yy.mm.dd</span></p>
					<div class="btn_area align_r mt20">
						<a class="btn" href="ad_request_pop.jsp" onclick="return popup_layer(this);">진행내역보기</a>
						<a href="#" class="btn" target="_blank">채팅문의</a>
						<a href="activity_member.jsp" class="btn">목록</a>
					</div>
		</div>
				

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script>
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$("#gnb").find("li").eq(2).addClass("on");
	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
</html>
