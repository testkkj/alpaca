<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>알파카</title>
    <style type="text/css">
    body{
    font-family: 'Nanum Gothic', sans-serif;
    font-size: 20px;
    }
    </style>
</head>

<body class="bg-dark text-success text-center">
    <div class="container mt-3">
    <div class="row">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <div class="dropdown ml-auto">
  		<button type="button" class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle" data-toggle="dropdown">
    	MENU
  		</button>
  		<div class="dropdown-menu">
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0 active" href="login.jsp">LOGIN</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="join.jsp">JOIN</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="idFind.jsp">ID찾기</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="pwFind.jsp">PW찾기</a>
  		</div>
		</div>
        </div>
        </div>
    <div class="container mt-5">
    <img alt="alpaca" src="alpaca.jpg" style="width:300px; height:300px">
            <form action="loginAction.jsp" method="post" class="mt-3">
                <div class="form-group">
                    <label for="id" class="col-2">아이디</label><br><input type="text" name="id" id="id" class="form-control-lg col-4">
                </div>
                <div class="form-group">
                    <label for="password" class="col-2">비밀번호</label><br><input type="password" name="password" id="password" class="form-control-lg col-4">
                </div>
                <br>
                    <button type="submit" class="btn btn-success btn-lg">로그인</button>
            </form>
        </div>
        <div class="container mt-3">
        <a class="btn btn-outline-secondary btn-lg boarder-0 mr-5" role="button" href="idFind.jsp">ID찾기</a>
        <a class="btn btn-outline-secondary btn-lg boarder-0" href="pwFind.jsp">PW찾기</a>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>