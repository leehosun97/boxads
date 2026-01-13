<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
	<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>기업관리</span></h2>
			<ul class="menu">
				<li><a href="comp_list.jsp">기업 리스트</a></li>
				<li class="btn_sub on"><a href="javascript:;">엑셀 업로드</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="javascript:location.reload();" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>기업관리</li>
						<li>엑셀 업로드</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>엑셀 업로드</h3>
				</div>
				<form action="./excel_upload" method="post" enctype="multipart/form-data">
					<div class="list">
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th>파일</th>
									<td><input type="file" name="file"></td>
								</tr>
							</tbody>
						</table>
						<div class="btn_area align_r mt20">
							<button class="btn btn_search" onclick="javascript:saveBoard()">저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
</script>
</body>
</html>