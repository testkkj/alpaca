<%@page import="com.alpaca.file.fileDAO"%>
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
		String sid = (String) session.getAttribute("id");
		fileDAO fdao = new fileDAO();
		String folder = "C:/Spring/eclipse-jee-2019-06-R-win32-x86_64/work/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/alpaca/image";
		String name = fdao.getFname(num);
		boardDAO dao = new boardDAO();
		dao.getView(num);
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
				<td><textarea rows="12" cols="50" readonly
						class="bg-dark border-0 text-success"><%=view.get(0).getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;")
					.replaceAll("\n", "<br>")%></textarea></td>
			</tr>
			<tr>
				<td>업로드</td>
				<td>
				<%
				if(name==""){
					%>
					파일이 없습니다.
					<%
				}else{
					%>
					<img src="<%=folder %>/<%=name %>" alt="" style="width:200px;height:200px;">
					<%
				}
				%>
				</td>
			</tr>
		</table>
	</div>
	<%
		if (sid.equals(view.get(0).getWriter())) {
	%>
	<a href="update.jsp?bnum=<%=num%>"
		class="btn btn-outline-secondary btn-lg border-0" role="button">글수정</a>
	<a href="deleteAction.jsp?bnum=<%=num%>"
		class="btn btn-outline-secondary btn-lg border-0" role="button">글삭제</a>
	<%
		}
	%>
	<div class="container">
		<form action="commentAction.jsp?bnum=<%=num%>" method="post">
			<table class="table table-dark table-hover text-success">
				<tr>
					<td>
						<div class="form-group">
							<textarea name="content" id="content" cols="75" rows="5"
								class="bg-dark text-success border-0"></textarea>
						</div>
					</td>
					<td>
						<button type="submit" class="btn btn-success">댓글쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<%
		commentDAO cdao = new commentDAO();
		ArrayList<commentVO> cview = cdao.commentList(num);
	%>
	<div class="container">
		<table class="table table-dark table-hover text-success">
			<%
				for (int i = 0; i < cview.size(); i++) {
			%>
			<tr>
				<td><%=cview.get(i).getWriter()%></td>
				<td><textarea rows="5" cols="50" readonly
						class="bg-dark border-0 text-success"><%=cview.get(i).getContent()%></textarea></td>
				<td><a
					href="reComment.jsp?bnum=<%=num%>&cnum=<%=cview.get(i).getCnum()%>"
					class="btn btn-outline-secondary btn-sm border-0" role="button">답글</a>
					<%
						if (sid.equals(cview.get(i).getWriter())) {
					%> <a
					href="commentUpdate.jsp?bnum=<%=num%>&cnum=<%=cview.get(i).getCnum()%>"
					class="btn btn-outline-secondary btn-sm border-0" role="button">수정</a>
					<a
					href="commentDeleteAction.jsp?bnum=<%=num%>&cnum=<%=cview.get(i).getCnum()%>"
					class="btn btn-outline-secondary btn-sm border-0" role="button">삭제</a>
					<%
						}
					%>
				</td>
			</tr>
			<%
				}
			%>
		</table>
	</div>

</body>

</html>