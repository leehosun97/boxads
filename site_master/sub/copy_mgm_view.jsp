<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
	<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>인쇄관리</h3>
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
							<th scope="row">주문번호</th>
							<td colspan="3">
								0000000
							</td>
						</tr>
						<tr>
							<th scope="row">발주일자</th>
							<td colspan="3">
								yyyy.mm.dd
							</td>
						</tr>
						<tr>
							<th scope="row">광고유형</th>
							<td colspan="3">
								전단지 A4
							</td>
						</tr>
						<tr>
							<th scope="row">인쇄수량 (박스 수)</th>
							<td colspan="3">
								45,000원
							</td>
						</tr>
						<tr>
							<th scope="row">양면/단면</th>
							<td colspan="3">
								단면
							</td>
						</tr>
						<tr>
							<th scope="row">판매 월</th>
							<td colspan="3">
								yyyy.mm.dd
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
							<th scope="row">홍보 담당자명</th>
							<td colspan="3">
								홍길동
							</td>
						</tr>
						<tr>
							<th scope="row">홍보 담당자 연락처</th>
							<td colspan="3">
								010-5589-95520
							</td>
						</tr>
						<tr>
							<th scope="row">홍보물 수령주소</th>
							<td colspan="3">
								서울시 강남구 신사동000
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
								패션의류 > 여성잡화.뷰티잡화. ? 신발.디지털.가전 > 카메라.식품 > 가공식품.도서.문구.티켓 > 도서
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
							<th scope="row">광고주 정보</th>
							<td colspan="3">
								업체명
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
						<h4>애드 관련 이미지</h4>
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
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
							<div>
								<img src="http://placehold.it/95x85?text=sample">
								<p>2019.06.03</p>
								<span></span>
							</div>
						</div>
						<div class="img_r">
							<div>
								<img src="http://placehold.it/85x85?text=QR코드" alt="QR코드">
								<p><a href="#"  class="txt_blue" download>QR 다운로드</a></p>
								<p><a href="#"  class="txt_blue" download>이미지 다운로드</a></p>
							</div>
						</div>
					</div>
					<div class="mt20" style="font-size: 18px;">
						<span class="txt_blue">단축URL : </span><a href="https://www.daum.net:000">https://www.daum.net:000</a>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>인쇄 관리</h4>
						</div>
						<table class="detail mt20">
							<caption></caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상태변경</th>
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
									<td>신규발주</td>
									<td>yy.mm.dd</td>
								</tr>
								<tr>
									<td>디자인검수</td>
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
									<input type="text" id="del_num" name="del_num" placeholder="운송장정보 입력">
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
						<a href="#" class="btn" target="_blank">박스애드 바로가기</a>
						<a href="copy_mgm_list.jsp" class="btn">목록</a>
					</div>
				</div>
				

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$("#gnb").find("li").eq(9).addClass("on");
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
