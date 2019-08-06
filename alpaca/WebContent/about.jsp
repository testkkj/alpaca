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
    <%
		if (session.getAttribute("id") == null) {
	%>
    <div class="container mt-3">
    <div class="row">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <div class="dropdown ml-auto">
  		<button type="button" class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle" data-toggle="dropdown">
    	MENU
  		</button>
  		<div class="dropdown-menu">
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="login.jsp">LOGIN</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="join.jsp">JOIN</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="idFind.jsp">ID찾기</a>
    	<a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="pwFind.jsp">PW찾기</a>
  		</div>
		</div>
        </div>
        </div>
    </div>
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
    <div class="row">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">ABOUT</a>
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
    <div class="container mt-5">
    <h1>컴퓨터 프로그래밍</h1>
    <small>computer programming</small><br>
    <p>
    또는 간단히 프로그래밍(programming, 문화어: 프로그램 작성) 혹은 코딩(coding)은<br>
    하나 이상의 관련된 추상 알고리즘을 특정한 프로그래밍 언어를 이용해<br>
    구체적인 컴퓨터 프로그램으로 구현하는 기술을 말한다.<br>
    프로그래밍은 기법, 과학, 수학, 공학, 심리학적 속성들을 가지고 있다.<br>
    한편 코딩은 '작업의 흐름에 따라 프로그램 언어의 명령문을 써서 프로그램을 작성하는 일'<br>
    또는 '프로그램의 코드를 작성하는 일'로 크게 나누어 언급되고 있는데<br>
    이는 알고리즘과의 상관관계를 잘 언급하고있다.<br><br>
    자기소개 페이지이지만 제출을 위해서 임시로 작성한 내용입니다.
    </p>
    </div>
    <%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>