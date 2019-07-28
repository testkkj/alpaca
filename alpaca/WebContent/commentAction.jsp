<%@page import="com.alpaca.comment.commentDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String writer = (String)session.getAttribute("id");
	String content = request.getParameter("content");

	if (writer == null||writer==""||content == null||content=="") {
%>
<script>
	alert("빠진곳이 있습니다.");
</script>
<%
	} else {
		commentDAO dao = new commentDAO();
		dao.commentInsert(bnum, writer, content);
%>
<script>
	alert("댓글 작성이 완료되었습니다.")
</script>
<jsp:forward page="view.jsp?bnum=<%=bnum %>"></jsp:forward>
<%
	}
%>
