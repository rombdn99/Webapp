<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "createGuest.jsp" method = "GET">
         First Name: <input type = "text" name = "first_name" required>
         <br />
         Last Name: <input type = "text" name = "last_name" required />
         <br />
         Email: <input type = "text" name = "email" required  />
         <input type = "submit" value = "Submit" />
      </form>
      <a href="<%=response.encodeURL(request.getContextPath()+"/mongo/index.jsp") %>">Return</a>
</body>
</html>