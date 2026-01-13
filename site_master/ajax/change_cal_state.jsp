<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%
	String p_idxs = ut.escapeHtml(request, "idxs");
	String cal_state = ut.escapeHtml(request, "state");
	
	List<String> params = new ArrayList<>();
	int n = -1;
	boolean result = true;

	try{
		conn.setAutoCommit(false);
		
		String[] p_idx_arr = p_idxs.split(",");
		
		StringBuffer u_query = new StringBuffer("UPDATE tbl_payment SET p_cal_state = ?, p_update_date = now() WHERE project_idx = ?");
		StringBuffer i_query = new StringBuffer();
		// 반려
		if(cal_state.equals("R")){
			i_query.append(" INSERT INTO tbl_payment_history ( project_idx ,h_state ) VALUES (?,'R') ");
			
			for(String p_idx : p_idx_arr){
				params.clear();
				params.add(cal_state);
				params.add(p_idx);
				n = dbconn.getSqlUpdate(conn, u_query, params);
				if( n!=1 ){ result = false; conn.rollback(); break; }
				
				n = dbconn.getSqlInsertLastId(conn, i_query, p_idx);
				if( n<=0 ){ result = false; conn.rollback(); break; }
			}
			
		// 지급완료
		}else{
			i_query.append(" INSERT INTO tbl_payment_history ( project_idx ,h_state ,h_price ) VALUES (?,'C' ");
			i_query.append(" ,(SELECT p_calculate FROM tbl_payment WHERE project_idx = ?)) ");
			StringBuffer p_query = new StringBuffer(" UPDATE tbl_project SET p_state = '12' WHERE p_idx = ? ");
			StringBuffer ph_query = new StringBuffer("INSERT INTO tbl_project_history(project_idx,b_state,a_state,h_desc) VALUES (?,'11','12','정산완료')");
			
			for(String p_idx : p_idx_arr){
				// update tbl_payment
				params.clear();
				params.add(cal_state);
				params.add(p_idx);
				n = dbconn.getSqlUpdate(conn, u_query, params);
				if( n!=1 ){ result = false; conn.rollback(); break; }
				
				// insert tbl_payment_history
				params.clear();
				params.add(p_idx);
				params.add(p_idx);
				n = dbconn.getSqlInsertLastId(conn, i_query, params);
				if( n<=0 ){ result = false; conn.rollback(); break; }
				
				// update tbl_project
				n = dbconn.getSqlUpdate(conn, p_query, p_idx);
				if( n!=1 ){ result = false; conn.rollback(); break; }
				
				// insert tbl_project_history
				n = dbconn.getSqlInsertLastId(conn, ph_query, p_idx);
				if( n<=0 ){ result = false; conn.rollback(); break; }
				
				// insert tbl_notice
				StringBuffer query = new StringBuffer("SELECT * FROM tbl_payment WHERE project_idx = ?");
				Map<String,String> p_data = dbconn.getSqlToMap(conn, query, p_idx);
				n = dbconn.insert_notice(conn, p_idx, p_data.get("r_m_idx"), p_data.get("s_m_idx"), "cal_project"
				, "정산이 완료되었습니다", "/obtain/obtain04.jsp", "obtain4");
				if(n<=0) { conn.rollback(); return; }
				
				// 정산 메일
				dbconn.mailSetting(conn, request, p_idx, "complete_calculate", "expert", null);
			}
		}
		
		
		if(result) out.print("success");
		else out.print("fail");
		
	}catch(Exception e){
		 conn.rollback();
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
		out.print("fail");
	}finally{
		conn.setAutoCommit(true);
		conn.close();
	}
%>