<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver , java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.servlet.*,java.text.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<sql:query dataSource="${db}" var="rs">  
	SELECT * from flightbook where email_id = "${sessionScope.loginUser}"; 
	 	</sql:query>


	<centre> <strong><font color="blue"><h2>

				<c:out value="${'View Your Booked Flights Here !!!'}" />
			</h2></font></strong>
	</center>


	<table border="2" width="100%">
		<tr>
			<th>Booking Id</th>
			<th>User Id</th>
			<th>Flight No</th>
			<th>Source City</th>
			<th>Destination City</th>
			<th>Travel Date</th>
			<th>Price</th>
			<th>Total Passengers Seats</th>
			<th>Class</th>
			
		</tr>
		<c:forEach var="table" items="${rs.rows}">
			<tr>

				<td><c:out value="${table.id}" /></td>
				<td><c:out value="${table.email_id}" /></td>
				<td><c:out value="${table.flight_no}" /></td>
				<td><c:out value="${table.source_city}" /></td>
				<td><c:out value="${table.dest_city}" /></td>
				<td><c:out value="${table.travel_date}" /></td>
				<td><c:out value="${table.price}" /></td>
				<td><c:out value="${table.tot_passenger}" /></td>
				<td><c:out value="${table.flight_class}" /></td>
			</tr>
		</c:forEach>
	</table>
	
	
	<h4><a href="flightwelcome.jsp" style="color:blue">Go Back to Home Page</a></h4>
	<br>
	
	
</body>
</html>