<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String arr[] = {"일","월","화","수","목","금","토"};
		int last[] = {31,28,31,30,31,30,31,31,30,31,30,31};
	
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();
		Date startDay = new Date(year, month, 1);
		int yoil = startDay.getDay();
		int lastDay = last[month];
		
	%>
	<h2><%= year+1900 %>년<%=month+1%>월</h2>
	<table border="1">
		<tr>
		<%
			for (int i=0; i<arr.length; i++){
				%>
					<td><%= arr[i] %></td>
				<%
			}
		%>
		</tr>
		<tr>
			<%
				for(int j=1; j<=yoil;j++){
					out.print("<td></td>");
				}
				for(int i=1;i<=lastDay;i++){
					%>
						<td><%= i %></td>
					<%
					if((i+yoil)%7==0){
						%>
						</tr><tr>
						<%
					}
				}
			%>
		</tr>
	</table>
</body>
</html>