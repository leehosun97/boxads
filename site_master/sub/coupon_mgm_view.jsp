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
							<th scope="row">제목</th>
							<td>
							  <input type="text" id="title" name="title" style="width:90%">
							  <label for="title" class="blind">제목</label>
							</td>
						</tr>
						<tr>
							<th scope="row">설명</th>
							<td>
								<input type="text" id="exp" name="exp" style="width:90%">
							  <label for="exp" class="blind">설명</label>
							</td>
						</tr>
						<tr>
							<th scope="row">공급가액</th>
							<td>
								<input type="text" id="disc" name="disc">
								 <label for="disc" class="blind">할인금액</label>
							</td>
						</tr>
						<tr>
							<th scope="row">적용일자</th>
							<td>
								<input type="text" title="행사기간" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker1">
								<span class="mlr15">~</span>
								<input type="text" title="행사기간_1" placeholder="YYYY-MM-DD" class="ico_date" id="datepicker2">
							</td>
						</tr>
						<tr>
							<th scope="row">상태</th>
							<td>
								<input type="checkbox" id="use" name="use">
								<label for="use">사용</label>
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
