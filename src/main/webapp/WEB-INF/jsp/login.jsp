<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<%@include file="header.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
<style>
body{
color : white;

}
form{
color : red;

}
  .move{
  
  padding : 200px;
  }
</style>
</head>
<body background="E:\laptop (1).jpg">
<div class="move" >
<c:url var="security" value="j_spring_security_check"></c:url>
${error }
${logout }
 ${registersuccess}
<form action="${security}" method="post">
Enter UserName <input type="text" name="j_username"><br><br>
Enter Password <input type="password" name="j_password"><br>
<input type="submit" value="submit">
</form>
</div>
</body>
</html>