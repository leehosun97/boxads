<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String p_idx = ut.escapeHtml(request, "idx"); 
	String p_commission = ut.escapeHtml(request, "cms");
	
	String result = "fail";
	
	try{
		StringBuffer query = new StringBuffer();
		query.append(" UPDATE tbl_project SET p_commission = ? WHERE p_idx = ? ");
		
		List<String> params = new ArrayList<>();
		params.add(p_commission);
		params.add(p_idx);
		
		int n = dbconn.getSqlUpdate(conn, query, params);
		
		if(n>0) result = "success";
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
		result = e.getMessage();
	}finally{
		conn.close();
	}
	
	out.print(result);
%>