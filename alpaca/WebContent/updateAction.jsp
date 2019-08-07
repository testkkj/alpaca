<%@ page import="com.alpaca.board.boardDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String writer = (String) session.getAttribute("id");
	String content = request.getParameter("content");

	int num = Integer.parseInt(request.getParameter("bnum"));

	if (title == null || title == "" || content == null || content == "") {
%>
<script>
	alert("빠진곳이 있습니다.");
</script>
<%
	} else {
		boardDAO dao = new boardDAO();
		dao.boardUpdate(num, title, writer, content);
%>
<script>
	alert("수정이 완료되었습니다.")
</script>
<jsp:forward page="view.jsp?bnum=<%=num %>"></jsp:forward>
<%
	}
%>
