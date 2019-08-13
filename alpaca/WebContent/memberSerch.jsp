<%@page import="com.alpaca.member.memberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.member.memberDAO"%>
<%@page import="com.alpaca.file.fileDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.alpaca.board.boardDAO"%>
<%@  page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");

	if (id == null || id == "") {
%>
<script>
	alert("검색할 ID를 입력해 주세요.");
</script>
<%
	} else {
		memberDAO dao = new memberDAO();
		ArrayList<memberVO> vo = dao.memberSerch(id);
%>
<script>
	alert("글쓰기가 완료되었습니다.")
</script>
<jsp:forward page="test.jsp">
<jsp:param value="<%=vo.get(0).getId() %>" name="id"/>
<jsp:param value="<%=vo.get(0).getEmail() %>" name="email"/>
<jsp:param value="<%=vo.get(0).getTel() %>" name="tel"/>
</jsp:forward>
<%
	}
%>
