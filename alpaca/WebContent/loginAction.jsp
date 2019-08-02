<%@page import="com.alpaca.member.memberVO"%>
<%@ page import="com.alpaca.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	memberVO vo = new memberVO();
	vo.setId(id);
	vo.setPassword(password);

	if (id == null || id == "" || password == null || password == "") {
%>
<script>
	alert("모두 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		int pass = dao.login(id, password);
		if (pass == 1) {
			session.setAttribute("id", id);
		} else {
%>
<script>
	alert("잘못된 정보입니다.")
</script>
<%
	}
%>
<script>
	alert("로그인 되었습니다.")
</script>
<%
	}
%>
<jsp:forward page="index.jsp"></jsp:forward>