<%@page import="com.alpaca.member.memberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.member.memberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
	rel="stylesheet">
<style type="text/css">
body {
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
}
</style>
<title>알파카</title>
</head>

<body class="bg-dark text-success text-center">
	<div class="container mt-3">
		<div class="row">
			<a href="index.jsp"
				class="btn btn-outline-secondary btn-lg border-0 active"
				role="button">HOME</a> <a href="about.jsp"
				class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
			<a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0"
				role="button">BOARD</a> <a href="work.jsp"
				class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
			<div class="dropdown ml-auto">
				<button type="button"
					class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle"
					data-toggle="dropdown">MENU</button>
				<div class="dropdown-menu">
					<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0"
						href="myPage.jsp">MYPAGE</a> <a
						class="dropdown-item btn btn-outline-secondary btn-lg boarder-0"
						href="logout.jsp">LOGOUT</a>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 500px; height: 150px;" class="m-auto">
		<%
			memberDAO dao = new memberDAO();
			ArrayList<memberVO> vo = dao.memberList();
			for (int i = 0; i < vo.size(); i++) {
				out.print(vo.get(i).getId());
				out.print("님,");
			}
		%>
	</div>
	<div>
		<p>가입한 회원님에게 연락하고 싶다면?</p>
		<p>아이디로 검색해 보세요.</p>
		<form action="memberSerch.jsp" method="post">
			<table class="table table-dark table-hover text-success">
				<tr>
					<td>아이디</td>
					<td><div class="form-group">
							<input type="text" name="id" id="id"
								class="bg-dark text-success border-0">
						</div></td>
				</tr>
			</table>
			<button type="submit" class="btn btn-success">검색하기</button>
		</form>
		<%
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		%>
		<table>
		<tr>
		<td>검색하신 id는 : <%=id %></td>
		</tr>
		<tr>
		<td>검색하신 email는 : <%=email %></td>
		</tr>
		<tr>
		<td>검색하신 tel는 : <%=tel %></td>
		</tr>
		</table>
	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>