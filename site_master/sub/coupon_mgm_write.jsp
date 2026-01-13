<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<aside id="lnb">
				<h2 class="tit"><span>부가기능관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">쿠폰관리</a>
					</li>
				</ul>
			</aside>
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>쿠폰 발급관리</h3>
            </div>
            <div class="view">
				<div class="table_wrap">
					<table class="detail mt20">
						<caption>쿠폰 발급관리 리스트</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">쿠폰 명</th>
							<td>
							  <input type="text" id="cou_name" name="cou_name" style="width:90%">
							  <label for="cou_name" class="blind">쿠폰명</label>
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰 혜택</th>
							<td>
								<input type="text" id="cou_bl" name="cou_bl" style="width:90%">
							  <label for="cou_bl" class="blind">쿠폰 혜택</label>
							</td>
						</tr>
						<tr>
							<th scope="row">할인금액</th>
							<td>
								<input type="text" id="disc" name="disc">
								 <label for="disc" class="blind">할인금액</label>
							</td>
						</tr>
						<tr>
							<th scope="row">발행기간</th>
							<td>
								<input type="text" title="발행기간1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
								<span class="mlr15">~</span>
								<input type="text" title="발행기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
							</td>
						</tr>
						<tr>
							<th scope="row">유효기간</th>
							<td>
								<input type="text" title="유효기간1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker3">
								<span class="mlr15">~</span>
								<input type="text" title="유효기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker4">
							</td>
						</tr>
						<tr>
							<th scope="row">타겟 대상</th>
							<td>
								<input type="radio" id="new_sign" name="taget">
								<label for="new_sign">신규가입</label>
								<input type="radio" id="fst_pay" name="taget">
								<label for="fst_pay">첫 구매 고객</label>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
                <div class="btn_area align_r mt20">
					<button class="btn" type="button">저장</button>
					<button class="btn" type="button">취소</button>    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(4).addClass("on");
		$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg');

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
