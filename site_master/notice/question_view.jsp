<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String bidx = ut.escapeHtml(request, "idx");

	StringBuffer query = new StringBuffer();
	// 글 정보
	query.append(" SELECT b_idx, member_idx, b_name, b_company, aes_decrypt(unhex(b.b_email),'" + dbconn.getHashKey() + "') as b_email, b_tel, b_category, b_title, b_content, b_parent, b_viewcnt, date_format(b_regdate, '%Y-%m-%d') AS b_regdate ");	
	query.append(" FROM tbl_board b " );
	query.append(" where b_idx = ? " );
	Map<String, Object> board = dbconn.getSqlToMapObj(conn, query, bidx);
	
	if(!board.isEmpty()){
		query.setLength(0);
		query.append(" SELECT * FROM tbl_board_file WHERE b_idx = ? ");
		pageContext.setAttribute("f_list", dbconn.getSql2ListMap(conn, query, board.get("b_idx").toString()));
	}
	
	// 답변 정보
	query.setLength(0);
	query.append(" select b_content from tbl_board where b_parent = ? order by b_regdate ");
	ArrayList<HashMap<String,String>> list = dbconn.getSql2ListMap(conn, query, bidx);
	
	board.put("reply", list);
	pageContext.setAttribute("board", board);
	
	
%>
<%@ include file="../inc/header.jsp"%>
<%@ include file="../inc/gnb.jsp"%>
<script type="text/javascript" src="../js/se2/js/service/HuskyEZCreator.js"></script>
<script src="../js/editor.js"></script>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>게시판</span></h2>
			<ul class="menu">
				<li><a href="notice_list.jsp">FAQ</a></li>
				<li class="on"><a href="question_list.jsp">고객문의</a></li>
			</ul>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>게시판</li>
						<li>문의</li>
						<li>등록,수정,상세</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>고객문의</h3>
				</div>
				<div class="list">
					<table class="search">
						<caption>검색</caption>
						<colgroup>
							<col style="width:150px;">
							<col>
						</colgroup>
						<tr>
							<th scope="row">제목</th>
							<td>
							<c:choose>
								<c:when test="${board.b_category eq 'J'}">[제휴 문의]</c:when>
								<c:when test="${board.b_category eq 'U'}">[이용 방법 문의]</c:when>
								<c:when test="${board.b_category eq 'S'}">[시스템 오류]</c:when>
								<c:when test="${board.b_category eq 'R'}">[회원가입]</c:when>
								<c:when test="${board.b_category eq 'E'}">[기타]</c:when>													
							</c:choose>
							<strong>${board.b_title}</strong></td>
						</tr>
						<tr>
							<th scope="row">글쓴이</th>
							<td>${board.b_name}</td>
						</tr>
							<tr>
							<th scope="row">등록일</th>
							<td>${board.b_regdate}</td>
						</tr>
						<c:if test="${not empty f_list}">
							<tr>
								<th>첨부파일</th>
								<td>
									<c:forEach var="f" items="${f_list}">
										<a href="../../shop.inc/jd_download.jsp?f_no=${f.bf_idx}&t=board">${f.orgfile}</a>
									</c:forEach>
								</td>
							</tr>
						</c:if>
						<tr>							
							<td colspan="2" style=" padding: 20px;	background-color: #fff;">${board.b_content}</td>
						</tr>
					</table>
					<c:if test="${!empty board.reply}">
						<c:forEach items="${board.reply}" var="b">
							<div class="answer_box">
								<p>${b.b_content}</p>							
							</div>							
						</c:forEach>
						
					</c:if>
					<div class="btn_area align_r mt20">
						<a href="question_list.jsp" class="btn btn_search" style="color: #fff;">목록</a>
					</div>
					<form action="../action/insert_board.jsp" method="post" enctype="multipart/form-data">
					<div class=" editor">
						<span>답변</span>
						<div class="answer_box">
							<input type="hidden" name="b_idx" value="${board.b_idx}">
							<textarea style="width:100%;height:500px;" id="textArea" name="textArea"></textarea>
						</div>
					</div>
					<input type="file" id="file" name="file" accept="image/x-png,image/gif,image/jpeg" style="display: none">
					<div class="btn_area align_r mt20">
						<button type="button" class="btn btn_search" onclick="javascript:saveBoard()">저장</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
</script>
</body>
</html>
