<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:set scope="session" var="fullname" value="${param.fullname}" />
	<c:set scope="session" var="address" value="${param.address}" />
	<c:set scope="session" var="age" value="${param.age}" />
	<c:set scope="session" var="mobile" value="${param.mobile}" />
	<c:set scope="session" var="idcard" value="${param.idcard}" />
	<c:set scope="session" var="idnum" value="${param.idno}" />
	<c:set scope="session" var="country" value="${param.country}" />


<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/db_world" user="root"
			password="root" />

<sql:update dataSource="${db}" var="count"> 
				INSERT INTO userinfo  (User_Name,Full_Name,Address,Age,mobile,Identity_card,country) VALUES ('${param.username}','${param.fullname}','${param.address}','${param.age}','${param.mobile}','${param.idcard}','${param.country}');  
			</sql:update>
			
			
			

<div align="Left">
<font color="blue"><h2>Review Your Details Here !!!</h2></font><br>
<h4><pre class="tab14">User Name : <c:out value="${param.username}"/>			         Full Name :<c:out value="${param.fullname}"/> </pre></h4>

<h4><pre class="tab">Address : <c:out value="${param.address}"/>	          Age : <c:out value="${param.age}"/></pre></h4>

<h4><pre class="tab20">Contact No : <c:out value="${param.mobile}"/> 			      ID Card : <c:out value="${param.idcard}"/></pre></h4>

<h4><pre class="tab36">ID Number : <c:out value="${param.idno}"/> 			          Country : <c:out value="${param.country}"/></pre></h4>

<h4><pre class="tab14">Flight No : <c:out value="${sessionScope.flightnum}"/>			        Travel Date :<c:out value="${sessionScope.datetravel}"/> </pre></h4>

<h4><pre class="tab">Source City : <c:out value="${sessionScope.sourcecty}"/>			        Destination City : <c:out value="${sessionScope.destcty}"/></pre></h4>

<h4><pre class="tab20">Total Travelers : <c:out value="${sessionScope.availseat}"/>   					Price : <c:out value="${sessionScope.flight_price}"/></pre></h4>


<h4><pre class="tab20">Flight Class : <c:out value="${sessionScope.flight_class}"/>  </pre></h4> 

</div>
<div align="Left">
		<form action="displaydetails.jsp">
			<font color="blue"><h2>Enter Your Payment Details Here!!!</h2></font> <br>
			<h4>Enter Card Number  <input type="text" name="cardno"></h4> 
			<h4>Enter Expiry Date <input type="text" name="expiry"></h4>
			 <h4>Enter CVV <input type="number" name="cvv"></h4>
			 <h4>Enter Amount <input type="number" name="amount"></h4><br>
		 	<button><h7>Submit Payment</h7></button>
			<br> <br>
		</form>
</div>


</body>
</html>