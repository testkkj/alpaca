<%@ page import="com.alpaca.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");

	if (id == null || id == "" || password == null || password == ""
			|| email == null || email == "") {
%>
<script>
	alert("모두 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		dao.memberInsert(id, password, email, tel);
%>
<script>
	alert("가입이 완료되었습니다.")
</script>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
