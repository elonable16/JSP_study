<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@include file ="./dbconn.jsp" %>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String fileUploadPath ="D:\\elon\\WebProg\\JSPBook\\WebContent\\product\\images";
	DiskFileUpload upload = new DiskFileUpload();
	List items = upload.parseRequest(request);
	Iterator params = items.iterator(); // 반복자
	FileItem item = null;
	params.hasNext(); // 두개인것을 알기 때문에 while 사용안함
	item = (FileItem)params.next();
	String p_code = item.getString("utf-8");
	params.hasNext();
	item = (FileItem)params.next();
	String filename = item.getName();

	
	String imgfile = fileUploadPath + "/" + p_code +".jpg";
	File file = new File(imgfile); // 파일 객체 생성
	item.write(file); // 저장
	
	PreparedStatement pstmt = null;
	String sql = "";
	try{
		sql = "update product set p_image =? where p_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,p_code);
		pstmt.setInt(2,Integer.parseInt(p_code));
		pstmt.executeUpdate();
	}catch(Exception e){
		System.out.println(e.toString());
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn!=null)
			conn.close();
%>
		<script>
			opener.location.reload(); // 이전 윈도우 갱신
			window.close();// 자신의 창 닫기
		</script>
<%
	}
%>
</body>
</html>