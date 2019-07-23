<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<title>AAP Start!</title>
</head>
<body>
	<div>
		<a href="index.jsp">home</a> <a href="about.jsp">about</a> <a
			href="board.jsp">board</a> <a href="work.jsp">work</a> <a
			href="login.jsp">login</a> <a href="join.jsp">join</a>
	</div>
	<div>
	<form action="joinAction.jsp" method="post">
        <label for="id">아이디</label>
        <input type="text" name="id" id="id">
        <label for="password">비밀번호</label>
        <input type="password" name="password" id="password">
        <label for="email">이메일</label>
        <input type="email" name="email" id="email">
        <label for="tel">전화번호</label>
        <input type="tel" name="tel" id="tel">
        <input type="submit" value="가입하기">
    </form>
	</div>
</body>
</html>