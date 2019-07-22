<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.alpaca.member.memberVO"%>
<%@ page import="com.alpaca.member.memberDAO"%>
<jsp:useBean id="vo" class="com.alpaca.member.memberVO" scope="page"></jsp:useBean>
<jsp:setProperty property="id" name="vo" />
<jsp:setProperty property="password" name="vo" />
<jsp:setProperty property="email" name="vo" />
<jsp:setProperty property="tel" name="vo" />
<%
	if (vo.getId() == null || vo.getId() == "" || vo.getPassword() == null || vo.getPassword() == ""
			|| vo.getEmail() == null || vo.getEmail() == "") {
%>
alert("빠진곳이 있습니다.");
<%
	} else {
		memberDAO dao = new memberDAO();
		dao.insert(vo.getId(), vo.getPassword(), vo.getEmail(), vo.getTel());
%>
alert("가입이 완료되었습니다.")
<%
	}
%>