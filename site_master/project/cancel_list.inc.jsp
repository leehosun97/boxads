<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import = "factomars.PagingUtil" %>
<%
	PagingUtil pu = null;

	int pageNo = ut.escapeInt(request, "page", 1);
	int line_cnt = ut.escapeInt(request, "line_cnt", 10);
	
	// ====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" WHERE p_cancel_btn like 'C' AND p_state not in (-1) ");
	
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
		case "c_member_name":
			where.append(" AND IFNULL(C.cod_name, CONCAT(M1.member_last_name, M1.member_name)) LIKE CONCAT('%',?,'%') ");
			break;
		/* case "r_member_name":
			where.append(" AND CONCAT(M1.member_last_name,M1.member_name) LIKE CONCAT('%',?,'%') ");
			break;
		case "a_member_name":
			where.append(" AND CONCAT(M2.member_last_name,M2.member_name) LIKE CONCAT('%',?,'%') ");
			break; */
		}
		params.add(search_text);
	}
	
	// 시작일자
	String start_date = ut.escapeHtml(request, "start_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(P.p_cancel_date,'%Y-%m-%d') >= ? ");
		params.add(start_date);
	}
	// 종료일자
	String end_date = ut.escapeHtml(request, "end_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(P.p_cancel_date,'%Y-%m-%d') <= ? ");
		params.add(end_date);
	}
	
	// ====================== PARAM 세팅 End ======================

	try{
		// 리스트 CNT 조회
		StringBuffer query = new StringBuffer();
		query.append(" SELECT count(1) ");
		query.append(" FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_app A ON P.p_idx = A.project_idx AND A.e_state in (4) ");
		query.append(" LEFT JOIN tbl_member M1 ON P.p_cancel_member_idx = M1.member_idx ");
		/* query.append(" LEFT JOIN tbl_member M2 ON A.member_idx = M2.member_idx "); */
		query.append(where);
		int list_cnt = dbconn.getCount(conn, query, params);
		
		// 페이징 설정
		String[] disParam = {"page"}; //중복되므로 제거		
		pu = new PagingUtil(request, list_cnt, 10, line_cnt, pageNo, disParam); // request, 총line, 표시할페이지수, 한페이지에 보여줄 line, 제거할parameter
		
		// 리스트 조회
		query = new StringBuffer();
		query.append(" SELECT P.p_idx ,P.p_title ,P.p_code , ifnull(ifnull(od.o_total_gross, o_submit_pay), P.p_ws_sum) AS p_ws_sum, P.p_cancel_date, P.p_state, A.e_state ");		
		query.append(" ,IFNULL(C.cod_name, CONCAT(M1.member_last_name, M1.member_name)) AS c_member_name ");
		/* query.append(" ,IFNULL(C2.cod_name,CONCAT(M2.member_last_name, M2.member_name)) as a_member_name "); */				
		query.append(" ,CASE WHEN P.p_cancel_member_idx != P.p_member_idx THEN '전문가' ELSE '발주처' END AS c_mem_type ");
		query.append(" ,CASE WHEN P.p_ws_sum_type = 'U' THEN 'USD' ELSE 'KRW' END as p_ws_sum_type_str ");
		query.append(" FROM tbl_project P ");
		query.append(" LEFT JOIN tbl_estimate_app A ON P.p_idx = A.project_idx AND A.e_state in (4) ");			
		query.append(" LEFT JOIN tbl_member M1 ON P.p_cancel_member_idx = M1.member_idx ");
		query.append(" LEFT JOIN tbl_cod C ON M1.member_idx = C.member_idx ");
		query.append(" LEFT JOIN tbl_order od ON (P.p_idx = od.project_idx) ");
		/* query.append(" LEFT JOIN tbl_member M2 ON A.member_idx = M2.member_idx ");
		query.append(" LEFT JOIN tbl_cod C2 ON M2.member_idx = C2.member_idx "); */
		query.append(where);
		query.append(" order by p_idx desc ");
		query.append(" LIMIT " + pu.getStart_line() + ", " + pu.getPage_per_line());
		List<HashMap<String, String>> list = dbconn.getSql2ListMap(conn, query, params);
		pageContext.setAttribute("page_start_num", pu.getPage_start_num());
		pageContext.setAttribute("list_cnt", list_cnt);
		pageContext.setAttribute("list", list);
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
%>