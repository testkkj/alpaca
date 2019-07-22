<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.alpaca.member.memberVO"%>
<%@ page import="com.alpaca.member.memberDAO"%>

<%
	memberVO mVO = new memberVO();
	memberDAO mDAO = new memberDAO();
	mVO.setId(request.getpara)
	if (mVO.getId() == null || mVO.getPassWord() == null || mVO.getEmail() == null || mVO.getTel() == null) {
%>
alert("빈곳이 있습니다.");
<%
	} else {
		mDAO.insertMember(mVO);
	}
%>