<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.webapp.configuration.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
HELLO WORLD
<h1>Test Conexion</h1>
	<%
		/*DatabaseConfiguration dc = new DatabaseConfiguration();
		out.write(dc.getPropValues());*/
	%>
      <a href="<%=response.encodeURL(request.getContextPath()+"/addGuest.jsp") %>">Add Guest</a>
      <a href="<%=response.encodeURL(request.getContextPath()+"/showGuests.jsp") %>">Show Guest</a>
</body>

</html>