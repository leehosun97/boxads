<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<%@ include file="../inc/left_site.jsp" %>
		<div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>공지사항</h3>
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
                            <select style="width:100px;">
                                <option>전체</option>
                                <option>노출</option>
								<option>비노출</option>
                            </select>
                        </td>
						<th scope="row">등록일자</th>
                        <td >
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
                            <select style="width:100px;">
                                <option>제목</option>
                                <option>내용</option>
								<option>등록자</option>
                            </select>
							<input type="text">
                        </td>
                    </tr>
                    </tbody>
                </table>
                 <div class="btn_area align_r mt20">
                    <button type="button" class="btn btn_search">검색</button>
					<button type="button" class="btn btn_search">엑셀다운로드</button>
                </div>
                <div class="search_wrap mt20">
                    <div class="result">
                        <p class="txt">검색결과 총 <span>2</span>건</p>
                    </div>
                    <table class="search_list">
                        <caption>검색결과</caption>
                        <colgroup>
                            <col style="width:7%">
                            <col width="*">
                            <col style="width:10%;">
                            <col style="width:10%;">
                            <col style="width:10%;">
                            <col style="width:10%;">
                            <col style="width:10%;">
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col">등록자</th>
                            <th scope="col">등록일</th>
                            <th scope="col">첨부파일</th>
                            <th scope="col">조회수</th>
                            <th scope="col">노출상태</th>
                        </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>5</td>
                                <td><a href="#">입력한 제목 표시합니다.</a></td>
                                <td>홍길동</td>
                                <td>2019-05-06</td>
                                <td><img src="../images/sub/file_ico.png" alt="첨부파일"></td>
                                <td>000</td>
                                <td>노출</td>
                            </tr>
							<tr>
                                <td>5</td>
                                <td><a href="#">입력한 제목 표시합니다.</a></td>
                                <td>홍길동</td>
                                <td>2019-05-06</td>
                                <td><img src="../images/sub/file_ico.png" alt="첨부파일"></td>
                                <td>000</td>
                                <td>노출</td>
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
    $("#gnb").find("li").eq(0).addClass("on");
  });

</script>
</body>
</html>
