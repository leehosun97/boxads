<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="factomars.MailSend"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String p_idx = ut.escapeHtml(request, "p_idx");
	String value = ut.escapeHtml(request, "value");

	boolean result = false;
	List<String> params = new ArrayList<>();

	try{
		conn.setAutoCommit(false);
		
		StringBuffer query = new StringBuffer();
		query.append(" UPDATE tbl_project SET p_recommand = ? ");
		
		if(value.equals("Y")) query.append(" ,p_recommand_date = now() ");
		else query.append(" ,p_recommand_date = null ");
		
		query.append(" WHERE p_idx = ? ");
		params.add(value);
		params.add(p_idx);
		int cnt = dbconn.getSqlUpdate(conn, query, params);
		
		if(cnt > 0){
			conn.commit();
			result = true;
		}else{
			conn.rollback();
		}
		
	}catch(Exception e){
		conn.rollback();
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.setAutoCommit(true);
		conn.close();
	}

	out.print(String.valueOf(result));
%>