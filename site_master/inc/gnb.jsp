<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<div class="header_top">
		<div class="inner relative">
			<h1>ADMINISTRATOR</h1>
			<div class="user_name">
				<span class="ico"></span>
				<p class="txt">
            		${admin_name_session}님
				</p>
				<span class="info">최종관리자</span>
			</div>
			<ul class="btn_wrap clearfix">
				<li class="homepage"><a href="../../main/main.jsp">HOMEPAGE</a></li>
				<li class="logout"><a href="../admin/logout.jsp">LOG-OUT</a></li>
			</ul>
		</div>
	</div>
	<nav id="gnb">
		<ul class="clearfix">
			<li <c:if test="${g_path eq 'project'}">class="on"</c:if>><a href="../project/project_list.jsp">홈</a></li>
			<li <c:if test="${g_path eq 'member'}">class="on"</c:if>><a href="../member/enterprise_list.jsp">상품관리</a></li>
			<li <c:if test="${g_path eq 'calculate'}">class="on"</c:if>><a href="../calculate/sales_list.jsp">주문관리</a></li>
			<li <c:if test="${g_path eq 'notice'}">class="on"</c:if>><a href="../notice/notice_list.jsp">정산관리</a></li>
			<li <c:if test="${g_path eq 'set'}">class="on"</c:if>><a href="../set/category.jsp">부가기능관리</a></li>
			<!-- <li <c:if test="${g_path eq 'stat'}">class="on"</c:if>><a href="../stat/stat_list.jsp">통계</a></li> -->
			<li <c:if test="${g_path eq 'other'}">class="on"</c:if>><a href="../other/operator_list.jsp">회원관리</a></li>
			<li <c:if test="${g_path eq 'comp'}">class="on"</c:if>><a href="../comp/comp_list.jsp">사이트관리</a></li>
			<li <c:if test="${g_path eq 'comp'}">class="on"</c:if>><a href="../comp/comp_list.jsp">설정</a></li>
			<li <c:if test="${g_path eq 'comp'}">class="on"</c:if>><a href="../comp/comp_list.jsp">통계</a></li>
			<li <c:if test="${g_path eq 'comp'}">class="on"</c:if>><a href="../comp/comp_list.jsp">인쇄관리</a></li>
		</ul>
	</nav>
</header>