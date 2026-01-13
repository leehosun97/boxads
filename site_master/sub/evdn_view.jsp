<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>정산 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">정산관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">결제(충전)관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">출금관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">증빙자료 관리</a>
					</li>
				</ul>
			</aside>
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>증빙자료 관리</h3>
            </div>
            <div class="view">
				<div class="table_wrap">
					<div class="tit02 mt20">
						<h4>사업자정보</h4>
					</div>
					<table class="detail mt20">
						<caption>증빙자료 관리 리스트</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">발행구분</th>
							<td colspan="3">
							  매출(캐시충전)
							</td>
						</tr>
						<tr>
							<th scope="row">증빙유형</th>
							<td colspan="3">
								세금계산서
							</td>
						</tr>
						<tr>
							<th scope="row">공급가액</th>
							<td colspan="3">
								1,000,000원
							</td>
						</tr>
						<tr>
							<th scope="row">세액</th>
							<td colspan="3">
								100,000원
							</td>
						</tr>
						<tr>
							<th scope="row">Total</th>
							<td colspan="3">
								1,100,000원
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="table_wrap">
					<div class="tit02 mt20">
						<h4>사업자정보</h4>
					</div>
					<table class="detail mt20">
						<caption>사업자정보 리스트</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">업체명</th>
							<td colspan="3">
							  (주)스튜디오 엑스
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 등록번호</th>
							<td colspan="3">
								1,000,000원
							</td>
						</tr>
						<tr>
							<th scope="row">업종/업태</th>
							<td colspan="3">
								100,000원
							</td>
						</tr>
						<tr>
							<th scope="row">대표자명</th>
							<td colspan="3">
								1,100,000원
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 주소</th>
							<td colspan="3">
								도소매/소매업
							</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td colspan="3">
								소프트웨어개발
							</td>
						</tr>
						<tr>
							<th scope="row">Email(세금계산서 수취)</th>
							<td colspan="3">
								sazita@daum.net
							</td>
						</tr>
						<tr>
							<th scope="row">기업형태</th>
							<td colspan="3">
								일반
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 등록증</th>
							<td colspan="3">
								<a href="#" download>사업자 등록증.jpg</a>
							</td>
						</tr>
						<tr>
							<th scope="row">사업자 주소</th>
							<td colspan="3">
								<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
								<button class="btn" type="button">발행</button>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
				<div class="tit02 mt20">
					<h4>발행 내역</h4>
				</div>
				<div class="txt_are mt20">세금계산서 발행 <span class="fl_r">yy.mm.dd 10:00:00</span></div>
				<div class="txt_are">세금계산서 발행 <span class="fl_r">yy.mm.dd 10:00:00</span></div>
                <div class="btn_area align_r mt20">
                    <a href="withdraw_list.jsp" class="btn">목록</a>      
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(3).addClass("on");
		$('#lnb ul.menu > li').eq(3).find(' > a ').addClass('skin_bg');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
    });
</script>
</html>
