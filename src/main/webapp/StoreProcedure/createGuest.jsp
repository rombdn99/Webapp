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
		
		try{
			String firstname=request.getParameter("first_name");
			String lastname=request.getParameter("last_name");
			String email=request.getParameter("email");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
					"bfeb87d5f03af0","ce5d6745");
			
			CallableStatement cStmt = conn.prepareCall("{call raul_addGuests(?,?,?)}");
			cStmt.setString(1, firstname);
			cStmt.setString(2, lastname);
			cStmt.setString(3, email);
			cStmt.execute();
			
			out.write("guest "+firstname+" "+lastname+" inserted!");
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/StoreProcedure/index.jsp") %>">Return</a>
</body>
</html>