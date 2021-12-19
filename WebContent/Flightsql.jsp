<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver , java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.servlet.*,java.text.*"%>
<%@ page import="java.text.ParseException"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>sql:query Tag</title>
</head>
<body>


	<c:set scope="session" var="datetravel" value="${param.traveldate}" />
	<c:set scope="session" var="sourcecty" value="${param.srccity}" />
	<c:set scope="session" var="destcty" value="${param.destcity}" />
	<c:set scope="session" var="availseat" value="${param.seatavail}" />


	<c:if
		test="${(empty param.srccity) or (empty param.destcity) or (empty param.traveldate) or (empty param.seatavail)}">
		<c:redirect url="searchinput.jsp">
			<c:param name="errMsg" value="Error: Mandatory Input Missing" />
		</c:redirect>
	</c:if>



	<c:if
		test="${(not empty param.srccity) and (not empty param.destcity) and (not empty param.traveldate) and (not empty param.seatavail)}">
		<!-- sql:setDataSource tag -->
		<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/db_world" user="root"
			password="root" />

		<sql:query dataSource="${db}" var="rs">  
	SELECT * from flight where source_city = "${param.srccity}" and destination_city ="${param.destcity}" and date_of_travel = "${param.traveldate}" and seat_availibility >="${param.seatavail}" ; 
	 	</sql:query>


		<centre> <strong><font color="blue"><h2>

					<c:out value="${'Book Your Flights Here !!!'}" />
				</h2></font></strong>
		</center>


		<table border="2" width="100%">
			<tr>
				<th>Flight No</th>
				<th>Airline Name</th>
				<th>Price</th>
				<th>Source City</th>
				<th>Destination City</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Available Seats</th>
				<th>Class</th>
			</tr>
			<c:forEach var="table" items="${rs.rows}">
				<tr>

					<td><c:out value="${table.flight_no}" /></td>
					<td><c:out value="${table.airline_name}" /></td>
					<td><c:out value="${table.price}" /></td>
					<td><c:out value="${table.source_city}" /></td>
					<td><c:out value="${table.destination_city}" /></td>
					<td><c:out value="${table.departure_time}" /></td>
					<td><c:out value="${table.arrival_time}" /></td>
					<td><c:out value="${table.seat_availibility}" /></td>
					<td><c:out value="${table.flight_class}" /></td>
					<c:set scope="session" var="flightnum" value="${table.flight_no}" />
					<c:set scope="session" var="flight_price" value="${table.price}" />
					<c:set scope="session" var="flight_class" value="${table.flight_class}" />
					<td><a href="registerdetails.jsp?flightId=${table.flight_no}">Book
							Flight</a></td>
					</form>
				</tr>
			</c:forEach>
		</table>
	</c:if>


</body>
</html>
