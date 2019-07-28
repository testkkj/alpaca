<%@page import="com.alpaca.board.boardDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("bnum"));
	boardDAO dao = new boardDAO();

	dao.boardDelete(num);
%>
<script>
	alert("삭제가 완료되었습니다.")
</script>
<jsp:forward page="board.jsp"></jsp:forward>
