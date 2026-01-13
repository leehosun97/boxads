<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String msg = "오류가 발생했습니다.";

	try{
		StringBuffer query = new StringBuffer("UPDATE common_commission SET commission = ?");
		int n = dbconn.getSqlUpdate(conn, query, ut.escapeHtml(request, "commission"));
		if(n>0) msg = "저장되었습니다.";
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
	
	out.print(ut.msgGo(msg,"fees.jsp"));
%>