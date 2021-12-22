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
		<form action="confirmpass.jsp">
			<font color="blue"><h2>Change Your Password Here!!!</h2></font> <br>
			Enter User name <input type="text" name="username"> <br><br> 
			Enter old password <input type="password" name="oldpass"><br> <br> 
			Enter new Password <input type="password" name="newpass"> <br> <br>
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