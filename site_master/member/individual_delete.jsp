<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/common_adm.jsp"%>
<%
	//get방식의 접근 차단
	if (request_method.toUpperCase().equals("GET")) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}

	String[] userArr = ut.escapeNone(request, "userid").split("-"); // '-'로 연결된 userid를 split으로 잘라 배열에 넣음.
	
	if ( userArr == null || userArr.length < 0 ) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}
		
	//배열 넣어서 delete
	for( int i=0 ; i < userArr.length ; i++ ){ 
		int result = sql.deleteMember(userArr[i]);
		if ( result < 0 ) {
			out.print(ut.msgGo("삭제 실패.", ""));
			if (true)
				return;
		}
	}
	
	out.print(ut.msgGo("삭제 성공", "individual_list.jsp"));
	
%>	
	
	
		
