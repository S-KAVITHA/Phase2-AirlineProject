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


	<div align="center">
		<form action="reviewdetails.jsp">
			<font color="blue"><h2>Register Your Details Here!!!</h2></font> <br>
			Enter User name <input type="text" name="username"> <br>
			<br> Enter Full Name <input type="text" name="fullname"><br>
			<br> Enter Address <input type="text" name="address"> <br>
			<br> Enter Age <input type="number" name="age"> <br>
			<br> Enter Mobile <input type="number" name="mobile"> <br>
			<br> Enter Identity Type <select name="idcard">
				<lablel>Enter Identity Type </lablel>
				<option value="Adhar card">Adhar card</option>
				<option value="SSN">SSN</option>
				<option value="Passport">Passport</option>
				<option value="Voter ID">Voter ID</option>
				<option value="Driving license">Driving license</option>
			</select> <br> <br> Enter Identity No <input type="text" name="idno"><br>
			<br> Enter Country <input type="text" name="country"> <br>
			<br>
			<button>Review</button>
			<br> <br>
		</form>
		<centre> <strong><font color="red"><c:if
					test="${not empty param.errMsg}">
					<c:out value="${param.errMsg}" />
				</c:if></font></strong>
		</center>
	</div>

	
</body>
</html>