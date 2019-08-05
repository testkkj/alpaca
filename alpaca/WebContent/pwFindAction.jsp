<%@page import="com.alpaca.member.memberDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

String email = request.getParameter("email");
String id = request.getParameter("id");

	if (email == null || email == "") {
%>
<script>
	alert("Email을 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		String pw = dao.pwFind(email, id);
%>
<jsp:forward page="pwFind.jsp">
<jsp:param value="<%=pw %>" name="pw"/>
</jsp:forward>
<%
	}
%>