<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String member_type = ut.escapeHtml(request, "member_type");
	String[] del_idxs = ut.escapeHtml(request, "del_member_idx").split(",");
	boolean result = false;

	try{
		StringBuffer query = new StringBuffer();
		query.append(" UPDATE tbl_member SET ");
		query.append(" member_use = 'D' ,member_deletedate = now() ");
		query.append(" WHERE member_idx = ? ");
		for(String idx : del_idxs){
			dbconn.getSqlUpdate(conn, query, idx);
		}
		
		result = true;
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
	
	if(result){
		if(member_type.equals("C")){
			out.print(ut.msgGo("탈퇴처리 되었습니다.","../member/enterprise_list.jsp"));
		}else{
			out.print(ut.msgGo("탈퇴처리 되었습니다.","../member/individual_list.jsp"));
		}
	}else{
		out.print(ut.msgGo("오류가 발생했습니다.",""));
	}

%>