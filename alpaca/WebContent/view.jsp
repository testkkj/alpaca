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

        <table class="table table-dark table-hover text-success">
            <tr>
                <td>글제목</td>
                <td><%=view.get(0).getTitle()%></td>
            </tr>
            <tr>
                <td>작성자</td>
                <td><%=view.get(0).getWriter()%></td>
            </tr>
            <tr>
                <td>작성일</td>
                <td><%=view.get(0).getDate()%></td>
            </tr>
            <tr>
                <td>글내용</td>
                <td><textarea rows="12" cols="50" class="bg-dark border-0 text-success"><%=view.get(0).getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></textarea></td>
            </tr>
        </table>
    </div>
    <a href="update.jsp?bnum=<%=num%>" class="btn btn-outline-secondary btn-lg border-0" role="button">글수정</a>
    <a href="deleteAction.jsp?bnum=<%=num%>" class="btn btn-outline-secondary btn-lg border-0" role="button">글삭제</a>
    <div>
        <form action="commentAction.jsp?bnum=<%=num%>" method="post">
            <input type="text" name="writer" id="writer">
            <textarea name="content" id="content" cols="30" rows="2"></textarea>
            <input type="submit" value="댓글쓰기">
        </form>
    </div>
    <%
		commentDAO cdao = new commentDAO();
		ArrayList<commentVO> cview = cdao.commentList(num);
	%>
    <div>
        <%
				for (int i = 0; i < cview.size(); i++) {
			%>
        <table>
            <td><%=cview.get(i).getWriter()%></td>
            <td><%=cview.get(i).getContent()%></td>
            <td><%=cview.get(i).getWridate()%></td>
        </table>
        <%
				}
			%>
    </div>

</body>

</html>