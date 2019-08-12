<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.alpaca.file.fileDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("bnum"));

	fileDAO dao = new fileDAO();
	String folder = "C:/Spring/eclipse-jee-2019-06-R-win32-x86_64/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/alpaca/image/";
	String name = dao.getFname(num);

	File file = new File(folder+name);
	try {
		if(file.exists()){
			file.delete();
			dao.fileDelete(num);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert("삭제가 완료되었습니다.")
</script>
<jsp:forward page="view.jsp?bnum=<%=num %>"></jsp:forward>
