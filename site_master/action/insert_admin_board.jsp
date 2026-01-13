<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import= "org.apache.commons.lang3.StringEscapeUtils" %>
<%@page import="factomars.MailSend"%>
<%
	if (request.getMethod().toUpperCase().equals("GET")) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		return; //jsp에서 처리 중단
	}
	//인코딩
	request.setCharacterEncoding("UTF-8");
	
	ArrayList<String> params = new ArrayList<>();
	boolean result = false;	
	String rtUrl = ut.escapeHtml(request, "rtUrl");
	
	try{
		conn.setAutoCommit(false);		
		StringBuffer query = new StringBuffer();
		
		String abidx = ut.escapeHtml(request, "ab_idx");
		String reply = ut.escapeHtml(request, "textArea");
		
		String[] datafield = "ab_category, ab_title, ab_public".split(", ");
		for(String s : datafield){
			params.add(ut.escapeHtml(request, s));	
		}
		// tag escape를 다시 tag로 변환
		params.add(StringEscapeUtils.unescapeHtml3(reply));
		
		if(abidx != null && !"".equals(abidx)){
			// 수정
			query.append(" update tbl_admin_board set ab_category = ?, ab_title = ?, ab_public = ?, ab_content = ?, ab_updatedate = now() ");
			query.append(" where ab_idx = ? ");
			params.add(abidx);
			dbconn.getSqlUpdate(conn, query, params);
				
		} else {
			// 등록
			query.append(" INSERT INTO tbl_admin_board (member_idx, ab_category, ab_title, ab_public, ab_content, ab_regdate) "); 
			query.append(" VALUES ("+admin_idx_session+", ?, ?, ?, ?, now()) ");
			
			abidx = Integer.toString(dbconn.getSqlInsertLastId(conn, query, params));
		}
		
		conn.commit();
		rtUrl = rtUrl+="?idx="+abidx;
		result = true;
		
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		conn.setAutoCommit(true);
		conn.close();
	}	
	if(result){		
		out.print(ut.msgGo("게시글을 등록했습니다.", rtUrl));		
	}else{
		out.print(ut.msgGo("오류가 발생했습니다.",""));
	}
%>