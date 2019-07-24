<%@ page import="com.alpaca.member.memberVO"%>
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

	if (vo.getId() == null || vo.getId() == "" || vo.getPassword() == null || vo.getPassword() == "") {
%>
<script>
	alert("모두 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		dao.login(vo.getId(), vo.getPassword());
		session.setAttribute("id", vo.getId());
%>
<script>
	alert("로그인 되었습니다.")
</script>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
