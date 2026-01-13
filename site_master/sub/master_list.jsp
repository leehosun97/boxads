<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
			<aside id="lnb">
				<h2 class="tit"><span>설정</span></h2>
				<ul class="menu">
					<li class="btn_sub">
						<a href="#">운영자 관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">코드관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">단가관리</a>
					</li>
					<li class="btn_sub">
						<a href="#">수수료 관리</a>
					</li>
				</ul>
			</aside>
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>운영자관리</h3>
				<a href="#" class="btn btn_add"><span>등록</span></a>
            </div>
            <div class="list">
			<div class="tit02"><h4>운영자 관리</h4></div>
                <table class="search mt20">
                    <caption>검색</caption>
                    <colgroup>
                        <col style="width:14%;">
                        <col>
                        <col style="width:14%;">
                        <col>
                    </colgroup>
                    <tbody>
					<tr>
                        <th scope="row">담당자 명</th>
                        <td>
							<input type="text" id="d_name" name="d_name">
							<label for="d_name" class="blind">담당자 명</label>
                        </td>
						<th scope="row">아이디</th>
                        <td>
							<input type="text" id="u_id" name="u_id">
							<label for="u_id" class="blind">아이디</label>
                        </td>						
                    </tr>
                    </tbody>
                </table>
                 <div class="btn_area align_c mt20">
                    <button type="button" class="btn btn_search">검색</button>
                </div>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">총 <span class="txt_red">00</span>건</p>
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:7%">
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">아이디</th>
                            <th scope="col">소속</th>
                            <th scope="col">성명</th>
                            <th scope="col">그룹</th>
                            <th scope="col">가입일자</th>
                            <th scope="col">최근방문일시</th>
                            <th scope="col">상태</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10</td>
                                <td><a href="activity_member_view.jsp">gri234343</a></td>
                                <td><a href="activity_member_view.jsp">소속 부서명</a></td>
                                <td><a href="activity_member_view.jsp">홍길동</a></td>
                                <td>권한그룹명</td>
								<td>Yymmdd</td>
								<td>Yymmdd 10:00:00</td>
								<td>정상</td>
                            </tr>
							<tr>
                                <td>10</td>
                                <td><a href="activity_member_view.jsp">gri234343</a></td>
                                <td><a href="activity_member_view.jsp">소속 부서명</a></td>
                                <td><a href="activity_member_view.jsp">홍길동</a></td>
                                <td>권한그룹명</td>
								<td>Yymmdd</td>
								<td>Yymmdd 10:00:00</td>
								<td>정지</td>
                            </tr>
						</tbody>
                    </table>
                    
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
						 <a href="#" class="btn btn_search">등록</a>
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
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(1).addClass('on');
	$('#gnb ul li').eq(6).addClass('on');

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
