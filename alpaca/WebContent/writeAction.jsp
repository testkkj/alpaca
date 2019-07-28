<%@page import="com.alpaca.board.boardDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String writer = (String) session.getAttribute("id");
	String content = request.getParameter("content");

	if (title == null || title == "" || content == null || content == "") {
%>
<script>
	alert("모두 작성해 주세요.");
</script>
<%
	} else {
		boardDAO dao = new boardDAO();
		dao.boardInsert(title, writer, content);
%>
<script>
	alert("글쓰기가 완료되었습니다.")
</script>
<jsp:forward page="board.jsp"></jsp:forward>
<%
	}
%>
