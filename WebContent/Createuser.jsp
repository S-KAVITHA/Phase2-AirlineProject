<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Create your account here !!!</title>
</head>
<body>


	<div align="center">
		<form action="createaccount.jsp">
			<font color="blue"><h2>Create Your Account Here!!!</h2></font> <br>
			Enter User name <input type="text" name="username"> <br>
			<br> Enter password <input type="password" name="password">
			<br> <br> Re-Enter Passwd <input type="password"
				name="repassword"> <br> <br>
			<button>Submit</button>
			<br> <br>
		</form>
		<centre> <strong><font color="red"><c:if test="${not empty param.errMsg}">
					<c:out value="${param.errMsg}" />
				</c:if></font></strong>
		</center>
	</div>




</body>
</html>