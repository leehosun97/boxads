<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%
	String member_idx = ut.escapeHtml(request, "member_idx");
	String confirm = ut.escapeHtml(request, "confirm");
	if ("".equals(member_idx)) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}
	
	if ("Y".equals(confirm)) {
		int result1 = sql.isConfirm(member_idx);
		if (result1 < 0) {
			out.print(ut.msgGo("승인 실패.", ""));
			if (true)
				return;
		}
	} else {
		int result2 = sql.cancleConfirm(member_idx);
		if (result2 < 0) {
			out.print(ut.msgGo("승인 취소 실패.", ""));
			if (true)
				return;
		}
	}
	out.print(ut.msgGo("처리되었습니다.", "enterprise_list.jsp"));
%>



