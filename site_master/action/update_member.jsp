<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="factomars.MailSend"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp"%>
<%
	boolean result = false;

	String member_idx = ut.escapeHtml(request,"member_idx");	
	String member_type = ut.escapeHtml(request,"member_type");
	String member_password = ut.escapeHtml(request,"member_password");
	String member_use = ut.escapeHtml(request,"member_use");
	String member_recommand = ut.escapeHtml(request,"member_recommand");
	String new_cod_isConfirm = ut.escapeHtml(request,"cod_isConfirm");
	
	String return_page = "../member/individual_list.jsp";

	try{
		conn.setAutoCommit(false);
		
		List<String> params = new ArrayList<>();
		StringBuffer query = new StringBuffer();
		
		query.append(" UPDATE tbl_member SET member_use = ? ,member_recommand = ? ");
		params.add(member_use);
		params.add(member_recommand);
		
		// 추천상태가 Y로 바뀌면 member_recommand_date 현재로 변경, 그 반대일 경우 null로 변경
		String pre_recom = dbconn.getString(conn, new StringBuffer("SELECT member_recommand FROM tbl_member WHERE member_idx = ?"), member_idx);
		if( member_recommand.equals("Y") && pre_recom.equals("N") ) {
			query.append(" ,member_recommand_date = now() ");
		} else if( member_recommand.equals("N") && pre_recom.equals("Y") ) {
			query.append(" ,member_recommand_date = null ");
		}
		
		if(ut.checkValue(member_password)){
			query.append(" ,member_password = SHA2(?, 256) ");
			params.add(member_password);
		}
		
		query.append(" WHERE member_idx = ? ");
		params.add(member_idx);
		dbconn.getSqlUpdate(conn, query, params);
		
		if(member_type.equals("C")){
			// 1. 승인아닌상태에서 승인으로 변경했을경우 승인일자 입력
			// 2. 승인상태에서 승인아님으로 변경했을경우 승일일자 삭제
			// 둘다 아닌경우 건드리지 않음
			query = new StringBuffer(" SELECT cod_isConfirm FROM tbl_cod WHERE member_idx = ? ");
			Map<String,String> org_cod_data = dbconn.getSqlToMap(conn, query, member_idx);
			String org_cod_isConfirm = org_cod_data.get("cod_isconfirm");
			
			query = new StringBuffer();
			if(org_cod_isConfirm.equals("N") && new_cod_isConfirm.equals("Y")){ // 1
				query = new StringBuffer(" UPDATE tbl_cod SET cod_isConfirm = 'Y', cod_confirmDate = now() WHERE member_idx = ? ");
				dbconn.getSqlUpdate(conn, query, member_idx);
				
				// 승인 메일
				HashMap<String, String> mem = dbconn.getEmailAndName(conn, member_idx);
				MailSend mailSend = new MailSend(request, "screening", mem);
				
			}else if(org_cod_isConfirm.equals("Y") && new_cod_isConfirm.equals("")){ // 2
				query = new StringBuffer(" UPDATE tbl_cod SET cod_isConfirm = 'N', cod_confirmDate = null WHERE member_idx = ? ");
				dbconn.getSqlUpdate(conn, query, member_idx);
			}
			
			return_page = "../member/enterprise_list.jsp";
		}
		
		conn.commit();
		result = true;
		
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		conn.setAutoCommit(true);
		conn.close();
	}
	
	if(result){
		out.print(ut.msgGo("저장 되었습니다.",return_page));
	}else{
		out.print(ut.msgGo("오류가 발생했습니다.",return_page));
	}

%>