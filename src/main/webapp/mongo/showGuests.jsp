<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.webapp.configuration.DatabaseConfiguration" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>

<%@ page import="com.mongodb.client.MongoCursor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>id</td>
			<td>first name</td>
			<td>last name</td>
			<td>Email</td>
			<td>Update</td>
			<td>Delete</td>
		</tr>
	
		
	<%
	MongoClientURI uri = new MongoClientURI(
			 "mongodb+srv://root:root@cluster0.cbnab.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
	
	
	MongoClient mongoClient = new MongoClient(uri);
	MongoDatabase database = mongoClient.getDatabase("Guests");
	MongoCollection<Document> collection=database.getCollection("guests");
	MongoCursor<Document> cursor = collection.find().iterator();
	StringBuilder str = new StringBuilder();
	try {
		
		str.append("");
	    while (cursor.hasNext()) {
	   			Document dc=cursor.next();
	   			
	   			str.append("<tr><td>"+dc.getInteger("_id") +"</td>");
	   			str.append("<td>"+dc.getString("firstname") +"</td>");
	   			str.append("<td>"+dc.getString("lastname") +"</td>");
	   			str.append("<td>"+dc.getString("email") +"</td>");
	   			str.append("<td><a href='"+response.encodeURL(request.getContextPath()+"/mongo/updateGuest.jsp?id="+dc.getInteger("_id"))+"'>Update</a></td>");
	   			str.append("<td><a href='"+response.encodeURL(request.getContextPath()+"/mongo/deleteGuest.jsp?id="+dc.getInteger("_id"))+"'>Delete</a></td></tr>");
	    }
	} finally {
		mongoClient.close();
	    cursor.close();
	    str.append("</table>");
	    out.write(str.toString());
	}
	
	%>
	
	</table>
	<a href="<%=response.encodeURL(request.getContextPath()+"/mongo/index.jsp") %>">Return</a>
</body>
</html>