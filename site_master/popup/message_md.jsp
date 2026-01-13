<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%@ include file="../inc/header.jsp"%>
<%
	String pidx = ut.escapeHtml(request, "pidx");
	String midx = ut.escapeHtml(request, "midx");
	MyDBConDao dbconn = new MyDBConDao();
	StringBuffer str = new StringBuffer();
	
	str.append(" SELECT e_idx, e_type, e_th, DATE_FORMAT(e_insert_date,'%Y-%m-%d') as e_insert_date FROM tbl_estimate_app WHERE project_idx = "+pidx+" AND member_idx = "+midx+" AND e_state != 0 ORDER BY e_th ASC ");
	ArrayList<HashMap<String,String>> hList = dbconn.getSql2ListMap(str);
	pageContext.setAttribute("hList", hList);
	
%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:540px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">마스터프로젝트 </h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write pop" style="height: 400px;">
						<table class="mt15 mb10">
							<caption>마스터프로젝트 보기 보기</caption>
							<colgroup>
								<col style="width:10%;">
								<col style="width:28%;">
								<col style="width:30%;">
								<col style="width:30%;">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>견적서</th>
									<th>등록일</th>
									<th>견적서</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="d" items="${hList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${d.e_th}차 견적서</td>
									<td>${d.e_insert_date}</td>
									<c:choose>
			                    		<c:when test="${d.e_type eq 'B'}">
			                    			<td><a href="../../project/pop_app_buy.jsp?idx=${d.e_idx}" target="_blank">보기</a></td>
			                    		</c:when>
			                    		<c:otherwise>	
			                    			<td><a href="../../project/pop_app_ex.jsp?idx=${d.e_idx}" target="_blank">보기</a></td>		                    		
			                    		</c:otherwise>
			                    	</c:choose>									
								</tr>
							</c:forEach>	
							</tbody>
						</table>						
					</div>
				</div>
			</div>
		</div>
 </body>
</html>