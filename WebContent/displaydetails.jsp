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
			url="jdbc:mysql://localhost:3306/db_world" user="root"
			password="root" />

<sql:update dataSource="${db}" var="count"> 
				INSERT INTO flightbook  (email_id,flight_no,source_city,dest_city,travel_date,tot_passenger,price,flight_class) VALUES ('${sessionScope.loginUser}','${sessionScope.flightnum}','${sessionScope.sourcecty}','${sessionScope.destcty}','${sessionScope.datetravel}','${sessionScope.availseat}','${sessionScope.flight_price}','${sessionScope.flight_class}');  
			</sql:update>
			
			
			<font color="blue"><h2>Congrats Your Airline Booking is Succesfully Done !!!</h2></font><br>
			
<h4><pre class="tab14">User Name : <c:out value="${sessionScope.loginUser}"/>			         Full Name :<c:out value="${sessionScope.fullname}"/> </pre></h4>

<h4><pre class="tab">Address : <c:out value="${sessionScope.address}"/>	          Age : <c:out value="${sessionScope.age}"/></pre></h4>

<h4><pre class="tab20">Contact No : <c:out value="${sessionScope.mobile}"/> 			      ID Card : <c:out value="${sessionScope.idcard}"/></pre></h4>

<h4><pre class="tab36">ID Number : <c:out value="${sessionScope.idnum}"/> 			          Country : <c:out value="${sessionScope.country}"/></pre></h4>

<h4><pre class="tab14">Flight No : <c:out value="${sessionScope.flightnum}"/>			        Travel Date :<c:out value="${sessionScope.datetravel}"/> </pre></h4>

<h4><pre class="tab">Source City : <c:out value="${sessionScope.sourcecty}"/>			        Destination City : <c:out value="${sessionScope.destcty}"/></pre></h4>

<h4><pre class="tab20">Total Travelers : <c:out value="${sessionScope.availseat}"/>   					Price : <c:out value="${sessionScope.flight_price}"/></pre></h4>

<h4><pre class="tab20">Flight Class : <c:out value="${sessionScope.flight_class}"/>  </pre></h4> 
			
<h4><a href="flightwelcome.jsp" style="color:blue">Go Back to Home Page</a></h4>
	<br>

<centre><h4>
<jsp:text>
       Thank You for booking with us! Visit us again !!!
</jsp:text>

</h4></centre>

</body>
</html>