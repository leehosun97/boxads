<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String member_type = ut.escapeHtml(request, "");
	String[] del_idxs = ut.escapeHtmls(request, "idx");
	boolean result = false;

	try{
		StringBuffer query = new StringBuffer();
		query.append(" delete from tbl_admin_board where ab_idx in (  ");
		query.append(Arrays.asList(del_idxs).toString().replace("[", "").replace("]", ""));
		query.append(" ) ");	
		dbconn.getSqlUpdate(conn, query);
				
		result = true;
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		conn.close();
	}
	
	if(result){
		out.print(ut.msgGo("게시물을 삭제했습니다.","../notice/notice_list.jsp"));		
	}else{
		out.print(ut.msgGo("오류가 발생했습니다.",""));
	}

%>