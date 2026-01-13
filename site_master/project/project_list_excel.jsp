<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="factomars.ExcelUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%
	//====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" WHERE P.p_state not in (0, -1) AND p_cancel_btn like 'N' ");
	
	// 구분
	String p_field = ut.escapeHtml(request, "p_field");
	if(ut.checkValue(p_field)){
		where.append(" AND P.p_field = ? ");
		params.add(p_field);
	}
	
	// 키워드 검색
	String search_type = ut.escapeHtml(request, "search_type");
	String search_text = ut.escapeHtml(request, "search_text");
	if(ut.checkValue(search_type) && ut.checkValue(search_text)){
		switch(search_type){
		case "p_title":
			where.append(" AND P.p_title LIKE CONCAT('%',?,'%') ");
			break;
		case "p_code":
			where.append(" AND P.p_code LIKE CONCAT('%',?,'%') ");
			break;
		case "r_member_name":
			where.append(" AND CONCAT(M1.member_last_name,M1.member_name) LIKE CONCAT('%',?,'%') ");
			break;
		case "a_member_name":
			where.append(" AND CONCAT(M2.member_last_name,M2.member_name) LIKE CONCAT('%',?,'%') ");
			break;
		}
		params.add(search_text);
	}
	
	// 상태
	String p_state = ut.escapeHtml(request, "p_state");
	if(ut.checkValue(p_state)){
		if(p_state.equals("R")){ 
			where.append(" AND A.e_state = 3 "); 
		} else {
			where.append(" AND P.p_state = ? ");			
			params.add(p_state);
		}
	}
	
	// 시작일자
	String start_date = ut.escapeHtml(request, "start_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(P.p_re_date,'%Y-%m-%d') >= ? ");
		params.add(start_date);
	}
	// 종료일자
	String end_date = ut.escapeHtml(request, "end_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(P.p_re_date,'%Y-%m-%d') <= ? ");
		params.add(end_date);
	}
	
	// 리스트 상태값
	String p_type = ut.escapeHtml(request, "p_type");
	if(!p_type.equals("") && !p_type.equals("5")){
		where.append(" AND (A.e_state not in (-1, 3) OR A.e_state is null) AND P.p_show != 'A' ");
	}
	
	if(ut.checkValue(p_type)){
		switch(p_type){
		case "1":
			where.append(" AND P.p_state in (1) ");			
			break;
		case "2":
			where.append(" AND P.p_state in (2, 3, 4) ");			
			break;
		case "3":
			where.append(" AND P.p_state in (5) ");			
			break;
		case "4":
			where.append(" AND P.p_state in (6, 7, 8, 9, 10, 11, 12)");			
			break;
		case "5":
			where.append(" AND (P.p_show like 'A' OR A.e_state = 3) ");
			break;
		}
	}
	
	// ====================== PARAM 세팅 End ======================
	
	StringBuffer query = new StringBuffer();
	query.append(" SELECT P.p_code ,P.p_title ");
	query.append(" ,IFNULL(C.cod_name,CONCAT(M1.member_last_name, M1.member_name)) as r_member_name ");
	query.append(" ,IFNULL(C2.cod_name,CONCAT(M2.member_last_name, M2.member_name)) as a_member_name ");
	query.append(" ,CASE WHEN P.p_field = 'E' THEN '채용' ELSE '구매' END as p_field ");
	query.append(" ,CASE WHEN IFNULL(IFNULL(od.o_total_gross, o_submit_pay), P.p_ws_sum) is not null ");
	query.append("   THEN CONCAT(FORMAT(IFNULL(IFNULL(od.o_total_gross, o_submit_pay), P.p_ws_sum),0),' ' ");
	query.append("     ,CASE WHEN IFNULL(B.e_unit,E.e_pay_type) = 'U' THEN 'USD' ELSE 'KRW' END) ");
	query.append("   ELSE '-' END as p_ws_sum ");
	query.append(" ,DATE_FORMAT(P.p_ws_date,'%Y-%m-%d') as p_ws_date ");
	query.append(" ,DATE_FORMAT(P.p_re_date,'%Y-%m-%d') as p_re_date ");
	query.append(" FROM tbl_project P ");
	query.append(" LEFT JOIN tbl_estimate_app A ON P.p_idx = A.project_idx AND A.e_state in (3, 4) ");
	query.append(" LEFT JOIN tbl_member M1 ON P.p_member_idx = M1.member_idx ");
	query.append(" LEFT JOIN tbl_cod C ON M1.member_idx = C.member_idx ");
	query.append(" LEFT JOIN tbl_member M2 ON A.member_idx = M2.member_idx ");
	query.append(" LEFT JOIN tbl_cod C2 ON M2.member_idx = C2.member_idx ");
	query.append(" LEFT JOIN tbl_order od ON (P.p_idx = od.project_idx) ");
	query.append(" LEFT JOIN tbl_estimate_req_buy B ON B.project_idx = P.p_idx ");
	query.append(" LEFT JOIN tbl_estimate_req_ex E ON E.project_idx = P.p_idx ");
	query.append(where);
	query.append(" order by p_idx desc ");
	
	try{
		List<HashMap<String, String>> list = dbconn.getSql2ListMap(conn, query, params);
		
		String[] widthInfo = {"4","10","5","5","1","4","2","2"};
		String[] headerInfo = {"코드","제목","발주처","전문가","구분","금액","시작일","마감일"};
		String[] bodyInfo = {"p_code","p_title","r_member_name","a_member_name","p_field","p_ws_sum","p_ws_date","p_re_date"};
	
		ExcelUtil.commonDownExcel(request, response, "프로젝트 리스트", widthInfo, headerInfo, bodyInfo, list);
		
		out.clear();
		out = pageContext.pushBody();
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
	
%>