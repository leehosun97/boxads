<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp"%>
<%
	String p_idx = ut.escapeHtml(request, "p_idx");
	int n = -1;
	
	try{
		StringBuffer query = new StringBuffer("UPDATE tbl_order SET o_tax_state = 'Y' WHERE project_idx = ? ");
		n = dbconn.getSqlUpdate(conn, query, p_idx);
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
	
	if(n>0) out.print(ut.msgGo("발행 되었습니다.","../calculate/tax_list.jsp"));
	else out.print(ut.msgGo("오류가 발생했습니다.",""));
%>