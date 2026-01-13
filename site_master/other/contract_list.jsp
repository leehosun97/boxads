<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	StringBuffer query = new StringBuffer();
	
	query.append(" SELECT ab_idx, member_idx, ab_category, ab_title, ab_content, ab_public, date_format(ab_regdate, '%Y-%m-%d') AS ab_regdate, ab_viewcnt ");		
	query.append(" FROM tbl_admin_board b where ab_category = 'C'");	
	HashMap<String, String> board = dbconn.getSqlToMap(conn, query);
	pageContext.setAttribute("board", board);
	
%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<script type="text/javascript" src="../js/se2/js/service/HuskyEZCreator.js"></script>
<script src="../js/editor.js"></script>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>기타</span></h2>
			<ul class="menu">
				<li><a href="operator_list.jsp">운영자관리</a></li>
				<li class="btn_sub on"><a href="contract_list.jsp">계약서</a></li>
				<li><a href="terms_list.jsp">이용약관</a></li>
				<li><a href="privacy_list.jsp">개인정보취급방침</a></li>
				<li><a href="obtain_cont.jsp">수주확인서 약관</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>기타</li>
						<li>이용약관 수정/ 등록</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>이용약관</h3>
				</div>
				<div class="list">
				<form action="../action/insert_admin_board.jsp" method="post">
					<input type="hidden" name="ab_category" value="C">
					<input type="hidden" value="../other/contract_list.jsp" name="rtUrl">
					<input type="hidden" name="ab_idx" value="${board.ab_idx}">
					<div class="answer_box">
						<textarea style="width:100%;height:500px;" id="textArea" name="textArea">${board.ab_content}</textarea>
					</div>
					<div class="btn_area align_r mt20">
						<button  type="button" class="btn btn_search" onclick="javascript:saveBoard()">저장</button>
					</div>
				</form>
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
