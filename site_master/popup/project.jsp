<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../shop.inc/common.jsp" %>
<%
String m_idx = ut.escapeHtml(request, "m_idx");

HashMap<String, String> masterProject = sql.selectMasterProjectDetail(m_idx);
pageContext.setAttribute("masterProject", masterProject);
%>
<%@ include file="../inc/header.jsp"%>
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
					<div class="write pop">
						<table class="mt15 mb10">
							<caption>마스터프로젝트 보기 보기</caption>
							<colgroup>
								<col style="width:22%;">
								<col style="width:28%;">
								<col style="width:20%;">
								<col style="width:30%;">
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">코드명</th>
									<td colspan="3">${ masterProject.m_code }</td>
								</tr>
								<tr>
									<th scope="row">프로젝트명</th>
									<td colspan="3">${ masterProject.m_name }</td>
								</tr>
								<tr>
									<th scope="row">시작일</th>
									<td><fmt:parseDate value="${ masterProject.m_start_date }" var="indate" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/></td>
									<th scope="row">종료일</th>
									<td><fmt:parseDate value="${ masterProject.m_end_date }" var="indate" pattern="yyyy-MM-dd"/>
										<fmt:formatDate value="${indate}" pattern="yyyy-MM-dd"/></td>
								</tr>
								<tr>
									<th scope="row">최종담당자</th>
									<td>${ masterProject.m_last_person }</td>
									<th scope="row">담당자</th>
									<td>${ masterProject.m_ch_person }</td>
								</tr>
								<tr>
									<th scope="row">최종설정위치</th>
									<td colspan="3">${ masterProject.m_address }</td>
								</tr>
								<tr>
									<th scope="row">비고</th>
									<td colspan="3">${ masterProject.m_desc }</td>
								</tr>
							</tbody>
						</table>
						<!-- <div class="write_btn align_r mb10">
							<button class="btn_add">추가</button>
						</div> -->
					</div>
					<!-- <div class="list">
						<table class="mt0 type_col">
							<caption>항목 가격 입력</caption>
							<colgroup>
								<col style="width:51%;">
								<col style="width:auto;">
							</colgroup>
							<thead>
								<th>항목명</th>
								<th>가격</th>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" title="항목명" /></td>
									<td class="align_c"><input type="text" title="가격"  style="width:135px;"/> 원</td>
								</tr>
							</tbody>
						</table>
						<div class="write_btn align_c mt10">
							<button class="btn_modify">확인</button>
						</div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
 </body>
</html>