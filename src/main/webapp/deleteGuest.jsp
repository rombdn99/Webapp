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
			String id=request.getParameter("id");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			DatabaseConfiguration dbconf= new DatabaseConfiguration();
			Connection conn=DriverManager.getConnection(dbconf.getPropValues(),dbconf.getUser(),dbconf.getPwd());
			Statement st = conn.createStatement();
			st.executeUpdate("delete from raul_myguests where id="+id+";");
			
			out.write("guest Deleted!");
			
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/showGuests.jsp") %>">Return</a>
</body>
</html>