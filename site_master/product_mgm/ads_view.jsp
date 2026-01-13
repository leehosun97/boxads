<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>상품관리</span></h2>
				<ul class="menu">
					<li class="btn_sub on">
						<a href="#">박스</a>
					</li>
					<li class="btn_sub">
						<a href="#">애드</a>
					</li>
				</ul>
			</aside>
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>애드</h3>
            </div>
			<div class="view">
				<div class="table_wrap">
					<table class="detail mt20">
						<caption>박스 상세</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">광고 명
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보하려는 브랜드, 제품, 서비스명을 넣어 입력해주세요.
									</span>
								</span>
							</th>
							<td>
							  <input type="text" id="title" name="title" style="width:90%" placeholder="">
							  <label for="title" class="blind">광고 명</label>
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리
								<span class="tooltip_icon">
									<span class="tooltiptext">
										쇼핑몰 구매 고객 중 희망하는 제품 카테고리를 최대 5개까지 선택가능합니다.
									</span>
								</span>
							</th>
							<td>
								<select name="cate01" title="대분류 선택">
									<option value="">대분류 선택</option>
									
								</select>
								<select name="cate02" id="kwd01" title="중분류 선택">
									<option value="">중분류 선택</option>
									
								</select>
								<div class="selected">
									<span class="txt">패션의류 &gt; 상의<button type="button" class="btn_del">삭제</button></span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 연령
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟 고객의 연령대를 선택해주세요. 중복선택 가능합니다.
									</span>
								</span>
							</th>
							<td>
								<select name="old" title="타겟 연령">
									<option value="">선택하세요</option>
									<option value="">14세~24세</option>
									<option value="">25세~34세</option>
									<option value="">35세~44세</option>
									<option value="">45세~54세</option>
									<option value="">55세~64세</option>
									<option value="">65세~</option>
								</select>
							
								<div class="selected">
									<span class="txt">14세~24세<button type="button" class="btn_del">삭제</button></span>
									<span class="txt">25세~34세<button type="button" class="btn_del">삭제</button></span>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 성별
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟 고객의 성별을 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<select name="old" title="홍보 타겟 고객 성별 선택">
									<option value="">선택하세요</option>
									<option value="">주로 여성 </option>
									<option value="">주로 남성 </option>
									<option value="">모든 성별 </option>
								</select>
							
								
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 타겟을 개인과 기업 중 하나 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<select name="type01" id="type01" title="타겟 유형 선택">
									<option value="">선택하세요</option>
									<option value="">개인고객</option>
									<option value="">기업고객</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">광고 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보물 유형을 선택해주세요. 희망하는 홍보물을 전국에 배포하여 신규 고객을 확보할 수 있습니다.
									</span>
								</span>
							</th>
							<td>
								<select name="cnt" id="cnt">
									<option value="">선택하세요</option>
									<option value="">전단지 A4</option>
									<option value="">전단지 B5</option>
									<option value="">전단지 쿠폰</option>
									<option value="">스티커 중</option>
									<option value="">스티커 소</option>
									<option value="">샘플 중</option>
									<option value="">샘플 소</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">홍보 웹페이지 주소
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보웹페이지 주소는 QR 코드로 변환하여 홍보물에 인쇄 후 타겟 고객에게 노출됩니다. 정확한 주소를 입력해주세요. (단, 샘플 광고는 광고주가 샘플을 직접 제작 후 배송하기에 QR코드 사용이 필수가 아닙니다
									</span>
								</span>
							</th>
							<td class="qr_wrap">
								<div class="qr_area">
									
										<input type="text" name="site_url" id="site_url"  required placeholder="https://, http://를 포함하여 입력해주세요." title="홍보 웹페이지 주소" style="width:90%">
									
									
									<button type="button" class="btn_qrcode" style="background-image:url(../images/sub/qr_icon.png);">QR 보기</button>
									<div class="popup_qrcode">
										<div class="head_title">
											QR 코드
											<a href="javascript:;" class="btn_close">닫기</a>
										</div>
										<div class="qrcode_box">
											<img src="../images/sub/qr_code.png" alt="">
										</div>
										
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">광고 기간
								<span class="tooltip_icon">
									<span class="tooltiptext">
										회사에서 계획한 홍보 시작일과 종료일을 선택해주세요. 박스애드 마켓에 애드 상품을 노출하는 기간과 다른 설정이니 주의하세요.
									</span>
								</span>
							</th>
							<td>
								<input type="text" title="발행기간1" placeholder="YYYY-MM-DD" class="ico_date hasDatepicker" id="datepicker1">
								<span class="mlr15">~</span>
								<input type="text" title="발행기간_1" placeholder="YYYY-MM-DD" class="ico_date hasDatepicker" id="datepicker2">
							</td>

						</tr>
						<tr>
							<th scope="row">상품 소개
								<span class="tooltip_icon">
									<span class="tooltiptext">
										홍보 브랜드, 제품, 서비스의 간단한 소개를 100자 이내로 입력해주세요.
									</span>
								</span>
							</th>
							<td>
								<input type="text" name="pr" title="상품소개" style="width:90%;">
							</td>
						</tr>
					
						
						<tr>
							<th scope="row">광고이미지</th>
							<td>
								<div class="file_area">
									<div class="img_type03 pj2">
										<input type="file" id="file_type03" class="blind">
										<label for="file_type03" class="btn_file">파일찾기</label>
									</div>
									<div class="btn" type="button">이미지 수정요청</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="광고이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img01"><label for="img01">앞면 <span>이미지</span></label>
										<span class="idate">19.06.06</span>
									</div>
								</div>	
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="광고이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img02"><label for="img02">앞면 <span>이미지</span></label>
										<span class="idate">19.06.06</span>
									</div>
								</div>	
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="광고이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img03"><label for="img03">앞면 <span>이미지</span></label>
										<span class="idate">19.06.06</span>
									</div>
								</div>	
							</td>
						</tr>
						<tr>
							<th scope="col" colspan="2">상품 상세</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea name="editor" > 에디터 영역 </textarea>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<p class="tit mt20">광고 설정</p>
				<table class="detail mt10">
					<caption>결과</caption>
					<colgroup>
						<col style="width:15%">
						<col style="*">
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">판매여부</th>
						<td>
							<input type="radio" name="sell_check" id="sell_check01"><label for="sell_check01">광고 대기</label>
							<input type="radio" name="sell_check" id="sell_check02"><label for="sell_check02">광고 중</label>
							<input type="radio" name="sell_check" id="sell_check03"><label for="sell_check03">일시 중지</label>
							<input type="radio" name="sell_check" id="sell_check04"><label for="sell_check04">광고 종료</label>
						</td>
					</tr>
				</tbody>
			</table>
			 <div class="btn_area align_r mt20">
				<a href="#" class="btn">목록</a>
				<button class="btn" type="button">저장</button>
				<button class="btn" type="button">취소</button>
			</div>
			<div class="ing_list_wrap end wide">
				<ul>
					<li>
						<div class="desc_area">
							<p class="tit">일시 중지</p>
							<p>재고물량이 부족하여 판매를 일시 중지합니다</p>
						</div>
						<div class="act_tit">
							<span class="stdate">19. 10. 23  10:35:00</span>
						</div>
					</li>
					<li>
						<div class="desc_area">
							<p class="tit">판매 종료</p>
							<p>또 재고물량이 바닥이 나서 판매를 일시 중지합니다.</p>
						</div>
						<div class="act_tit">
							<span class="stdate">19. 10. 23  10:35:00</span>
						</div>
					</li>
				</ul>
			</div>
               
            </div>

   
        </div><!-- content -->
    </div>
</div>
</body>
<script>
	$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
	$('#gnb ul li').eq(2).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});

		/*qr code  오픈 */
	$('.qr_area  .btn_qrcode').on('click',function(){
		$('.qr_area  .popup_qrcode').addClass('open');
	});
	/*qr code  닫기 */
	$('.popup_qrcode  .btn_close').on('click',function(){
		$('.qr_area  .popup_qrcode').removeClass('open');
	});
</script>
</html>
