<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>genus</title>

<c:url var="style2" value="/resources/css/section.css"></c:url>
  <link rel="stylesheet" href="${style2}"/> 
</head>
<body>
  <div class="sec">
  <div class="go">
  <h1>Discover the Difference</h1>
  <h2><a href="http://localhost:8080/Project/all/product/getallproducts">Shop now</a></h2>
  </div>
  </div>
  
<div class="gallery">
  <a target="_blank" href="E:\apple-laptop-129502.jpg">
    <img src="E:\apple-laptop-129502.jpg" alt="Trolltunga Norway" width="300" height="200">
  </a>
  <div class="desc">Advanced laptop</div>
</div>

<div class="gallery">
  <a target="_blank" href="E:\Lenovo-Yoga.jpg">
    <img src="E:\Lenovo-Yoga.jpg" alt="Forest" width="600" height="400">
  </a>
  <div class="desc">yogalaptop</div>
</div>

<div class="gallery">
  <a target="_blank" href="E:\Lenovo-G450-with-Intel-T4300.jpg">
    <img src="E:\Lenovo-G450-with-Intel-T4300.jpg" alt="Northern Lights" width="600" height="400">
  </a>
  <div class="desc">vivo laptop</div>
</div>

<div class="gallery">
  <a target="_blank" href="E:\laptop1.png">
    <img src="E:\laptop1.png" alt="Mountains" width="600" height="400">
  </a>
  <div class="desc">super lapy</div>
</div>
  
</body>
</html>