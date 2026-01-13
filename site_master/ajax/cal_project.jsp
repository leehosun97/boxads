<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%

	String p_idx = ut.escapeHtml(request, "idx");

	try{
		if(!request.getMethod().toUpperCase().equals("POST")){
			out.print("not_post");
			return;
		}
		
		conn.setAutoCommit(false);
		
		// 프로젝트 정보 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT P.* ,A.member_idx as a_m_idx FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_app A ON P.p_app_idx = A.e_idx ");
		query.append(" WHERE P.p_idx = ? AND P.p_state = '11' ");
		Map<String, String> p_data = dbconn.getSqlToMap(conn, query, p_idx);
		
		if(p_data.isEmpty()){
			out.print("no_data");
			return;
		}
		
		// 프로젝트 상태 업데이트
		query = new StringBuffer(" UPDATE tbl_project SET p_state = '12' WHERE p_idx = ? ");
		int n = dbconn.getSqlUpdate(conn, query, p_idx);
		if(n<=0) { conn.rollback(); out.print("fail_update_p_state"); return; }
		
		// 알림 발송
		n = dbconn.insert_notice(conn, p_idx, p_data.get("p_member_idx"), p_data.get("a_m_idx"), "cal_project"
				, "정산이 완료되었습니다", "/obtain/obtain04.jsp", "obtain4");
		if(n<=0) { conn.rollback(); out.print("fail_insert_notice"); return; }
		
		// 정산 메일
		dbconn.mailSetting(conn, request, p_idx, "complete_calculate", "expert", null);
		
		// 프로젝트 히스토리 등록
		query = new StringBuffer();
		query.append(" INSERT INTO tbl_project_history ( project_idx ,b_state ,a_state ,h_desc ) ");
		query.append(" VALUES ( ?,'11','12','관리자 정산' ) ");
		n = dbconn.getSqlUpdate(conn, query, p_idx);
		if(n<=0) { conn.rollback(); out.print("fail_insert_project_history"); return; }
		
		conn.commit();
		out.print("success");
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
		out.print(e.getMessage());
	}finally{
		conn.close();
	}

%>