<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <title>알파카</title>
</head>

<body class="bg-dark text-success text-center">
    <%
		if (session.getAttribute("id") == null) {
	%>
    <div class="container mt-3">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <a href="login.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGIN</a>
        <a href="join.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">JOIN</a>
        </div>
    <div class="container mt-5">
        로그인을 하셔야 둘러보실수 있어요^^.<br>
        <a href="join.jsp" class="btn btn-outline-secondary btn-lg" role="button">JOIN</a><br>
        이미 가입 하셨나요?<br>
        <a href="login.jsp" class="btn btn-outline-secondary btn-lg" role="button">LOGIN</a><br>
    </div>
    <%
		} else {
	%>
    <div class="container mt-3">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <a href="logout.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGOUT</a>
    </div>
    <div class="container mt-5">
        간략한 설명~<br>
        about 페이지에는 자기소개가 있습니다.<br>
        board 페이지에는 가입하신분이 글을 남기실수 있는 게시판이 있습니다.<br>
        work 페이지에는 이 페이지의 제작과정과<br>
         만들것들의 과정 그리고 github링크를 걸어둘 예정입니다.<br>
    </div>
    <%
		}
	%>
</body>

</html>