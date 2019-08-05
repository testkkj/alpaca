<%@page import="com.alpaca.member.memberDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String email = request.getParameter("email");

	if (email == null || email == "") {
%>
<script>
	alert("Email을 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		String id = dao.idFind(email);
%>
<jsp:forward page="idFind.jsp">
<jsp:param value="<%=id %>" name="id"/>
</jsp:forward>
<%
	}
%>