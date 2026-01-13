<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../inc/header.jsp" %>
	<%@ include file="../inc/gnb.jsp" %>
	<div class="sub_wrap">
		<%@ include file="../inc/left_site.jsp" %>
		   <div class="container clearfix">
        <div class="content">
            <div class="list_tit">
                <h3>공지사항</h3>
            </div>
            <div class="view">
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
                        <th scope="row">제목</th>
                        <td colspan="3">
                            <input type="text"  placeholder="제목 입력" style="width:90%">
                            
                        </td>
                    </tr>
					<tr>
                        <th scope="row">등록자</th>
                        <td colspan="3">
                            박스애드
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">게시여부</th>
                        <td colspan="3">
                            <ul class="input_list">
                                <li><input type="radio" name="rdo01" id="rdo01_01" checked=""><label for="rdo01_01">노출</label></li>
                                <li><input type="radio" name="rdo01" id="rdo01_02"><label for="rdo01_02">비노출</label></li>
                            </ul>
                        </td>
                    </tr>
					<tr>
                        <th scope="row">첨부파일</th>
                        <td colspan="3">
                            <div class="file_area">
                                <div class="img_type01">
                                    <p>
                                        <input type="text"  placeholder="파일 등록">
                                    </p>
                                    <input type="file" id="file_type01">
                                    <label for="file_type01" class="btn_file">파일찾기</label>
                                </div>
                            </div>
                            <ul class="mt10">
                                <li>
                                    <span class="file_name">파일명 .pdf</span>
                                    <button class="btn_download">삭제</button>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">내용</th>
                        <td colspan="3">
							에디터
                            <!--<textarea name="" id="" cols="30" rows="10"></textarea>-->
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_area align_r mt20">
                    <button type="button" class="btn save">저장</button>
                    <!-- <button type="button" class="btn">삭제</button> -->
                    <a href="notice.php" class="btn">목록</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    $(function() {
        $("#gnb").find("li").eq(6).addClass("on");
    $('#lnb ul.menu > li').eq(0).find(' > a ').addClass('skin_bg').next().show().find('>li').eq(0).addClass('on');

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
