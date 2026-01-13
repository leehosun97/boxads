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
                <h3>박스판매</h3>
            </div>
      <div class="view">
		<div class="fl type01">
              <div class="table_wrap">
			  	<div class="tit02 mt20">
					<h4>주문 정보</h4>
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
							<th scope="row">결제번호</th>
							<td colspan="3">
								0000000
							</td>
						</tr>
						<tr>
							<th scope="row">결제일자</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">광고상태</th>
							<td colspan="3">
								광고진행
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄상태</th>
							<td colspan="3">
								배송처리
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								전단지 A4
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
								3,000개
							</td>
						</tr>
						<tr>
							<th scope="row">광고비</th>
							<td colspan="3">
								10,000원 (10원/개당)
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄비</th>
							<td colspan="3">
								45,000원
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰</th>
							<td colspan="3">
								1,000원, 신규가입할인
							</td>
						</tr>
						<tr>
							<th scope="row">총 결제금액</th>
							<td colspan="3">
								54,000원
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
							<th scope="row">광고주명</th>
							<td colspan="3">
								업체명
							</td>
						</tr>
						<tr>
							<th scope="row">광고기간</th>
							<td colspan="3">
								19.08.09 ~ 20.02.25
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
						<h4>거래관리 메모</h4>
				</div>
				<div class="mt20">
					<input type="text" id="sel_mgm" name="sel_mgm" style="width:85%;height:25px;">
					<label for="sel_mgm" class="blind">거래관리메모</label>
					 <button class="btn" type="button">저장</button>
					<table class="detail">
							<caption>변경내역,등록일</caption>
							<colgroup>
								<col style="width:60%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<td>변경이력이 없습니다</td>
									<td>yy.mm.dd</td>
								</tr>
							</tbody>
						</table>
						<div class="tit02 mt20">
							<h4>거래관리 메모</h4>
						</div>
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
								<p></p>
								<span>앞면이미지</span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p></p>
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
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>광고 인증</h4>
						</div>
						<table class="detail mt20">
							<caption>광고 인증</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">1차 광고인증</th>
									<td>
										<input type="file" id="flie01" name="flie01" class="blind">
										<label for="flie01" class="btn">사진등록</label>
										<button type="button" class="btn">인증 승인</button>
										<button type="button" class="btn ml15">인증반려</button>
									</td>
								</tr>
								<tr>
									<th scope="row">2차 광고 인증</th>
									<td>
										<input type="file" id="flie02" name="flie02" class="blind">
										<label for="flie01" class="btn">사진등록</label>
										<button type="button" class="btn">인증 승인</button>
										<button type="button" class="btn ml15">인증반려</button>
										<div class="pic84 mt20">
											<img src="http://placehold.it/95x85?text=sample" alt="2차광고 이미지01">
											<img src="http://placehold.it/95x85?text=sample" alt="2차광고 이미지02">
											<button class="btn ml15" type="button">저장</button>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>인증반려</h4>
						</div>
						<table class="detail mt20">
							<caption>인증 반려</caption>
							<colgroup>
								<col style="width:80%;">
								<col style="*">
							</colgroup>
							<thead class="blind">
								<th scope="col">문제사유</th>
								<th scope="col">날짜</th>
							</thead>
							<tbody>
								<tr>
									<td colspan="2">
										<input type="text" id="con_f" name="con_f" placeholder="사유입력" style="width:80%">
										<label for="con_f" class="blind">사유입력</label>
										<button type="button" class="btn">저장</button>
									</td>
								</tr>
								<tr>
									<td>[1차]사진이 부실합니다.</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>[2차]사진이 부실합니다.</td>
									<td>yy.mm.dd</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>인쇄 관리</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td>
										<select name="" id="">
											<option value="">디자인검수</option>
											<option value=""></option>
											<option value=""></option>
										</select>
										<button class="btn" type="button">저장</button>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="detail">
							<caption>변경내역,등록일</caption>
							<colgroup>
								<col style="width:60%;">
								<col style="*">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">변경내역</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>변경이력이 없습니다</td>
									<td></td>
								</tr>
								<tr>
									<td>디자인 검수</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>발주취소</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>
										<p>디자인 수정</p>
										<p>-첨부파일 : <a href="#" class="txt_blue" download>수정사항.pdf</a></p>
									</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>홍보물 제작중</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>홍보물 제작완료</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>
										<p>배송 처리</p>
										<p>-배송정보:로젠 택배 121212321)</p>
										<p>거래명세서 : <a href="#" class="txt_blue" download>명세서.pdf</a></p>
									</td>
									<td>yy.mm.dd</td>
								</tr>
							</tbody>
						</table>
						<div class="copy_mgm mt20 on">
							<div>
								<select name="design_con" id="design_con">
									<option value="">디자인 검수</option>
									<option value="">디자인 검수</option>
								</select>
							</div>
							<div>
								<div>
									<select name="design_rep" id="design_rep">
										<option value="">디자인 수정</option>
										<option value="">디자인 수정</option>
									</select>
								</div>
								<div>
									<input type="text" id="file_name" name="file_name">
									<label for="file_name" class="blind">파일명</label>
									<input type="file" id="file_up01" name="file_up01" class="blind">
									<label for="file_up01" class="btn">파일찾기</label>
								</div>
							</div>
							<div>
								<select name="bnr_make" id="bnr_make">
									<option value="">홍보물 제작 중</option>
									<option value="">홍보물 제작 중</option>
								</select>
							</div>
							<div>
								<select name="bnr_fin" id="bnr_fin">
									<option value="">홍보물 제작 완료</option>
									<option value="">홍보물 제작 완료</option>
								</select>
							</div>
							<div>
								<div>
									<select name="del_str" id="del_str">
										<option value="">배송처리</option>
										<option value="">배송처리</option>
									</select>
								</div>
								<div>
									<span class="bdr">택배사</span>
									<input type="text" id="del_num" name="del_num" placeholder="운송장정보입력">
									<label for="del_num" class="blind">운송장정보 입력</label>
								</div>
								<div>
									<input type="text" id="file_name2" name="file_name2">
									<label for="file_name2" class="blind">거래명세서</label>
									<input type="file" id="file_up02" name="file_up02" class="blind">
									<label for="file_up02" class="btn">파일찾기</label>
								</div>
							</div>
						</div>

					</div>
					<div class="btn_area align_r mt20">
						<a class="btn" href="sale_box_pop.jsp" onclick="return popup_layer(this);">진행내역보기</a>
						<a href="#" class="btn" target="_blank">채팅문의 내역</a>
						<a href="activity_member.jsp" class="btn">목록</a>
					</div>
		</div>
				

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
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
