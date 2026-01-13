<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	try{
		// 수수료 정보
		StringBuffer query = new StringBuffer("SELECT * FROM common_commission");
		pageContext.setAttribute("common_commission", dbconn.getString(conn, query));
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
%>
<%@ include file="../inc/header.jsp"%>
	<%@ include file="../inc/gnb.jsp"%>
	<div class="sub_wrap">
		<aside id="lnb">
			<h2 class="tit"><span>설정</span></h2>
			<%@ include file="../inc/lnb.jsp" %>
		</aside>
		<div class="container clearfix">
			<div class="content">
				<a href="#" class="btn_refresh">새로고침</a>
				<div class="navi">
					<ul class="clearfix">
						<li>HOME</li>
						<li>설정</li>
						<li>수수료 설정</li>
					</ul>
				</div>
				<div class="list_tit over_warp">
					<h3>수수료 설정</h3>
				</div>
				<form action="action_fees.jsp" method="post">
					<div class="list">
						<span class="c_red01" style="margin-bottom: 5px;display: inline-block;">*전체 수수료율 설정입니다. </span>
						<table class="search">
							<caption>검색</caption>
							<colgroup>
								<col style="width:150px;">
								<col>
							</colgroup>
							<tr>
								<th scope="row">수수료</th>
								<td>
									<input type="text" name="commission" title="키워드" value="${common_commission}" style="width:250px" required>
									<span>%</span>
								</td>
							</tr>
						</table>
						<div class="btn_area align_r mt20">
							<button class="btn btn_search">저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>
