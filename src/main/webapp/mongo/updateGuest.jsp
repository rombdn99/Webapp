<%@page import="com.mongodb.client.model.Filters"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.webapp.configuration.DatabaseConfiguration" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="com.mongodb.MongoClientURI" %>
<%@ page import="com.mongodb.client.MongoDatabase" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.model.Filters.*" %>

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
	
	
	try(MongoClient mongoClient = new MongoClient(uri)){
	MongoDatabase database = mongoClient.getDatabase("Guests");
	MongoCollection<Document> collection=database.getCollection("guests");
	
	MongoCursor<Document> cursor = collection.find(Filters.eq("_id",Integer.parseInt(id))).iterator();

	String firstname="";
	String lastname="";
	String email="";
	
	out.print(cursor.hasNext());
	 while(cursor.hasNext()){
		Document dc=cursor.next();
		out.print(dc.getString("firstname"));
		firstname=dc.getString("firstname");
		lastname=dc.getString("lastname");
		email=dc.getString("email");
	}
	
		
	
%>
	<form action = "updateinfoGuest.jsp" method = "POST">
         First Name: <input type = "text" name = "first_name" value="<%= firstname %>" required>
         <br />
         Last Name: <input type = "text" name = "last_name" value="<%= lastname %>" required />
         <br />
         Email: <input type = "text" name = "email" value="<%= email %>" required  />
         <input type = "hidden" name="id" value = "<%= id %>" />
         <input type = "submit" value = "Submit" />
      </form>
      <a href="<%=response.encodeURL(request.getContextPath()+"/mongo/showGuests.jsp") %>">Return</a>
      <%
	}finally{
		
    }
	%>
</body>
</html>