
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.sql.*" %>
<%@ page import="com.webapp.configuration.DatabaseConfiguration" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@page import="com.mongodb.client.model.Filters"%>
<%@ page import="com.mongodb.client.MongoCursor" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		
		
			String id=request.getParameter("id");
			
			MongoClientURI uri = new MongoClientURI(
					 "mongodb+srv://root:root@cluster0.cbnab.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");			
			MongoClient mongoClient = new MongoClient(uri);
			MongoDatabase database = mongoClient.getDatabase("Guests");
			MongoCollection<Document> collection=database.getCollection("guests");
			collection.findOneAndDelete(Filters.eq("_id",Integer.parseInt(id)));
			out.write("guest Deleted!");
			
		 
			mongoClient.close();
		
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/mongo/showGuests.jsp") %>">Return</a>
</body>
</html>