<%@ page import="com.alpaca.member.memberVO"%>
<%@ page import="com.alpaca.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");

	memberVO vo = new memberVO();

	vo.setId(id);
	vo.setPassword(password);
	vo.setEmail(email);
	vo.setTel(tel);

	if (vo.getId() == null || vo.getId() == "" || vo.getPassword() == null || vo.getPassword() == ""
			|| vo.getEmail() == null || vo.getEmail() == "") {
%>
<script>
	alert("모두 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		dao.memberInsert(vo.getId(), vo.getPassword(), vo.getEmail(), vo.getTel());
%>
<script>
	alert("가입이 완료되었습니다.")
</script>
<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>
