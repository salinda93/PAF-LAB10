<%@page import="models.*"%>
<%@page import="javax.sql.*"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	Item item = new Item();
	String itemsGrid = "";
	String rudeFeedback = "";
	
	if(request.getParameter("hidMode") != null && request.getParameter("hidMode").equals("save")){
		rudeFeedback = item.saveAnItem(request.getParameter("txtItemName"), request.getParameter("txtItemDesc"));
	}
	if(request.getParameter("hidMode") != null && request.getParameter("hidMode").equals("update")){
		rudeFeedback = item.updateAnItem(request.getParameter("hidID"), request.getParameter("txtItemName"), request.getParameter("txtItemDesc"));
	}
	if(request.getParameter("hidMode") != null && request.getParameter("hidMode").equals("remove")){
		rudeFeedback = item.deleteAnItem(request.getParameter("hidID"));
	}
	itemsGrid = item.getItems();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items</title>
<script type="text/javascript" src=Controllers/jquery-3.4.1.min.js></script>
<script type="text/javascript" src=Controllers/controllerMain.js></script>

</head>
<body>

<form id="fromItems" action="items.jsp" method="post">
   <input id="hidMode" name="hidMode" type="hidden" value="save">
   <input id="hidID" name="hidID" type="hidden" value="0">
   Item Name: <input id="txtItemName" type= "text" name="textItemDesc"><br>
   Item Description: <input id="textItemDesc" type="text" name="textItemDesc"><br>
   <input id="btnsave" name="button" type="hidden" value="save"><br></br>
   
   <div id="divStsMsgItem"><%out.println(rudeFeedback); %></div>
   <%out.println(itemsGrid); %>
   
</form></br>

</body>
</html>