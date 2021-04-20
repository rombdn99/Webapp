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
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_e64aed2083389e0",
					"bfeb87d5f03af0","ce5d6745");
			
			CallableStatement cStmt = conn.prepareCall("{call raul_deleteGuests(?)}");
			cStmt.setInt(1, Integer.parseInt(id));
			cStmt.execute();
			/*Statement st = conn.createStatement();
			st.executeUpdate("delete from raul_myguests where id="+id+";");
			*/
			out.write("Guest Deleted!");
			
			conn.close();
		} catch(SQLException e){
			out.println("SQLException caught: "+e.getMessage());
		}
		
	
%>
<a href="<%=response.encodeURL(request.getContextPath()+"/StoreProcedure/showGuests.jsp") %>">Return</a>
</body>
</html>