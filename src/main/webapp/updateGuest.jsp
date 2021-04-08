<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
	String id=request.getParameter("id");
	out.println("SELECT * FROM raul_myguests where id="+id);
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
			"bfeb87d5f03af0","ce5d6745");
	Statement st = conn.createStatement();
	ResultSet rs =st.executeQuery("SELECT * FROM raul_myguests where id="+id);
	String firstname="";
	String lastname="";
	String email="";
	while(rs.next()){
		out.println(0);
		firstname=rs.getString("firstname");
		lastname=rs.getString("lastname");
		email=rs.getString("email");
	}
	out.println(firstname);
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
      <a href="<%=response.encodeURL(request.getContextPath()+"/showGuests.jsp") %>">Return</a>
</body>
</html>