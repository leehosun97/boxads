<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%@ include file="../inc/header.jsp"%>
<%
	if (request.getMethod().toUpperCase().equals("GET")) {
		out.print(ut.msgGo("비정상적인 접근입니다.", "/myhome_com/manager.jsp"));
		return; //jsp에서 처리 중단
	}

	MyDBConDao dbconn = new MyDBConDao();
	StringBuffer str = new StringBuffer();
	ArrayList<String> param = new ArrayList<>();
	String mesg = null;
	String returnUrl = null;
	
/* 	if(ut.escapeHtml(request, "key").equals("cateIn")){
		
	param.add();
	param.add(ut.escapeHtml(request, "cname"));
	param.add(session.getAttribute("admin_idx_session").toString());
	
	str.append(" INSERT INTO tbl_category (c_type, c_name, c_insert_date, c_insert_admin, c_order ) ");
	str.append(" values (?, ?, now(), ?, 0) ");
	
	} else  */

	if(ut.escapeHtml(request, "key").equals("cateModi")){
		String type = ut.escapeHtml(request, "type");
		String[] temp = ut.escapeHtmls(request, "c_idx");
		ArrayList<String> cidxArr = new ArrayList<String>(); 
		cidxArr.addAll(Arrays.asList(temp));
		String[] cnameArr = ut.escapeHtmls(request, "cname");
		String[] sortArr = ut.escapeHtmls(request, "sort");
						
		str.append(" INSERT INTO tbl_category (c_idx, c_type, c_name, c_insert_date, c_insert_admin, c_order) ");
		str.append(" values ");
	
		int max = sql.getMaxIdx(type);
		for(int i = 0; i<cnameArr.length; i++){
			if(cnameArr.length != cidxArr.size()){ cidxArr.add(Integer.toString(max)); max++;}
			str.append("("+cidxArr.get(i)+", '"+type+"', '"+cnameArr[i]+"', now(), "+session.getAttribute("admin_idx_session").toString()+", "+sortArr[i]+")");
			if(i != cnameArr.length -1){ str.append(", "); }		
		}		
		str.append(" ON DUPLICATE KEY UPDATE c_name = VALUES(c_name), c_order = VALUES(c_order), c_update_date =VALUES(c_insert_date), c_update_admin = VALUES(c_insert_admin) ");
		mesg = "수정 되었습니다.";
	} else {
		String[] cidxArr = ut.escapeHtmls(request, "cidx");
		List list = Arrays.asList(cidxArr);
		
		str.append(" DELETE FROM tbl_category WHERE c_idx in ( ");
		str.append(list.toString().replace("[", "").replace("]", ""));
		str.append(" ) ");	
		mesg = "삭제 되었습니다.";
	}
		
	returnUrl = ut.escapeHtml(request, "url");
	
	int n = dbconn.getSqlUpdate(str, param.toArray(new String[param.size()]));	
	if(mesg != null && n > 0){
		out.print(ut.msgGo(mesg, returnUrl));		
	} else {
		out.print(ut.msgGo("오류가 발생했습니다.", returnUrl));
	}

%>
	