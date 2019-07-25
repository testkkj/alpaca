<%@page import="com.alpaca.comment.commentDAO"%>
<%@page import="com.alpaca.comment.commentVO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int bnum = Integer.parseInt(request.getParameter("bnum"));
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");

	commentVO vo = new commentVO();

	vo.setBnum(bnum);
	vo.setWriter(writer);
	vo.setContent(content);

	if (vo.getWriter() == null||vo.getWriter()==""||vo.getContent() == null||vo.getContent()=="") {
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
	alert("가입이 완료되었습니다.")
</script>
<jsp:forward page="board.jsp"></jsp:forward>
<%
	}
%>
