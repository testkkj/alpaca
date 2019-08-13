<%@ page import="com.alpaca.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

String id = (String) session.getAttribute("id");
	String password = request.getParameter("password");

	if (password == null || password == "") {
%>
<script>
	alert("비밀번호를 입력하세요.");
</script>
<%
	} else {
		int num = 0;
		memberDAO dao = new memberDAO();
		String fdb = dao.checkPassword(id);
		if (password.equals(fdb)) {
			num = 1;
		}
%>
<script>
	alert("확인이 완료되었습니다.");
</script>
<jsp:forward page="myPage.jsp">
	<jsp:param value="<%=num%>" name="my" />
</jsp:forward>
<%
	}
%>
