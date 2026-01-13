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
	
	MultipartRequest multi = null;
	String formName = "";
	String fileName = "";
	int fileMaxSize = 1024*1024*30; // 30MB 제한
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	ArrayList<String> params = new ArrayList<>();
	boolean result = false;
	
	// 파일경로
	ServletContext context = getServletContext();
	String uploadFolder = context.getRealPath("/uploads/board/");
	System.out.println("****uploadFolder: " + uploadFolder);		
	
	try{
		conn.setAutoCommit(false);		
		StringBuffer query = new StringBuffer();
		
		// 파일 업로드
		multi = new MultipartRequest(request, uploadFolder, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());

		String bidx = ut.escapeHtml(multi.getParameter("b_idx"));
		String reply = ut.escapeHtml(multi.getParameter("textArea"));
				
		// 게시글 등록
		query.append(" INSERT INTO tbl_board (member_idx, b_name, b_content, b_regdate, b_parent) "); 
		query.append(" VALUES (?, ?, ?, now(), ?) ");
		params.add(admin_idx_session);
		params.add(admin_name_session);
		// tag escape를 다시 tag로 변환
		params.add(StringEscapeUtils.unescapeHtml3(reply));
		params.add(bidx);	
		int replyIdx = dbconn.getSqlInsertLastId(conn, query, params);
		query.setLength(0);
		
		// 파일 등록
		Enumeration<?> forms = multi.getFileNames();
		while(forms.hasMoreElements()){
			// 저장될 파일명 생성
			query.setLength(0);
			params.clear();
			String newFileName = "board_" + (new SimpleDateFormat("yyyyMMddHmsS").format(new Date())) + String.format("%05d",(int)(Math.random()*100000));
			formName = (String)forms.nextElement();
			fileName = multi.getFilesystemName(formName); // 원본 파일명		
			
			if(fileName!=null){
				String ext = fileName.substring(fileName.lastIndexOf("."));		
				File oldFile = new File(uploadFolder + fileName);
				File newFile = new File(uploadFolder + newFileName);
				oldFile.renameTo(newFile);

				ut.imageResize(uploadFolder + newFileName, 500, ext.replace(".", ""));
				
				params.add(Integer.toString(replyIdx));
				params.add(newFileName);
				params.add(fileName);
				params.add("/uploads/board/");

				query.append(" INSERT INTO tbl_board_file ( b_idx, savefile, orgfile, filepath, bf_fdate ) ");
				query.append(" VALUES (?, ?, ?, ?, now()) ");

				int n = dbconn.getSqlUpdate(conn, query, params);
			}
		}
		
		if(bidx != null && !"".equals(bidx)){
			// 답변 여부 업데이트
			query.append(" UPDATE tbl_board SET b_reply = 'Y' WHERE b_idx = ? ");		
			dbconn.getSqlUpdate(conn, query, bidx);
			query.setLength(0);			
			
			// 답변 메일
			query.append(" SELECT b_name, CAST(AES_DECRYPT(UNHEX(b_email),'" + dbconn.getHashKey() + "') AS CHAR(100)) as member_email, b_tel, b_company, b_category, b_title, b_content ");
			query.append(" , (select b_content from tbl_board where b_parent = b.b_idx and b_idx = "+replyIdx+" order by b_regdate) AS reply ");
			query.append(" FROM tbl_board b WHERE b_idx = ? ");
			HashMap<String, String> board = dbconn.getSqlToMap(conn, query, bidx);
	
			// 이메일 보안처리
			board.put("b_email", ut.emailReplaceFront(board.get("member_email")));
			
			switch(board.get("b_category")){
				case "J" : board.put("b_category", "제휴 문의"); break;
				case "U" : board.put("b_category", "이용 방법 문의"); break;
				case "S" : board.put("b_category", "시스템 오류"); break;
				case "R" : board.put("b_category", "회원가입"); break;
				case "E" : board.put("b_category", "기타"); break;		
			}
					
			MailSend mailSend = new MailSend(request, "question", board);
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
		out.print(ut.msgGo("답변을 등록했습니다.","../notice/question_list.jsp"));		
	}else{
		out.print(ut.msgGo("오류가 발생했습니다.",""));
	}
%>