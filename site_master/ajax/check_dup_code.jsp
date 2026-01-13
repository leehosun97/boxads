<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%

	String code = ut.escapeHtml(request, "code");
	String return_msg = "success";

	try{
		if(!request.getMethod().toUpperCase().equals("POST")){
			out.print("not_post");
			return;
		}
		
		conn.setAutoCommit(false);
		
		StringBuffer query = new StringBuffer();
		query.append(" SELECT COUNT(1) FROM tbl_company WHERE code = ? ");
		
		int cnt = dbconn.getCount(conn, query, code);
		
		if( cnt > 0 ) return_msg = "fail";
		
		conn.commit();
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
		out.print(e.getMessage());
	}finally{
		conn.close();
	}
	
	out.print(return_msg);

%>