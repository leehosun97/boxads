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
                <h3>박스</h3>
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
							<th scope="row">박스 명
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품의 브랜드, 제품명을 넣어 입력해주새요.
									</span>
								</span>
							</th>
							<td>
							  <input type="text" id="title" name="title" style="width:90%" placeholder="">
							  <label for="title" class="blind">제목</label>
							</td>
						</tr>
						<tr>
							<th scope="row">카테고리
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매 제품의 카테고리를 대분류>중분류로 선택해주세요.
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
							<th scope="row">고객연령
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 고객 연령대를 선택해주세요. 중복선택 가능합니다.
									</span>
								</span>
							</th>
							<td>
								<select name="old" title="고객연령">
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
							<th scope="row">고객 성별
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 고객 성별을 선택해주세요. 
									</span>
								</span>
							</th>
							<td>
								<select name="old" title="고객 성별">
									<option value="">선택하세요</option>
									<option value="">주로 여성 </option>
									<option value="">주로 남성 </option>
									<option value="">모든 성별 </option>
								</select>
							
								
							</td>
						</tr>
						<tr>
							<th scope="row">고객 유형
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품의 주 구매 고객을 개인과 기업 중 하나 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<select name="type01" id="type01" title="주 구매 고객 선택">
									<option value="">선택하세요</option>
									<option value="">개인고객</option>
									<option value="">기업고객</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">평균주문금액
								<span class="tooltip_icon">
									<span class="tooltiptext">
										제품 구매 고객 1명당 평균 주문 금액대를 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<select name="ave_amount" id="ave_amount" title="평균주문금액 선택">
									<option value="">선택하세요</option>
									<option value="">0~25,000원</option>
									<option value="">25,000~50,000원</option>
									<option value="">50,000~100,000원</option>
									<option value="">100,000~500,000원</option>
									<option value="">500,000~ </option>
								</select>
							</td>

						</tr>
						<tr>
							<th scope="row">상품 웹페이지 주소
								<span class="tooltip_icon">
									<span class="tooltiptext">
										실제 쇼핑몰에서 판매중인 상품의 웹페이지 주소를 입력해주세요.<br> 광고주의 박스 상품 선택 시 많은 참고가 됩니다.
									</span>
								</span>
							</th>
							<td>
							  <input type="text" id="title" name="title" style="width:90%" placeholder="">
							  <label for="title" class="blind">상품 웹페이지 주소</label>
							</td>

						</tr>
						<tr>
							<th scope="row">판매 월(광고시작 월)
								<span class="tooltip_icon">
									<span class="tooltiptext">
										판매월은 광고주의 홍보물을 택배상자에 동봉하여 배포하는 광고 진행 월을 뜻합니다. <br>광고가 진행 될 박스상품 판매월을 선택해주세요.
									</span>
								</span>
							</th>
							<td>
								<input type="radio" name="sale_start" id="sale_start01"><label for="sale_start01">2019년 9월</label>
								<input type="radio" name="sale_start" id="sale_start02"><label for="sale_start02">2019년 10월</label>
								<input type="radio" name="sale_start" id="sale_start03"><label for="sale_start03">2019년 11월</label>
							</td>
						</tr>
						<tr>
							<th scope="row">상품 소개
								<span class="tooltip_icon">
									<span class="tooltiptext">
										간단한 상품소개를 100자 이내로 입력해주세요.
									</span>
								</span>
							</th>
							<td>
								<input type="text" name="pr" title="상품소개" style="width:90%;">
							</td>
						</tr>
						<tr>
							<th scope="row">광고 유형</th>
							<td>
								전단지 A4
							</td>
						</tr>
						<tr>
							<th scope="row">판매상품 수량</th>
							<td>
								0,000
							</td>
						</tr>
						<tr>
							<th scope="row">광고단가</th>
							<td>
								2,5000원
							</td>
						</tr>
						<tr>
							<th scope="row">상품이미지</th>
							<td>
								<div class="file_area">
									<div class="img_type03 pj2">
										<input type="file" id="file_type03" class="blind">
										<label for="file_type03" class="btn_file">파일찾기</label>
									</div>
									
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="상품이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img01"><label for="img01">대표 <span>이미지</span></label>
										<span class="idate">19.06.06</span>
									</div>
								</div>	
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="상품이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img02"><label for="img02">대표 <span>이미지</span></label>
										<span class="idate">19.06.06</span>
									</div>
								</div>	
								<div class="img_box_s">
									<img src="../images/sub/img_sample.jpg" alt="상품이미지">
									<button type="button">삭제</button>
									<div class="selbox">
										<input type="radio" name="sel_img" id="img03"><label for="img03">대표 <span>이미지</span></label>
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
				<p class="tit mt20">판매 설정</p>
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
							<input type="radio" name="sell_check" id="sell_check01"><label for="sell_check01">판매 대기</label>
							<input type="radio" name="sell_check" id="sell_check02"><label for="sell_check02">판매 중</label>
							<input type="radio" name="sell_check" id="sell_check03"><label for="sell_check03">일시 중지</label>
							<input type="radio" name="sell_check" id="sell_check04"><label for="sell_check04">판매 종료</label>
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
