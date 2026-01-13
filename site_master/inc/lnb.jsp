<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
	<c:when test="${g_path eq 'project'}">
		<ul class="menu">
			<li class="<c:if test="${fn:startsWith(l_path, 'project')}">on</c:if> btn_sub">
				<a href="javascript:;" <c:if test="${fn:startsWith(l_path, 'project')}">class="skin_bg"</c:if>>프로젝트</a>
				<ul class="sub_menu" <c:if test="${fn:startsWith(l_path, 'project')}">style="display:block;"</c:if>>
					<li <c:if test="${empty param.p_type}">class="on"</c:if>><a href="project_list.jsp">전체</a></li>
					<li <c:if test="${param.p_type eq '1'}">class="on"</c:if>><a href="project_list.jsp?p_type=1">계약검토</a></li>
					<li <c:if test="${param.p_type eq '2'}">class="on"</c:if>><a href="project_list.jsp?p_type=2">계약진행</a></li>
					<li <c:if test="${param.p_type eq '3'}">class="on"</c:if>><a href="project_list.jsp?p_type=3">업무진행</a></li>
					<li <c:if test="${param.p_type eq '4'}">class="on"</c:if>><a href="project_list.jsp?p_type=4">완료/결제대기</a></li>
					<li <c:if test="${param.p_type eq '5'}">class="on"</c:if>><a href="project_list.jsp?p_type=5">관리자의뢰</a></li>
				</ul>
			</li>
			<li class="<c:if test="${fn:startsWith(l_path, 'cancel_list')}">on</c:if> btn_sub"><a href="cancel_list.jsp">취소요청리스트</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'refund_list')}">class="on"</c:if>><a href="refund_list.jsp">취소/환불리스트</a></li>
		</ul>
	</c:when>
	<c:when test="${g_path eq 'admin'}">
		<ul class="menu">
			<li <c:if test="${fn:startsWith(l_path, 'test')}">class="on"</c:if>><a href="enterprise_list.jsp">기업</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'individual')}">class="on"</c:if>><a href="individual_list.jsp">개인</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'secession')}">class="on"</c:if>><a href="secession_list.jsp">탈퇴회원</a></li>
		</ul>
	</c:when>
	<c:when test="${g_path eq 'member'}">
		<ul class="menu">
			<li <c:if test="${fn:startsWith(l_path, 'enterprise')}">class="on"</c:if>><a href="enterprise_list.jsp">기업</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'individual')}">class="on"</c:if>><a href="individual_list.jsp">개인</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'secession')}">class="on"</c:if>><a href="secession_list.jsp">탈퇴회원</a></li>
		</ul>
	</c:when>
	<c:when test="${g_path eq 'set'}">
		<ul class="menu">
			<li <c:if test="${fn:startsWith(l_path, 'category')}">class="on"</c:if>><a href="category.jsp">카테고리</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'field')}">class="on"</c:if>><a href="field.jsp">분야</a></li>
			<%-- <li <c:if test="${fn:startsWith(l_path, 'area')}">class="on"</c:if>><a href="area.jsp">영문지역</a></li> --%>
			<li <c:if test="${fn:startsWith(l_path, 'fees')}">class="on"</c:if>><a href="fees.jsp">수수료 설정</a></li>
		</ul>
	</c:when>
	<c:when test="${g_path eq 'calculate' }">
		<ul class="menu">
			<li <c:if test="${fn:startsWith(l_path, 'sales_list')}">class="on"</c:if>><a href="sales_list.jsp">매출 현황</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'calculate_list')}">class="on"</c:if>><a href="calculate_list.jsp">정산 관리</a></li>
			<li <c:if test="${fn:startsWith(l_path, 'tax_')}">class="on"</c:if>><a href="tax_list.jsp">세금계산서발행 관리</a></li>
		</ul>
	</c:when>
</c:choose>
