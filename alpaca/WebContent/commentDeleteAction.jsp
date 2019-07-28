<%@ page import="com.alpaca.comment.commentDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("bnum"));
	int cnum = Integer.parseInt(request.getParameter("cnum"));
	commentDAO dao = new commentDAO();

	dao.commentDelete(num, cnum);
%>
<script>
	alert("삭제가 완료되었습니다.")
</script>
<jsp:forward page="view.jsp?bnum=<%=num%>"></jsp:forward>
