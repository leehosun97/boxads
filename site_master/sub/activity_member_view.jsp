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
                <h3>회원리스트</h3>
            </div>
            <div class="view">
			 <div class="fl type01">
              <div class="table_wrap">
				<table class="detail mt20">
                    <caption>게시글 상세</caption>
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:35%;">
                        <col style="width:15%;">
                        <col style="width:35%;">
                    </colgroup>
                    <tbody>
					<tr>
                        <th scope="row">비밀번호</th>
                        <td colspan="3">
							*********** <button type="button" class="btn">비밀번호 초기화</button>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">사업자 주소</th>
                        <td colspan="3">
                            [123]00시000구000동0000000000000
                        </td>
                    </tr>
					<tr>
                        <th scope="row">기업형태</th>
                        <td colspan="3">
                            법인
                        </td>
                    </tr>
					<tr>
                        <th scope="row">홈페이지</th>
                        <td colspan="3">
                            http:www.naver.com
                        </td>
                    </tr>
					<tr>
                        <th scope="row">소개</th>
                        <td colspan="3">
                            http:www.naver.com
                        </td>
                    </tr>
					<tr>
                        <th scope="row">마케팅 수신여부</th>
                        <td colspan="3">
                            <input type="checkbox" id="mkting" name="mkting">
							<label for="mkting">수신</label>
						</td>
                    </tr>
					<tr>
                        <th scope="row">가입일자</th>
                        <td colspan="3">
                            YYYY-MM-DD
                        </td>
                    </tr>
					<tr>
                        <th scope="row">최근방문일시</th>
                        <td colspan="3">
                            YYYY-MM-DD 15:00:00
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">사업자인증</th>
                        <td colspan="3">
                            <ul class="input_list">
                                <li><input type="radio" name="rdo01" id="rdo01_01" checked=""><label for="rdo01_01">인증</label></li>
                                <li><input type="radio" name="rdo01" id="rdo01_02"><label for="rdo01_02">미인증</label></li>
                            </ul>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">사업자인증</th>
                        <td colspan="3">
                            <ul class="input_list">
                                <li><input type="radio" name="rdo02" id="rdo02_01" checked=""><label for="rdo02_01">정상</label></li>
                                <li><input type="radio" name="rdo02" id="rdo02_02"><label for="rdo02_02">일시정지</label></li>
                                <li><input type="radio" name="rdo02" id="rdo02_03"><label for="rdo02_03">탈퇴</label></li>
                            </ul>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                            <a href="#">파일명 .pdf</a>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3">
							입력된내용 들어갑니다.
                        </td>
                    </tr>
					<tr>
                        <th scope="row">탈퇴사유</th>
                        <td colspan="3">
                            입력된 탈퇴사유
                        </td>
                    </tr>
                    </tbody>
                </table>
			</div>
			<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>캐시 내역 <span>보유 캐시 : <strong>00,000</strong>원</span></h4>
				</div>
					<table class="detail mt20">
						<caption>게시글 상세</caption>
						<colgroup>
							<col style="width:8%;">
							<col style="width:10%;">
							<col style="width:10%;">
							<col style="*">
							<col style="width:10%;">
							<col style="*">
						</colgroup>
						<tbody>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>방식</th>
								<th>거래내역</th>
								<th>거래처</th>
								<th>일시</th>
							</tr>
							<tr>
								<td>10</td>
								<td>수입</td>
								<td>출금</td>
								<td>10,000원 정산</td>
								<td>수입</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
							<tr>
								<td>9</td>
								<td>수입</td>
								<td>충전</td>
								<td>100,000원 캐시 충전</td>
								<td>수입</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
							<tr>
								<td>8</td>
								<td>수입</td>
								<td>환불</td>
								<td>박스 명 10,000원 환불</td>
								<td>수입</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
							<tr>
								<td>7</td>
								<td>지출</td>
								<td>구매</td>
								<td>박스 명 10,000원 구매</td>
								<td>지출</td>
								<td>yymmdd : 00:00:00</td>
							</tr>	
							<tr>
								<td>6</td>
								<td>지출</td>
								<td>출금</td>
								<td>10,000원 캐시출금</td>
								<td>지출</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
						</tbody>
					</table>
					<table class="detail mt20">
						<caption>게시글 상세</caption>
						<colgroup>
							<col style="*">
							<col style="width:10%;">
							<col style="width:20%;">
							<col style="width:20%;">
							<col style="*">
						</colgroup>
						<tbody>
							<tr>
								<th>쿠폰정보</th>
								<th>할인</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>사용일시</th>
							</tr>
							<tr>
								<td>
									<p>쿠폰명</p>
									<p>간단한 쿠폰 혜택 설명</p>
								</td>
								<td>0,000원</td>
								<td>YY-MM-DD</td>
								<td>YY-MM-DD</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
							<tr>
								<td>
									<p>회원가입쿠폰</p>
									<p>간단한 쿠폰 혜택 설명</p>
								</td>
								<td>0,000원</td>
								<td>YY-MM-DD</td>
								<td>YY-MM-DD</td>
								<td>yymmdd : 00:00:00</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
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
				<div class="fl type02">
					<div class="img_box">
						<div>
							<img src="http://placehold.it/150x100/">
						</div>
						<div>
							<p>스튜디오 엑스</p>
							<p class="txt_blue">0000@naver.com</p>
							<p>02-000-0000</p>
						</div>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>세금계산서 정보</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">상호명</th>
									<td>웹비즈</td>
								</tr>
								<tr>
									<th scope="row">사업자등록번호</th>
									<td>125-121-111</td>
								</tr>
								<tr>
									<th scope="row">대표자</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th scope="row">사업장소재지</th>
									<td>서울시 강남구 신사동</td>
								</tr>
								<tr>
									<th scope="row">업태</th>
									<td>도소매업</td>
								</tr>
								<tr>
									<th scope="row">사업자등록증</th>
									<td><a href="#" class="txt_blue" download>등록증.jpg</a></td>
								</tr>
								<tr>
									<th scope="row">기업형태</th>
									<td>일반</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>은행정보</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">은행명</th>
									<td>웹비즈</td>
								</tr>
								<tr>
									<th scope="row">계좌번호</th>
									<td>125-121-111</td>
								</tr>
								<tr>
									<th scope="row">예금주</th>
									<td>홍길동</td>
								</tr>
								<tr>
									<th scope="row">사업자등록증</th>
									<td><a href="#" class="txt_blue" download>사본.pdf</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="table_wrap">
						<div class="tit02 mt20">
							<h4>홍보담당자</h4>
						</div>
						<table class="detail mt20">
							<caption>게시글 상세</caption>
							<colgroup>
								<col style="width:30%;">
								<col style="*">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">홍보 담당자명</th>
									<td>웹비즈</td>
								</tr>
								<tr>
									<th scope="row">홍보 담당자 연락처</th>
									<td>010-5589-95520</td>
								</tr>
								<tr>
									<th scope="row">홍보물 수령주소</th>
									<td>서울시 강남구 신사동</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn_area align_r mt20">
						<a href="activity_member.jsp" class="btn">목록</a>
					</div>
				</div>
				<div class="table_wrap">
				<div class="tit02 mt20">
					<h4>재 인증 내역</h4>
				</div>
					<table class="detail mt20">
						<caption>재 인증 내역</caption>
						<colgroup>
							<col style="width:30%;">
							<col style="*">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">상호명</th>
								<td>웹비즈</td>
							</tr>
							<tr>
								<th scope="row">사업자주소</th>
								<td>서울시 송파구 문정동 테라타워 A동 402호</td>
							</tr>
							<tr>
								<th scope="row">사업자등록번호</th>
								<td>125-121-111</td>
							</tr>
							<tr>
								<th scope="row">대표자 명</th>
								<td>홍길동</td>
							</tr>
							<tr>
								<th scope="row">사업자등록증</th>
								<td><a href="#" class="txt_blue" download>등록증.jpg</a></td>
							</tr>
							<tr>
								<th scope="row">변경일시</th>
								<td>yymmdd :00:00:00</td>
							</tr>
							<tr>
								<th scope="row">사업장주소</th>
								<td>서울시 송파구 문정동 테라타워 A동 402호</td>
							</tr>
							<tr>
								<th scope="row">사업자등록번호</th>
								<td>125-121-111</td>
							</tr>
							<tr>
								<th scope="row">사업자등록증</th>
								<td><a href="#" class="txt_blue" download>등록증.jpg</a></td>
							</tr>
							<tr>
								<th scope="row">변경일시</th>
								<td>yymmdd :00:00:00</td>
							</tr>
						</tbody>
					</table>
				</div>

            </div><!-- view -->
        </div><!-- content -->
    </div>
</div>
</body>
<script>
	$('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');
	$("#gnb").find("li").eq(5).addClass("on");
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
