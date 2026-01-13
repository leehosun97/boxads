<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%
	//get방식의 접근 차단
	if (request_method.toUpperCase().equals("GET")) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}

	String admin_id = ut.escapeNone(request, "id");
	String admin_password = ut.escapeNone(request, "pw");
	String admin_name = ut.escapeNone(request, "name");
	String admin_tel = ut.escapeNone(request, "tel");
	String admin_email = ut.escapeNone(request, "email");
	String admin_use = ut.escapeNone(request, "setting");
	
	
	if (!ut.checkValueArr(new String[]{ admin_id, admin_password, admin_name, admin_tel, admin_email, admin_use })) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}
	
	//회원 신규 insert 및 값이 없으면 update
	String[] params = { admin_id, admin_password, admin_name, admin_tel, admin_email, admin_use, admin_id, admin_password, admin_name, admin_tel, admin_email, admin_use };
	int result = sql.createInsert(params);
	if(result < 1) {
		out.print(ut.msgGo("저장에 실패했습니다", ""));
		if (true)
			return;
	}
	
	out.print(ut.msgGo("성공", "operator_list.jsp"));
%>