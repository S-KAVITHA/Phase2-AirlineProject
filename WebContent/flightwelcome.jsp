<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<font color="blue"><h2>Welcome to Online Airline Reservation System!!! Home page !!!</h2></font>
	<br>
	
	<font color="blue"><h3>Hello ${sessionScope.loginUser} !!!</h3></font><br>
	
	
	<h4><a href="searchinput.jsp" style="color: blue">Search Flights</a></h4>
	
	<h4><a href="listflights.jsp" style="color: blue">List Booked Flights</a></h4>
	
	
	<form action="sessionlogout.jsp">
			<button><h7>Logout</h7></button>
			<br> <br>
	
	<br>
	
	
</body>
</html>