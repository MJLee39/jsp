<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>계산기</h2>
				<hr>
	<%
		String method = request.getMethod();
		if(method.equals("GET")){
			%>
				
				<form action="calc.jsp" method="post">
					<input type="number" name="n1">
					<select name="op">
						<option value="+">+</option>
						<option value="-">-</option>
						<option value="*">*</option>
						<option value="/">/</option>
					</select>
					<input type="number" name="n2">
					<input type="submit" value="실행">
				</form>
			<%
		}else{
			int n1 = Integer.parseInt(request.getParameter("n1"));
			int n2 = Integer.parseInt(request.getParameter("n2"));
			String op = request.getParameter("op");
			int r = 0;
			switch(op){
			case "+":r = n1 + n2;break;
			case "-":r = n1 - n2;break;
			case "*":r = n1 * n2;break;
			case "/":r = n1 / n2;break;
			}
			
			%>
				계산결과: <%= r %>
			<%
		}
	%>
</body>
</html>