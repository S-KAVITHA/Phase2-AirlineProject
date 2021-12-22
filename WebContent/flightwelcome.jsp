<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<font color="blue"><h2>Welcome to FlyAway Online Airline Reservation System!!! Home page !!!</h2></font>
	<br>
	
	 <c:set var = "str1" value = "${sessionScope.loginUser}"/>
	 
	<font color="blue"><h3>Hello  ${fn:substringBefore(str1, "@")}  !!!</h3></font><br>
	
	
	<h4><a href="searchinput.jsp" style="color: blue">Search Flights</a></h4>
	
	<h4><a href="listflights.jsp" style="color: blue">List Booked Flights</a></h4>
	
	
	<form action="sessionlogout.jsp">
			<button><h7>Logout</h7></button>
			<br> <br>
	
	<br>
	
	
</body>
</html>