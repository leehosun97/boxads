<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../shop.inc/common.jsp"%>
<%
	String member_idx = ut.escapeHtml(request, "member_idx");
	String member_password = ut.escapeHtml(request, "pw_txt01");
	String member_use = ut.escapeHtml(request, "setting"); 

	System.out.println("ㅡㅡㅡㅡㅡmember_passwordㅡㅡㅡㅡㅡㅡ"+member_password);
	System.out.println("ㅡㅡㅡㅡㅡmember_useㅡㅡㅡㅡㅡㅡ"+member_use);
	
	if ( "".equals(member_idx) ) {
		out.print(ut.msgGo("비정상적인 접근입니다.", ""));
		if (true)
			return;
	}
	
	//비밀번호 변경
	if ( !"".equals(member_password) ) {
		int result1 = sql.pwChange( new String[]{ member_password,member_idx } );
		if ( result1 < 0 ) {
			out.print(ut.msgGo("비밀번호 변경에 실패했습니다.", ""));
			if (true)
				return;
		}
	}

	//이용상태 변경
	int result3 = sql.useChange( new String[]{ member_use,member_idx } );
	if ( result3 < 0 ) {
		out.print(ut.msgGo("이용상태 변경에 실패했습니다.", ""));
		if (true)
			return;
	}		
	
	out.print(ut.msgGo("저장되었습니다.", "individual_view.jsp?member_idx="+member_idx));
%>
	
	
		
