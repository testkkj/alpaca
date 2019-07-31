<%@page import="com.alpaca.board.boardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.alpaca.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>알파카</title>
</head>

<body class="bg-dark text-success text-center">
    <%
		if (session.getAttribute("id") == null) {
	%>
    <div class="container mt-3">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <a href="login.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGIN</a>
        <a href="join.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">JOIN</a>
    </div>
    <div class="container mt-5">
        로그인을 하셔야 둘러보실수 있어요^^.<br>
        <a href="join.jsp" class="btn btn-outline-secondary btn-lg" role="button">JOIN</a>
        <br>
        이미 가입 하셨나요?<br>
        <a href="login.jsp" class="btn btn-outline-secondary btn-lg" role="button">LOGIN</a><br>
    </div>
    <%
		} else {
	%>
    <div class="container mt-3">
        <a href="index.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">HOME</a>
        <a href="about.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">ABOUT</a>
        <a href="board.jsp" class="btn btn-outline-secondary btn-lg border-0 active" role="button">BOARD</a>
        <a href="work.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">WORK</a>
        <a href="logout.jsp" class="btn btn-outline-secondary btn-lg border-0" role="button">LOGOUT</a>
    </div>
    <div class="container mt-5">
        <table class="table table-dark table-hover text-success">
            <tr>
                <th>글번호</th>
                <th>글제목</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>날짜</th>
            </tr>
            <%
				int pagenum = 1;
					if (request.getParameter("pnum") != null) {
						pagenum = Integer.parseInt(request.getParameter("pnum"));
					}

					boardDAO dao = new boardDAO();
					ArrayList<boardVO> vo = dao.boardList();

					int totalarticlenumber = vo.size();
					int articleperpage = 5;
					int totalpagenumber = (totalarticlenumber / articleperpage);
					if(totalarticlenumber%articleperpage!=0){
						totalpagenumber += 1;
					}
					int startpagenumber = 1;
					int startarticlenum = 0;
					int endarticlenum = 0;

					if (pagenum == startpagenumber) {
						if (vo.size() != 0) {
							for (int i = 0; i < vo.size(); i++) {
								if (i < 5) {
			%>
            <tr>
                <td><%=vo.get(i).getBnum()%></td>
                <td><a href="view.jsp?bnum=<%=vo.get(i).getBnum()%>" class="text-success"><%=vo.get(i).getTitle()%></a>
                </td>
                <td><%=vo.get(i).getWriter()%></td>
                <td><%=vo.get(i).getCount()%></td>
                <td><%=vo.get(i).getDate()%></td>
            </tr>
            <%
				}
							}
						}
					} else if (pagenum > startpagenumber) {
						startarticlenum = pagenum * 5 - 5;
						endarticlenum = pagenum * 5;
						for (int i = startarticlenum; i < endarticlenum; i++) {
							if (vo.size() > i || vo.size() > endarticlenum) {
			%>
            <tr>
                <td><%=vo.get(i).getBnum()%></td>
                <td><a href="view.jsp?bnum=<%=vo.get(i).getBnum()%>" class="text-success"><%=vo.get(i).getTitle()%></a></td>
                <td><%=vo.get(i).getWriter()%></td>
                <td><%=vo.get(i).getCount()%></td>
                <td><%=vo.get(i).getDate()%></td>
            </tr>
            <%
				}
						}
					}
			%>
        </table>
    </div>
    <div class="container mt-5">
		<%
			if (pagenum != 1) {
		%>
		<a href="board.jsp?pnum=<%=pagenum - 1%>" class="btn btn-success btn-lg" role="button">이전</a>
		<%
			}
				if (pagenum == 1 && pagenum != totalpagenumber&&vo.size()>5) {
		%>
		<a href="board.jsp?pnum=<%=pagenum + 1%>" class="btn btn-success btn-lg" role="button">다음</a>
		<%
			}
		%>
	</div>
	<div class="container mt-5">
	<a href="write.jsp" class="btn btn-outline-secondary btn-lg" role="button">글쓰기</a>
	</div>
	<%
		}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>

</html>