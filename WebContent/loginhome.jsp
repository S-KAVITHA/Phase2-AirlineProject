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

	<c:if test="${(empty param.username) or (empty param.password)}">
		<c:redirect url="Flyawaylogin.jsp">
			<c:param name="errMsg" value="Error: Mandatory Input Missing" />
		</c:redirect>

	</c:if>
	
	<c:if test="${(not empty param.username) and  (not empty param.password)}">

	<!-- sql:setDataSource tag -->
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_world" user="root" password="root" />

	<sql:query dataSource="${db}" var="rs">  
			SELECT * from userlogin  WHERE username="${param.username}" and password="${param.password}";  
			
	</sql:query>
	

 	<c:if test="${rs.rowCount gt 0 }">
 	<c:set scope="session" var="loginUser" value="${param.username}" />
	</c:if>
	
	
	<c:if test="${rs.rowCount lt 1 }">
		<c:redirect url="Flyawaylogin.jsp">
			<c:param name="errMsg" value="Error: Invalid Credentials" />
		</c:redirect>
	</c:if> 

	</c:if>
		

 <jsp:forward page="flightwelcome.jsp"></jsp:forward>

</body>
</html>