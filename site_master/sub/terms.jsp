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
                <h3>약관 관리</h3>
            </div>
            <div class="view">
				<ul class="s_lnb s_lnb_02">
					<li class="on"><a href="#">이용약관</a></li>
					<li><a href="#">개인정보 처리방침</a></li>
				</ul>
				<div id="smartEditor" class="mt50">
					에디터영역입니다
				</div>
				<div class="pd15">
					입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다
					입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다
					입력된내용이 표시됩니다입력된내용이 표시됩니다
					입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다입력된내용이 표시됩니다
				</div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(5).addClass("on");
		$('#lnb ul.menu > li').eq(5).find(' > a ').addClass('skin_bg');

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
