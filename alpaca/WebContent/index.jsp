<%@page import="com.alpaca.member.memberVO"%>
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
    }
    </style>
    <title>알파카</title>
</head>

<body class="bg-dark text-success text-center">
    <%
    memberVO vo = new memberVO();
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
  		<button class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	MY PAGE
  		</button>
  		<div class="dropdown-menu btn btn-outline-secondary btn-lg boarder-0" aria-labelledby="dropdownMenuButton">
    	<a href="logout.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGOUT</a>
		</div>
    </div>
    <div class="container mt-5">
    <p class="text-success">
    방문을 환영합니다.<br>
    JSP를 이용하여 만든 개인 포트폴리오 사이트 입니다.<br>
    화려하고 잘만든건 아니지만 기본기를 익히고<br>
    더욱 탄탄하게 만들기위해 제작중입니다.<br>
    슬라이드 쇼의 사진은 각 해당 페이지로의 링크 입니다.<br>
    </p>
    <div id="slide" class="carousel slide" data-ride="carousel">
  <ul class="carousel-indicators">
    <li data-target="#slide" data-slide-to="0" class="active"></li>
    <li data-target="#slide" data-slide-to="1"></li>
    <li data-target="#slide" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active" data-interval="5000">
      <a href="about.jsp"><img src="about.jpg" alt="link to about page" class="w-25"></a>
      <div class="carousel-caption">
    <h3>ABOUT</h3>
    <p>자기소개 페이지로 이동</p>
  </div>
    </div>
    <div class="carousel-item" data-interval="5000">
      <a href="board.jsp"><img src="board.jpg" alt="link to board page" class="w-25"></a>
      <div class="carousel-caption">
    <h3>BOARD</h3>
    <p>게시판 페이지로 이동</p>
  </div>
    </div>
    <div class="carousel-item" data-interval="5000">
      <a href="work.jsp"><img src="work.jpg" alt="link to work page" class="w-25"></a>
      <div class="carousel-caption">
    <h3>WORK</h3>
    <p>제작물 페이지로 이동</p>
  </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#slide" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#slide" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
    </div>
    <%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>