<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
			<aside id="lnb">
				<h2 class="tit"><span>사이트 관리</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">활동회원</a>
					</li>
					<li class="btn_sub">
						<a href="#">휴면 회원</a>
					</li>
					<li class="btn_sub">
						<a href="#">탈퇴 회원</a>
					</li>
					<li class="btn_sub">
						<a href="#">메세지 관리</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>휴면 회원</h3>
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
                        <th scope="row">키워드</th>
                        <td>
                            <select style="width:100px;">
                                <option>업체명</option>
                                <option>이메일</option>
								<option>전화번호</option>
                            </select>
							<input type="text" id="keywd" name="keywd">
							<label for="keywd" class="blind">키워드</label>
                        </td>
						<th scope="row">이메일</th>
                        <td></td>						
                    </tr>
                    <tr>
						<th scope="row">기간</th>
                    <td>
						<input type="text" title="시작일" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date">
						<span class="hypen">~</span>
						<input type="text" title="종료일" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date">
					</td>
                    <th scope="row"></th>
					<td>
					</td>
                    </tr>
                    </tbody>
                </table>
                 <div class="btn_area align_c mt20">
                    <button type="button" class="btn btn_search">검색</button>
                </div>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span class="txt_red">2</span>건 <button type="button" class="btn btn_excel">엑셀다운로드</button></p>
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:7%">
                            <col style="width:15%">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="width:15%;">
                            <col style="*">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">업체 명</th>
                            <th scope="col">이메일</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">가입일자</th>
                            <th scope="col">휴먼처리일시</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10</td>
                                <td>스튜디어엑스</td>
                                <td>gir@naver.com</td>
                                <td>00-000-000</td>
                                <td>YYYY-MM-DD</td>
                                <td>YYYY-MM-DD 15:00:00</td>
                            </tr>
							<tr>
                                <td>10</td>
                                <td>홍길동</td>
                                <td>gir@naver.com</td>
                                <td>00-000-000</td>
                                <td>YYYY-MM-DD</td>
                                <td>YYYY-MM-DD 15:00:00</td>
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

		$('#lnb ul.menu > li').eq(1).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
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
