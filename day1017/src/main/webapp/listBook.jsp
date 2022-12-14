<%@page import="com.sist.vo.BookVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%
	BookDAO dao = new BookDAO();
	ArrayList<BookVO> list = dao.listAll();
%>

<table border="1" class="table table-hover">
	<tr>
		<td>도서번호</td>
		<td>도서명</td>
		<td>출판사</td>
		<td>가격</td>
	</tr>
	
	<%
	for(BookVO d: list){
		%>
			<tr>
				<td><%=d.getBookid()%></td>
				<td><%=d.getBookname() %></td>
				<td><%=d.getPublisher() %></td>
				<td><%=d.getPrice() %></td>
			</tr>
		<%
	}
	%>
</table>
</body>
</html>