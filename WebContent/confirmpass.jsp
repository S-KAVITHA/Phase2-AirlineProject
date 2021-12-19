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

	<c:if
		test="${(empty param.username) or (empty param.oldpass) or (empty param.newpass)}">
		<c:redirect url="Changepwd.jsp">
			<c:param name="errMsg" value="Error: Mandatory Input Missing" />
		</c:redirect>

	</c:if>

	<c:if test="${param.oldpass eq param.newpass}">
		<c:redirect url="Changepwd.jsp">
			<c:param name="errMsg" value="Error: Enter New Password" />
		</c:redirect>

	</c:if>
	

	<c:if
		test="${(not empty param.username) and (not empty param.oldpass) and (not empty param.newpass)}">
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
			

			<c:if
				test="${(get_user eq param.username) and (get_pwd != param.oldpass)}">
				<c:redirect url="Changepwd.jsp">
					<c:param name="errMsg" value="Error: Old Password doesnot match" />
				</c:redirect>
			</c:if>
		</c:forEach>


		<!-- sql:update tag to update -->

		<sql:update dataSource="${db}" var="rs">
         UPDATE userlogin SET password="${param.newpass}"
         WHERE username="${param.username}"
               
     </sql:update>

		<centre> <strong><font color="blue"><h2>

					<c:out value="${'Password Change Succesfull !!!'}" />
				</h2></font></strong>
		</center>

		<a href="Flyawaylogin.jsp"><h2>Click here to go back to login
				page</h2></a> <br>
	</c:if>
</body>


</html>
