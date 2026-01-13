<%--------------------------------------------------------------------------------
	* 화면명 : Smart Editor 2.8 에디터 - 다중 파일 업로드 처리
	* 파일명 : /SE2/sample/photo_uploader/file_uploader_html5.jsp
--------------------------------------------------------------------------------%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.io.InputStream"%>
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.awt.Image"%>
<%@ page import="java.awt.image.BufferedImage"%>    
<%@ page import="java.awt.AlphaComposite"%>  
<%@ page import="java.awt.Graphics2D"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%
	// 로컬경로에 파일 저장하기 ============================================
	String sFileInfo = "";

	// 파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
	String name = request.getHeader("file-name");

	// 확장자
	String ext = name.substring(name.lastIndexOf(".")+1);

	// 파일 기본경로
	String defaultPath = request.getSession().getServletContext().getRealPath("/");

	// 파일 기본경로 _ 상세경로
	String path = defaultPath + "admin" + File.separator + "js" + File.separator + "se2" + File.separator + "upload" + File.separator;
	//path = "C:\\anthony\\190603_factomars\\sts4_factomars\\works\\factomars\\factomars\\WebContent\\admin\\js\\se2\\upload\\";
	File file = new File(path);
	if(!file.exists()) {
		file.mkdirs();
	}

	/* String realname = UUID.randomUUID().toString() + "." + ext;
	InputStream is = request.getInputStream();
	OutputStream os = new FileOutputStream(path + realname);
	int numRead;
	
	// 파일쓰기
	byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	while((numRead = is.read(b,0,b.length)) != -1) {
		os.write(b,0,numRead);
	}

	if(is != null) {
		is.close();
	}

	os.flush();
	os.close(); */
	
	
	String realname = UUID.randomUUID().toString() + "." + ext;
	InputStream is = request.getInputStream();
    Image image = ImageIO.read(is);
    
    double ratio = 0;
	int w=0, h=0;
	int imageWidth = image.getWidth(null);
	int imageHeight = image.getHeight(null);
		
	ratio = (double)600/(double)imageWidth;
    if(imageWidth>600 && imageHeight>600){
    	w = (int)(imageWidth * ratio);
        h = (int)(imageHeight * ratio);
    }else{
    	w = imageWidth;
        h = imageHeight;
    }
	
    
    int imageType = BufferedImage.TYPE_INT_RGB;
    BufferedImage scaledBI = new BufferedImage(w, h, imageType);
    Graphics2D g = scaledBI.createGraphics();
    g.setComposite(AlphaComposite.Src);
    g.drawImage(image, 0, 0, w, h, null);
    g.dispose();
    
    ImageIO.write(scaledBI, "jpg", new File(path+realname));
    
    String currentURL = request.getRequestURL().toString().replace(request.getRequestURI(),"");
    //currentURL  = currentURL+"/admin/se2/upload/"+realname;
    currentURL = "http://www.factomars.com/admin/js/se2/upload/"+realname;
    System.out.println("url : "+request.getRequestURL().toString().replace(request.getRequestURI(),""));
	System.out.println("path : "+path);
	System.out.println("realname : "+realname);

	// 파일 삭제
// 	File f1 = new File(path, realname);
// 	if (!f1.isDirectory()) {
// 		if(!f1.delete()) {
// 			System.out.println("File 삭제 오류!");
// 		}
// 	}



	//sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL="+"/admin/se2/upload/"+realname;
	sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL="+currentURL;
	out.println(sFileInfo);

	// ./로컬경로에 파일 저장하기 ============================================
%>
