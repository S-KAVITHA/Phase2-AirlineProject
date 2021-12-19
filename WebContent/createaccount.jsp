<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>sql:query Tag</title>
</head>
<body>


	<c:if
		test="${(empty param.username) or (empty param.password) or (empty param.repassword) }">

		<c:redirect url="Createuser.jsp">
			<c:param name="errMsg" value="Error: Mandatory Input Missing" />
		</c:redirect>

	</c:if>


	<c:if test="${param.repassword != param.password}">
		<c:redirect url="Createuser.jsp">
			<c:param name="errMsg" value="Error: Password Mismatch" />
		</c:redirect>

	</c:if>

	<c:if
		test="${(not empty param.username) or (not empty param.password) or (not empty param.repassword) }">
		<!-- sql:setDataSource tag -->
		<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/db_world" user="root"
			password="root" />

		<sql:query dataSource="${db}" var="rs">  
			SELECT * from userlogin  WHERE username="${param.username}";  
			
	</sql:query>

		<c:forEach var="table" items="${rs.rows}">
			<c:set var="get_user" value="${table.username}" />
			<c:set var="get_pwd" value="${table.password}" />
			

			<c:if test="${(get_user eq param.username)}">
				<c:redirect url="Createuser.jsp">
					<c:param name="errMsg" value="Error: User Already exists" />
				</c:redirect>
			</c:if>
		</c:forEach>


		<c:if test="${rs.rowCount lt 1 }">

			<!-- sql:update tag to INSERT -->
			<sql:update dataSource="${db}" var="count"> 
				INSERT INTO userlogin VALUES ('${param.username}','${param.password}');  
			</sql:update>


			<centre> <strong><font color="blue"><h2>

						<c:out value="${'Congrats !!! Account Created Succesfully !!!'}" />
					</h2></font></strong>
			</center>

			<a href="Flyawaylogin.jsp"><h2>Click here to go back to
					login page</h2></a> <br>
		</c:if>

	</c:if>


</body>
</html>
