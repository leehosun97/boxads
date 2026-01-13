<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../../shop.inc/common_adm.jsp"%>

<%

	if (request_method.toUpperCase().equals("GET")) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return; //jsp에서 처리 중단
	}

	String admin_id_param = ut.escapeHtml(request, "id");
	String admin_password_param = ut.escapeHtml(request, "password");
	
	String[] params = new String[]{ admin_password_param , admin_id_param };

	if (!ut.checkValueArr(params)) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return; //jsp에서 처리 중단
	}
	
	//로그인
    HashMap<String,String> admin_info = sql.adminLogin(params);
    
	String admin_idx = admin_info.get("admin_idx");
	String admin_id = admin_info.get("admin_id");
	String admin_name = admin_info.get("admin_name");
	String admin_password = admin_info.get("admin_password");
	String mypw = admin_info.get("mypw");
	
    if ( admin_info.isEmpty() ){
		out.print(ut.msgGo("DB 조회 실패", ""));
		if (true)
			return; 
    }
	
    if ( !admin_password.equals(mypw) ) {
		out.print(ut.msgGo("아이디와 비밀번호를 확인해주세요.", ""));
		return;
    }
    
    //세션에 값 3개 저장
	session.setAttribute("admin_id_session", admin_id);	
	session.setAttribute("admin_idx_session", admin_idx);
	session.setAttribute("admin_name_session", admin_name);
	
	//최근 로그인 일시 업데이트
	int result = sql.lastLoginTime(admin_idx);
	
    if ( result < 1 ){
		out.print(ut.msgGo("로그인 실패", ""));
		if (true)
			return; 
    }
	
	response.sendRedirect("../project/project_list.jsp");

%>