<%@page import="com.alpaca.comment.commentDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content = request.getParameter("content");

	int num = Integer.parseInt(request.getParameter("bnum"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));

	if (content == null || content == "") {
%>
<script>
	alert("공백을 입력할수 없습니다.");
</script>
<%
	} else {
		commentDAO dao = new commentDAO();
		dao.commentUpdate(num, cnum, content);
%>
<script>
	alert("수정이 완료되었습니다.")
</script>
<jsp:forward page="view.jsp?bnum=<%=num %>"></jsp:forward>
<%
	}
%>
