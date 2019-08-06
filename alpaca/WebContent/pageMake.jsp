<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
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
    <%
		if (session.getAttribute("id") == null) {
	%>
    <div class="container mt-3">
        <div class="row">
            <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
            <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
            <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
            <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">WORK</a>
            <div class="dropdown ml-auto">
                <button type="button" class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle"
                    data-toggle="dropdown">
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
            <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
            <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">BOARD</a>
            <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">WORK</a>
            <div class="dropdown ml-auto">
                <button type="button" class="btn btn-outline-secondary btn-lg border-0 dropdown-toggle"
                    data-toggle="dropdown">
                    MENU
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item btn btn-outline-secondary btn-lg boarder-0" href="logout.jsp">LOGOUT</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-5 text-left">
        <p style="width:500px">웹 페이지를 만드는 과정.<br>
            저의 작업물과 만드는 과정을 올리는 페이지입니다.<br>
            제일 처음 할 건 이 페이지를 만드는 과정을 올리겠습니다.
        </p>
        <jsp:include page="pageMakeExam.jsp"></jsp:include>
        <p>
            1~17 라인 : page 디렉티브 및 HTML 선언부 입니다.<br>
            <<code>!DOCTYPE html</code>> HTML5 선언방식.<br>
                head 부분에는 bootstrap 사용을 위한 CDN링크, 폰트사용을 위한 CDN링크,<br>
                그리고 폰트 적용을 위한 스타일 부분으로 되어있습니다.<br>
                그리고 바디에 적용시켜 전페이지에 글꼴이 적용되게 했습니다.
        </p>
        <p>
            19~47 라인 : body 영역입니다.<br>
            body태그에 글자색과 가운데 정렬을 지정했습니다.<br>
            그리고 크게 if문과 else문으로 나누어져있는데<br>
            우선 if문 부터 살펴보면 if문은 로그인이 되지 않은<br>
            상태일때 표시될 페이지입니다.<br>
            세션에서 id를 속성값으로 얻어오는데 만약 없다면<br>
            로그인 링크를 표기합니다.<br>
        </p>
        <p>
            48~92 라인 : body 영역중 else 부분입니다.<br>
            else 부분 즉 id가 null이 아니라면 로그인이 된<br>
            상태로 보고 각 페이지에 접근할수 있게 됩니다.<br>
            그리고 본분엔 3장의 사진을 링크로 걸어 각 페이지로<br>
            이동 가능하게 했습니다.<br>
        </p>
        <p>
            93~98 라인 : body 태그가 끝나기 전<br>
            script들은 bootstrap을 사용하기 위한 CND입니다.
        </p>
    </div>
    <%
		}
	%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>