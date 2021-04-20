<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.webapp.configuration.DatabaseConfiguration" %>
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
			DatabaseConfiguration dbconf= new DatabaseConfiguration();
			Connection conn=DriverManager.getConnection(dbconf.getPropValues(),dbconf.getUser(),dbconf.getPwd());
			Statement st = conn.createStatement();
			st.executeUpdate("INSERT INTO raul_myguests (firstname, lastname,email)"
					+"VALUES ('"+firstname+"', '"+lastname+"','"+email+"')");
			out.write("guest "+firstname+" "+lastname+" inserted!");
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/index.jsp") %>">Return</a>
</body>
</html>