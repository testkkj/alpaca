<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.alpaca.member.memberVO"%>
<%@ page import="com.alpaca.member.memberDAO"%>
<jsp:useBean id="vo" class="com.alpaca.member.memberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="id" name="vo" />
<jsp:setProperty property="password" name="vo" />
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	if (vo.getId() == null || vo.getId() == "") {
%>
<script>
	alert("아이디를 입력해 주세요.");
</script>
<%
	} else if (vo.getPassword() == null || vo.getPassword() == "") {
%>
<script>
	alert("비밀번호를 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		dao.login(vo.getId(), vo.getPassword());
		session.setAttribute("id", vo.getId());
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>