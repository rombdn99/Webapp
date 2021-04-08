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
			String id=request.getParameter("id");
			String firstname=request.getParameter("first_name");
			String lastname=request.getParameter("last_name");
			String email=request.getParameter("email");
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
					"bfeb87d5f03af0","ce5d6745");
			Statement st = conn.createStatement();
			st.executeUpdate("update raul_myguests set firstname='"+firstname+"', lastname='"+lastname+"',email='"+
			email+"' where id="+id+";");
			out.write("update raul_myguests set firstname='"+firstname+"', lastname='"+lastname+"',email='"+
					email+"' where id="+id+";");		
			out.write("guest "+firstname+" "+lastname+" Updated!");
			
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/showGuests.jsp") %>">Return</a>
</body>
</html>