<%@page import="com.mongodb.client.model.Sorts"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.mongodb.MongoClient" %>
    <%@ page import="com.mongodb.MongoClientURI" %>
    <%@ page import="com.mongodb.client.MongoDatabase" %>
    <%@ page import="com.mongodb.client.MongoCollection" %>
     <%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.model.Sorts.*" %>
     <%@ page import="com.mongodb.client.MongoCursor" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
		String firstname=request.getParameter("first_name");
		String lastname=request.getParameter("last_name");
		String email=request.getParameter("email");
		
		
			MongoClientURI uri = new MongoClientURI(
					 "mongodb+srv://root:root@cluster0.cbnab.mongodb.net/myFirstDatabase?retryWrites=true&w=majority");
			
			
			MongoClient mongoClient = new MongoClient(uri);
			MongoDatabase database = mongoClient.getDatabase("Guests");
			MongoCollection<Document> collection=database.getCollection("guests");
			Document doc = new Document("_id",(collection.find().sort(Sorts.descending("_id")).limit(1).first().getInteger("_id")+1))
					.append("firstname", firstname)
	                .append("lastname", lastname)
	                .append("email", email);
	        collection.insertOne(doc);
		
	mongoClient.close();
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/mongo/index.jsp") %>">Return</a>
</body>
</html>