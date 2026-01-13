<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="factomars.MailSend"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String p_idx = ut.escapeHtml(request, "p_idx");
	boolean result = false;

	try{
		conn.setAutoCommit(false);
		
		// 프로젝트 상태 UPDATE
		StringBuffer query = new StringBuffer(" UPDATE tbl_project SET p_state = '5' WHERE p_idx = ? ");
		int n = dbconn.getSqlUpdate(conn, query, p_idx);
		if(n<=0) { conn.rollback(); return; }
		
		// 프로젝트 이력 INSERT
		query = new StringBuffer();
		query.append(" INSERT INTO tbl_project_history ( project_idx ,b_state ,a_state ,h_desc ) ");
		query.append(" VALUES ( ?,'4','5','입금확인' ) ");
		n = dbconn.getSqlInsertLastId(conn, query, p_idx);
		if(n==0){ conn.rollback(); return; }
		
		// 알림 발송
		query = new StringBuffer();
		query.append(" SELECT P.p_member_idx, A.member_idx FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_app A ON P.p_idx = A.project_idx ");
		query.append(" AND A.e_state = '4' WHERE P.p_idx = ? ");
		Map<String,String> p_data = dbconn.getSqlToMap(conn, query, p_idx);
		n = dbconn.insert_notice(conn, p_idx , p_data.get("p_member_idx"), p_data.get("member_idx"), "req_deposit"
				, "시작되었습니다" , "/obtain/obtain03.jsp", "obtain3" );
		if(n==0){ conn.rollback(); return; }
		n = dbconn.insert_notice(conn, p_idx , p_data.get("member_idx"), p_data.get("p_member_idx"), "req_deposit"
				, "시작되었습니다" , "/order/order03.jsp", "order3" );
		if(n==0){ conn.rollback(); return; }
		
		// 입금 확인 메일
		HashMap<String, String> pro = dbconn.getProInfoForMail(conn, p_idx);
		HashMap<String, String> mem = dbconn.getOrderInfoForMail(conn, p_idx);
		pro.putAll(mem);
		pro.put("cate", "order");
		
		// 발주처
		MailSend mailSend = new MailSend(request, "deposit_confirm", pro);
		
		// 전문가
		mem = dbconn.getEmailAndName(conn, pro.get("member_idx"));
		pro.put("member_email", mem.get("member_email"));
		pro.put("mem_name", mem.get("ex_name"));
		pro.put("cate", "obtain");
		mailSend = new MailSend(request, "deposit_confirm", pro);	
		
		conn.commit();
		result = true;
		
	}catch(Exception e){
		conn.rollback();
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.setAutoCommit(true);
		conn.close();
	}

	out.print(String.valueOf(result));
%>