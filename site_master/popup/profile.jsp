<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../shop.inc/common.jsp" %>
<%
String member_idx = ut.escapeHtml(request, "member_idx");

HashMap<String, String> category = sql.getInfo_c(member_idx);
HashMap<String, String> field = sql.getInfo_b(member_idx);
HashMap<String, String> info_c = sql.getProfileInfo_com(member_idx);

if(info_c.isEmpty()){
	out.print("<script>alert('프로필 미등록 회원입니다.');");
	out.print("window.close()</script>");
	return;
}

List<HashMap<String, String>> intro = sql.getProfileInfo_com_intro(info_c.get("p_idx"));
List<HashMap<String, String>> pf = sql.getProfileInfo_com_pf(member_idx);

if(info_c.get("p_skill") != null){
	String skill = info_c.get("p_skill").replaceAll("&amp;&amp;", ", ");// 보유기술
	pageContext.setAttribute("skill", skill);
}
if(info_c.get("p_customer") != null){
	String customer = info_c.get("p_customer").replaceAll("&amp;&amp;", ", ");// 주요고객사
	pageContext.setAttribute("customer", customer);
}
String route = ut.getRoute(info_c.get("p_route"));

pageContext.setAttribute("info_c", info_c);
pageContext.setAttribute("c", category);
pageContext.setAttribute("f", field);
pageContext.setAttribute("intro", intro);
pageContext.setAttribute("pf", pf);

pageContext.setAttribute("route", route);
%>
<%@ include file="../inc/header.jsp"%>
 </head>
 <body style="background-color: transparent;overflow:hidden;" >
	<div class="modal_wrap skin_type01 ">
		<div class="inner">
			<div class="modal" id="layerpopup" style="width:540px;height:460px;">
				<div class="list_tit">
					<h3 class="tit">프로필보기</h3>
					<a href="javascript:popup_layer_close();" class="popup_close">×</a>
				</div>
				<div class="modal-body" style="overflow-y:auto;">
					<div class="write pop">
						<table class="mt15 mb10">
							<caption>프로필 보기</caption>
							<colgroup>
								<col style="width:20%;">
								<col style="width:30%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">${ info_c.p_title }</td>
								</tr>
								<tr>
									<th scope="row">카테고리</th>
									<td colspan="3"><c:forEach items="${c}">${ c.c_name } </c:forEach></td>
								</tr>
								<tr>
									<th scope="row">분야</th>
									<td colspan="3"><c:forEach items="${f}">${ f.c_name } </c:forEach></td>
								</tr>
								<tr>
									<th scope="row">회사구분</th>
									<c:choose>
									<c:when test="${ info_c.p_type eq 'CE' }"><td>법인</td></c:when>
									<c:otherwise><td>개인</td></c:otherwise>
									</c:choose>
									<th scope="row">직원 수</th>
									<td>${ info_c.p_n_of_employee }명</td>
								</tr>
								<tr>
									<th scope="row">매출규모</th>
									<td>${ info_c.p_sales_amount }</td>
									<th scope="row">지역</th>
									<td>${ info_c.cod_address3 } ${ info_c.cod_address4 }</td>
								</tr>
								<tr>
									<th scope="row">주소</th>
									<td colspan="3">${ info_c.p_address3 }</td>
								</tr>
								<tr>
									<th scope="row">설립일</th>
									<td colspan="3">${ info_c.p_fdate }</td>
								</tr>
								<tr>
									<th scope="row">로고 및 <br>대표사진</th>
									<td colspan="3">
										<div class="thumbnail">
											<div class="img_area">
												<img src="${ info_c.filepath }/${ info_c.savefile }" alt="thumbnail">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th scope="row">회사사진</th>
									<td colspan="3">
										<c:forEach var="i" items="${intro}">
											<div class="thumbnail">
												<div class="img_area">
													<img src="${ i.filepath }${ i.savefile }" alt="thumbnail">
												</div>
											</div>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">보유기술</th>
									<td colspan="3">${ skill }</td>
								</tr>
								<tr>
									<th scope="row">주요고객사</th>
									<td colspan="3">${ customer }</td>
								</tr>
								<tr>
									<th scope="row">포트폴리오</th>
									<td colspan="3">
										<c:forEach var="i" items="${pf}">
											<div>
												<p>${ i.p_title }</p>	
												<a href="../../shop.inc/jd_download.jsp?f_no=${i.pf_idx}&t=c_pf" class="flie_txt">
													${ i.orgfile }
												</a>
											</div>
										</c:forEach>
									</td>
								</tr>
								<tr>
									<th scope="row">알게 된 경위</th>
									<td colspan="3">${ route }</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>