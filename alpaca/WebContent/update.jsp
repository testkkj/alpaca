<%@page import="com.alpaca.board.boardVO"%>
<%@page import="com.alpaca.board.boardDAO"%>
<%@page import="com.alpaca.comment.commentVO"%>
<%@page import="com.alpaca.comment.commentDAO"%>
<%@page import="java.util.ArrayList"%>
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
    <div class="container">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <a href="login.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGIN</a>
        <a href="join.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">JOIN</a>
    </div>
	<%
		int num = Integer.parseInt(request.getParameter("bnum"));
		boardDAO dao = new boardDAO();
		ArrayList<boardVO> view = dao.boardView(num);
	%>
	
	<div class="container">
<form action="updateAction.jsp?bnum=<%=num %>" method="post">
        <table class="table table-dark table-hover text-success">
            <tr>
                <td>글제목</td>
                <td><input type="text" name="title"
				id="title" placeholder="<%=view.get(0).getTitle()%>" class="bg-dark text-success border-0"></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><textarea name="content" id="content" cols="50" rows="12" placeholder="<%=view.get(0).getContent() %>" class="bg-dark text-success border-0"></textarea></td>
            </tr>
        </table>
        <button type="submit" class="btn btn-success">글수정</button>
        </form>
    </div>
	
	
</body>
</html>