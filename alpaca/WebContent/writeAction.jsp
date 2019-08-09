<%@page import="com.alpaca.file.fileDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.alpaca.board.boardDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String result = "----------------------------------------<br>";
	String realFolder = "";
	String saveFolder = "/image";
	String encType = "UTF-8";
	int maxSize = 5 * 1024 * 1024;

	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);

	MultipartRequest upload = null;
	upload = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	String title = upload.getParameter("title");
	String writer = (String) session.getAttribute("id");
	String content = upload.getParameter("content");

	Enumeration<?> files = upload.getFileNames();

	String filename = upload.getFilesystemName("file");
	String original = upload.getOriginalFileName("file");

	if (title == null || title == "" || content == null || content == "") {
%>
<script>
	alert("모두 작성해 주세요.");
</script>
<%
	} else {
		boardDAO dao = new boardDAO();
		dao.boardInsert(title, writer, content);
		fileDAO fdao = new fileDAO();
		fdao.fileInsert(original, filename);
%>
<script>
	alert("글쓰기가 완료되었습니다.")
</script>
<jsp:forward page="board.jsp"></jsp:forward>
<%
	}
%>
