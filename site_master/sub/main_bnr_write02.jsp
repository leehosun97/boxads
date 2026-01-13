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
                <h3>메인 배너</h3>
            </div>
            <div class="view">
				<div class="table_wrap">
					<table class="detail mt20">
						<caption>메인 베너 상세</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="*">
						</colgroup>
						<tbody>
						<tr>
							<th scope="row">제목</th>
							<td>
							  <input type="text" id="title" name="title" placeholder="입력된 제목이 표시됩니다." style="width:80%">
							  <label for="title" class="blind" >제목</label>
							</td>
						</tr>
						<tr>
							<th scope="row">노출상태</th>
							<td>
								<input type="radio" id="open_y" name="open">
								<label for="open_y">노출</label>
								<input type="radio" id="open_n" name="open">
								<label for="open_n">미노출</label>
							</td>
						</tr>
						<tr>
							<th scope="row">등록자</th>
							<td>
								홍길동
							</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td>
								0000-00-00 00:00:00
							</td>
						</tr>
						<tr>
							<th scope="row">노출기간</th>
							<td>
								<input type="text" title="시작일" id="datepicker1" placeholder="YYYY-MM-DD" class="ico_date">
								<select name="" id="time01">
									<option value="">12시</option>
								</select>
								<span class="mlr15">~</span>
								<input type="text" title="종료일" id="datepicker2" placeholder="YYYY-MM-DD" class="ico_date">
								<select name="" id="time02">
									<option value="">12시</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">pc 이미지</th>
							<td>
								<div>
									<input type="text" id="file_name01" name="file_name01">
									<input type="file" id="file_up01" name="file_up01" class="blind">
									<label for="file_up01" class="btn v_ab">찾아보기</label>
									<span>(파일형식 : jpg,jpge, bmp, gif / 사이즈 : 000*0000 / 파일용량 : 5mb 이하)</span>
								</div>
								<div class="mt20">
									<img src="http://placehold.it/600x300/">
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">모바일 이미지</th>
							<td>
								<div>
									<input type="text" id="file_name02" name="file_name02">
									<input type="file" id="file_up02" name="file_up02" class="blind">
									<label for="file_up02" class="btn v_ab">찾아보기</label>
									<span>(파일형식 : jpg,jpge, bmp, gif / 사이즈 : 000*0000 / 파일용량 : 5mb 이하)</span>
								</div>
								<div class="mt20">
									<img src="http://placehold.it/600x300/">
								</div>
							</td>
						</tr>
						<tr>
							<th>링크URL <span class="txt_red"> * </span></th>
							<td>
								<input type="text" id="link_url" name="link_url" style="width:80%">
								<label for="link_url" class="blind">링크</label>
								<select name="" id="time02">
									<option value="">현재창</option>
									<option value="">새창</option>
									<option value="">링크없음</option>
								</select>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
                <div class="btn_area align_r mt20">
                    <a href="main_bnr_list.jsp" class="btn">목록</a>
                    <button type="button" class="btn">수정</button>    
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(5).addClass("on");
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
