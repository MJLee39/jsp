<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
	
	
	
		String []arr = {"일","월","화","수","목","금","토"};	
	
		Calendar c = Calendar.getInstance();
		Date today = new Date();
		int year = today.getYear();
		int month = today.getMonth();	
		
		if(request.getParameter("year") != null){
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			if(month == 12){
				year++;
				month = 0;
			}	
			
			if(month == -1){
				year--;
				month= 11;
			}
			
			c.set(Calendar.YEAR, year+1900);
			c.set(Calendar.MONTH, month);
		}
		
		
		int lastDate = c.getActualMaximum(Calendar.DAY_OF_MONTH);
		Date startDay = new Date(year, month, 1);
		int yoil = startDay.getDay();
		System.out.println(yoil);
	%>
	
	<h2><%= year+1900 %>년 <%=month+1 %>월</h2>
	<a href="calendar.jsp?year=<%=year %>&month=<%=month-1%>">이전달</a>
	<a href="calendar.jsp?year=<%=year %>&month=<%=month+1%>">다음달</a>
	<table border="1">
		<tr>
			<%
				for(String a:arr){
					out.print("<td>"+a+"</td>");
				}
			%>
		</tr>
	
		<tr>
			<%
				for(int j=1; j<=yoil; j++){
					out.print("<td></td>");
				}
			
				for(int i=1; i<=lastDate; i++){
					%>
						<td><%= i %></td>
					<%
					if((i+yoil) % 7 == 0){
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