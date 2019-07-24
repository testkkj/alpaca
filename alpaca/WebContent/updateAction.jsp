<%@page import="java.util.ArrayList"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="com.alpaca.board.boardVO"%>
<%@ page import="com.alpaca.board.boardDAO"%>
<jsp:useBean id="vo" class="com.alpaca.board.boardVO" scope="page"></jsp:useBean>
<jsp:setProperty property="title" name="vo" />
<jsp:setProperty property="writer" name="vo" />
<jsp:setProperty property="content" name="vo" />
<%
	int num = Integer.parseInt(request.getParameter("bnum"));
	boardDAO dao = new boardDAO();
%>
<%
	if (vo.getTitle() == null || vo.getTitle() == "" || vo.getWriter() == null || vo.getWriter() == ""
			|| vo.getContent() == null || vo.getContent() == "") {
%>
<script>
	alert("빠진곳이 있습니다.");
</script>
<%
	} else {
		dao.update(num, vo.getTitle(), vo.getWriter(), vo.getContent());
		out.print(num);
		out.print(vo.getTitle());
		out.print(vo.getWriter());
		out.print(vo.getContent());
%>
<script>
	alert("가입이 완료되었습니다.")
</script>
<%
	}
%>
