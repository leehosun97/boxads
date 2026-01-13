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
							<td colspan="3">
							  입력된 제목이 표시됩니다.
							</td>
						</tr>
						<tr>
							<th scope="row">노출상태</th>
							<td colspan="3">
								노출
							</td>
						</tr>
						<tr>
							<th scope="row">등록자</th>
							<td colspan="3">
								홍길동
							</td>
						</tr>
						<tr>
							<th scope="row">등록일</th>
							<td colspan="3">
								0000-00-00 00:00:00
							</td>
						</tr>
						<tr>
							<th scope="row">노출기간</th>
							<td colspan="3">
								0000-00-00 00:00:00
							</td>
						</tr>
						<tr>
							<th scope="row">pc 이미지</th>
							<td colspan="3">
								<img src="http://placehold.it/600x300/">
							</td>
						</tr>
						<tr>
							<th scope="row">모바일 이미지</th>
							<td colspan="3">
								<img src="http://placehold.it/600x300/">
							</td>
						</tr>
						</tbody>
					</table>
				</div>
                <div class="btn_area align_r mt20">
                    <a href="main_bnr_list.jsp" class="btn">목록</a>
                    <button type="button" class="btn">삭제</button>
                    <a href="main_bnr_write02.jsp" class="btn">수정</a>      
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
