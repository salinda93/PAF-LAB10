<%@page import="models.*"%>
<%@page import="javax.sql.*" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%

	User user = new User();
	String loginMsg = "Please Login to Continue...";
	if(request.getMethod().equalsIgnoreCase("post")){
		if(user.login(request.getParameter("txtUserName"), request.getParameter("txtPassword")).equals("SUCCESS")){
			
			//RequestDispatcher is used to send controll to the invoked page
			request.getRequestDispatcher("/items.jsp").forward(request, response);
		}
		else{
			loginMsg = "Invalid credential";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script type="text/javascript" src=Controllers/jquery-3.4.1.min.js></script>
<script type="text/javascript" src=Controllers/controllerMain.js></script>

</head>
<body>

<form id="fromLogin" action="index.jsp" method="post">
   UserName <input id="textUserName" name="textUserName" type="text"><br>
   Password <input id="textPassword" name="textPassword" type="password"><br>
   <input id="btnLogin" name="btnLogin" type="button" value="Login"><br>
   <div id="divStsMsgLogin"><%out.println(loginMsg); %></div>

</form>

</body>
</html>