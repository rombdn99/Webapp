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
		try{
			String firstname=request.getParameter("first_name");
			String lastname=request.getParameter("last_name");
			String email=request.getParameter("email");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			DatabaseConfiguration dbconf= new DatabaseConfiguration();
			Connection conn=DriverManager.getConnection(dbconf.getPropValues(),dbconf.getUser(),dbconf.getPwd());
			Statement st = conn.createStatement();
			ResultSet rs =st.executeQuery("SELECT * FROM raul_myguests");
			
			while(rs.next()){
	%>
				<tr>
					<td><%= rs.getInt("id") %></td>
					<td><%= rs.getString("firstname") %></td>
					<td><%= rs.getString("lastname") %></td>
					<td><%= rs.getString("email") %></td>
					<td><a href="<%=response.encodeURL(request.getContextPath()+"/updateGuest.jsp?id="+rs.getInt("id"))%>">Update</a></td>
					<td><a href="<%=response.encodeURL(request.getContextPath()+"/deleteGuest.jsp?id="+rs.getInt("id"))%>">Delete</a></td>
				</tr>
	<%
			}
			st.close();
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
	
	%>
	
	</table>
	<a href="<%=response.encodeURL(request.getContextPath()+"/index.jsp") %>">Return</a>
</body>
</html>