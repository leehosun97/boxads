<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String abidx = ut.escapeHtml(request, "idx");	
	StringBuffer query = new StringBuffer();
	
	if(abidx != null && !"".equals(abidx)){
		query.append(" SELECT ab_idx, member_idx, ab_category, ab_title, ab_content, ab_public, date_format(ab_regdate, '%Y-%m-%d') AS ab_regdate, ab_viewcnt ");		
		query.append(" FROM tbl_admin_board b where ab_idx = ?");
		HashMap<String, String> board = dbconn.getSqlToMap(conn, query, abidx);
		pageContext.setAttribute("board", board);
	} 
%>

<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<script type="text/javascript" src="../js/se2/js/service/HuskyEZCreator.js"></script>
<script src="../js/editor.js"></script>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>게시판</span></h2>
			<ul class="menu">
				<li class="btn_sub on"><a href="notice_list.jsp">FAQ</a></li>
				<li><a href="question_list.jsp">고객문의</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>게시판</li>
						<li>FAQ</li>
						<li>등록/수정</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>FAQ</h3>
				</div>
				<div class="list">
					<table class="search">
					<form action="../action/insert_admin_board.jsp" method="post">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">제목</th>
							<td>
								<input type="text" title="제목" name="ab_title" value="${board.ab_title}" style="width:50%">
							</td>
						</tr>
						<tr>
							<th scope="row">게시여부</th>
							<td>
								<input type="radio" id="chk01" name="ab_public" value="Y" checked="checked" <c:if test="${board.ab_public ne 'N'}">checked="checked"</c:if>><label for="chk01">노출</label>
								<input type="radio" id="chk02" name="ab_public" value="N" <c:if test="${board.ab_public eq 'N'}">checked="checked"</c:if>><label for="chk02">비노출</label>
							</td>
						</tr>
						<tr>
							<td colspan="2">							
								<input type="hidden" name="ab_category" value="F">
								<input type="hidden" name="ab_idx" value="${board.ab_idx}">
								<input type="hidden" value="../notice/notice_view.jsp" name="rtUrl">
								<textarea style="width:100%;height:500px;" id="textArea" name="textArea">${board.ab_content}</textarea>
							</td>
						</tr>
					</form>
					</table>
					<div class="btn_area align_r mt20">
						<button type="button" class="btn btn_search" onclick="javascript:saveBoard()">저장</button>
						<c:if test="${!empty board.ab_idx}">
						<button type="button" class="btn btn_search" onclick="delBtn();">삭제</button>
						</c:if>
						<button type="button" class="btn btn_search" onclick="">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
</script>
</body>
</html>
