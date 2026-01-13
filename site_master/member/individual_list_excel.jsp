<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="factomars.ExcelUtil" %>
<%@ include file="../../shop.inc/jd_common_adm.jsp" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%
	//====================== PARAM 세팅 Start ======================
	List<String> params = new LinkedList<>();
	StringBuffer where = new StringBuffer(" where member_type = 'P' and member_use != 'D' ");
	where.append(" and member_email_authstatus = 'Y' ");
	
	// 분류 선택 & 검색
	String field = ut.escapeHtml(request, "field"); // 분류
	String searchtext = ut.escapeHtml(request, "searchtext"); // 내용
	if(ut.checkValue(field) && ut.checkValue(searchtext)){
		if(field.equals("member_email")){
			where.append(" and aes_decrypt(unhex(member_email),'" + dbconn.getHashKey() + "') LIKE CONCAT('%',?,'%') ");
		}else if(field.equals("member_name")){
			where.append(" and CONCAT(M.member_last_name,M.member_name) LIKE CONCAT('%',?,'%') ");
		}
		params.add(searchtext);
	}
	
	// 시작일자
	String start_date = ut.escapeHtml(request, "start_date");
	if(ut.checkValue(start_date)){
		where.append(" AND DATE_FORMAT(member_registdate,'%Y-%m-%d') >= ? ");
		params.add(start_date);
	}
	// 종료일자
	String end_date = ut.escapeHtml(request, "end_date");
	if(ut.checkValue(end_date)){
		where.append(" AND DATE_FORMAT(member_registdate,'%Y-%m-%d') <= ? ");
		params.add(end_date);
	}
	
	// ====================== PARAM 세팅 End ======================
			
	// ====================== ORDERBY Start ======================
	String search_order = ut.escapeHtml(request, "search_order");
	StringBuffer order = new StringBuffer(" ORDER BY ");
	switch(search_order){
		case "이름 오름차순": 	order.append(" CONCAT(M.member_last_name,' ',M.member_name) "); 		break;
		case "이름 내림차순": 	order.append(" CONCAT(M.member_last_name,' ',M.member_name) desc "); 	break;
		case "이메일 오름차순": 	order.append(" CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) "); 			break;
		case "이메일 내림차순": 	order.append(" CAST(AES_DECRYPT(UNHEX(M.member_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) desc "); 	break;
		case "가입일 오름차순": 	order.append(" M.member_registdate "); 		break;
		case "가입일 내림차순": 	order.append(" M.member_registdate desc "); 	break;
		default: 			order.append(" M.member_idx desc "); 			break;
	}
	// ====================== ORDERBY End ======================
			
	try{
		StringBuffer query = new StringBuffer();
		query.append(" SELECT CONCAT(M.member_last_name,' ',M.member_name) as member_name ");
		query.append(" ,CAST(AES_DECRYPT(UNHEX(M.member_email),'webbizz2019') AS CHAR(100)) as member_email ");
		query.append(" ,create_phoneNum(P.p_address1, REPLACE(P.p_tel,'-','')) as p_tel ");
		query.append(" ,CASE WHEN M.member_path = 'G' THEN '구글' WHEN M.member_path = 'F' THEN '페이스북' ELSE '이메일' END as member_path ");
		query.append(" ,CASE WHEN M.member_use='Y' THEN '정상' ELSE '정지' END  as member_use ");
		query.append(" ,DATE_FORMAT(M.member_registdate,'%Y-%m-%d') as member_registdate ");
		query.append(" FROM tbl_member M ");
		query.append(" LEFT JOIN tbl_profile_p P ON M.member_idx = P.member_idx ");
		query.append(where);
		query.append(order);
		List<HashMap<String, String>> list = dbconn.getSql2ListMap(conn, query, params);
		
		String[] widthInfo = {"7","8","5","2","4","2"};
		String[] headerInfo = {"이름","이메일","휴대폰 번호","가입경로","가입일","상태"};
		String[] bodyInfo = {"member_name","member_email","p_tel","member_path","member_registdate","member_use"};
	
		ExcelUtil.commonDownExcel(request, response, "개인회원 리스트", widthInfo, headerInfo, bodyInfo, list);
		
		out.clear();
		out = pageContext.pushBody();
		
	}catch(Exception e){
		System.out.println("Error[" + cm_sdf.format(new Date()) + "]: " + e.getMessage());
	}finally{
		conn.close();
	}
	
%>