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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet"> 
    <style type="text/css">
    body{
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 20px;
    }
    </style>
    <title>알파카</title>
</head>

<body class="bg-dark text-success text-center">
    <div class="container mt-3">
    <div class="row">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>       
  		<div class="dropdown ml-auto">
  		<button type="button" class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle" data-toggle="dropdown">
    	MENU
  		</button>
  		<div class="dropdown-menu">
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="logout.jsp">LOGOUT</a>
  		</div>
		</div>
		</div>
    </div>
	<%
		int num = Integer.parseInt(request.getParameter("bnum"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));

		commentDAO cdao = new commentDAO();
		ArrayList<commentVO> cview = cdao.commentView(num, cnum);
	%>
	<div class="container">
	<form action="commentUpdateAction.jsp?bnum=<%=num %>&cnum=<%=cnum %>" method="post">
		<table class="table table-dark table-hover text-success">
			<tr>
				<td><textarea name="content" rows="5" cols="75" placeholder="<%=cview.get(0).getContent()%>" class="bg-dark border-0 text-success"></textarea>
				</td>
				<td><button type="submit" class="btn btn-success">댓글수정</button></td>
			</tr>
			
		</table>
		</form>
	</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>