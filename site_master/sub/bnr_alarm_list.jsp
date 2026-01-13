<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
			<aside id="lnb">
				<h2 class="tit"><span>사이트 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">공지사항</a>
					</li>
					<li class="btn_sub">
						<a href="#">FAQ</a>
					</li>
					<li class="btn_sub">
						<a href="#">문의 관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">메인 배너</a>
					</li>
					<li class="btn_sub">
						<a href="#">알림 관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">약관 관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">취소 / 환불 정책</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>알림 관리</h3>
				<a href="#" class="btn btn_add"><span>등록</span></a>
            </div>
            <div class="list">
                <table class="search">
                    <caption>검색</caption>
                    <colgroup>
                        <col style="width:14%;">
                        <col>
                        <col style="width:14%;">
                        <col>
                    </colgroup>
                    <tbody><tr>
                        <th scope="row">노출상태</th>
                        <td>
                            <select style="width:200px;" class="align_c">
                                <option>전체</option>
                                <option>노출</option>
								<option>비노출</option>
                            </select>
                        </td>
						<th scope="row">기간</th>
						<td>
						<input type="text" title="시작일" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date">
						<span class="hypen">~</span>
						<input type="text" title="종료일" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date">
						<!--<button class="month on">1개월</button>
						<button class="month">3개월</button>
						<button class="month">6개월</button>-->
					</td>						
                    </tr>
                    <tr>
						<th scope="row">키워드</th>
						<td colspan="3">
							 <select style="width:200px;" class="align_c">
                                <option>전체</option>
                                <option>제목</option>
								<option>등록자</option>
                            </select>
							<input type="text" id="kwd" name="kwd" style="vertical-align: initial;width:60%">
							<label for="kwd" class="blind">키워드</label>
						</td>
                    </tr>
                    </tbody>
                </table>
                 <div class="btn_area align_c mt20">
                    <button type="button" class="btn btn_search">검색</button>
                </div>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span>0,000</span>건</p>
                    </div>
				<div class="table_wrap">
						<table class="search_list">
							<caption>검색결과</caption>
							<colgroup>
								<col style="width:7%">
								<col style="*">
								<col style="width:15%;">
								<col style="width:15%;">
								<col style="width:20%">
								<col style="width:10%;">
							</colgroup>
							<thead>
							<tr>
								<th scope="col">선택</th>
								<th scope="col">제목</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일</th>
								<th scope="col">노출기간</th>
								<th scope="col">노출상태</th>
							</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td class="ewwe"><a href="bnr_alarm_view.jsp">알림/배너 제목이 표기됩니다</a></td>
									<td>홍길동</td>
									<td>00-000-000</td>
									<td>YYYY-MM-DD~YYYY-MM-DD</td>
									<td>미노출</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td class="ewwe"><a href="bnr_alarm_view.jsp">알림/배너 제목이 표기됩니다</a></td>
									<td>홍길동</td>
									<td>00-000-000</td>
									<td>YYYY-MM-DD~YYYY-MM-DD</td>
									<td>노출</td>
								</tr>
							</tbody>
						</table>
					</div>
                    <div class="pagination mt0">
                        <a href="#" class="prev">이전 페이지</a>
                        <a href="#" class="on">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">99</a>
                        <a href="#" class="next">다음 페이지</a>
                    </div>
					<div class="btn_area align_r">
						<a href="bnr_alarm_write01.jsp" class="btn">등록</a>
					</div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
	</div>
</div>
<script>
  $.datepicker.setDefaults({
    dateFormat: 'yy-mm',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
  });

  $(function() {
    $("#datepicker1, #datepicker2").datepicker();
  });

	$('#lnb ul.menu > li').eq(4).find(' > a ').addClass('skin_bg');
	$('#gnb ul li').eq(5).addClass('on');

	$('.calendar_box .date_t a').on('click',function(){
		$('.calendar_box .date_t a').removeClass('on');
		$(this).addClass('on');
	});
	$('.rental_content .rental_tab .btn').on('click',function(){
		$('.rental_content .rental_tab .btn').removeClass('on');
		$(this).addClass('on');
	});
</script>
</body>
</html>
