<%@ page import="java.util.ArrayList"%>
<%@ page import="com.alpaca.board.boardVO"%>
<%@ page import="com.alpaca.board.boardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>알파카</title>
</head>
<body>
	<%
		if (session.getAttribute("id") == null) {
	%>
	<div class="row">
		<div class="col-md-8 bg-primary">
			<a href="index.jsp">home</a> <a href="about.jsp">about</a> <a
				href="board.jsp">board</a> <a href="work.jsp">work</a>
		</div>
		<div class="col-md-4 bg-success">
			<a href="login.jsp">login</a> <a href="join.jsp">join</a>
		</div>
	</div>
	<div class="col-md-12 bg-success">
		로그인 하시면 게시판에 글을 남기실수 있어요.<br> <a href="join.jsp">가입하기</a><br>
		이미 가입 하셨나요?<br> <a href="login.jsp">로그인</a><br>
	</div>
	<%
		} else {
	%>
	<div class="row">
		<div class="col-md-8 bg-primary">
			<a href="index.jsp">home</a> <a href="about.jsp">about</a> <a
				href="board.jsp">board</a> <a href="work.jsp">work</a>
		</div>
		<div class="col-md-4 bg-success">
			<a href="logout.jsp">로그아웃</a>
		</div>
	</div>
	<div class="col-md-12 bg-success">
		<table style="width: 100%">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>날짜</th>
			</tr>
			<%
			int pagenum = 1;
			if(request.getParameter("pagenum")!=null){
				pagenum = request.getParameter("pagenum");
			}
				boardDAO dao = new boardDAO();
					ArrayList<boardVO> vo = dao.list();
					for (int i = 0; i < vo.size(); i++) {
						if(vo.size()%5==0){
							pagenum += pagenum;
						}
			%>
			<tr>
				<td><%=vo.get(i).getBnum()%></td>
				<td><a href="view.jsp?bnum=<%=vo.get(i).getBnum()%>"><%=vo.get(i).getTitle()%></a></td>
				<td><%=vo.get(i).getWriter()%></td>
				<td><%=vo.get(i).getCount()%></td>
				<td><%=vo.get(i).getDate()%></td>
			</tr>
			<%
				}
			%>
		</table>
		<a href="write.jsp">글쓰기</a>
	</div>
	<%
		}
	%>

</body>
</html>