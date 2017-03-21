<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<title>productform</title>
<script>
$(function(){
	$('input[name=dtg]').datepicker({
		format:'YYYY-mm-dd'
	});
});
</script>
<style>
body{
color : white;
margin-left : 3%;
margin-right : 3%;
}
</style>

</head>
<body background="E:\background.jpg">
<div class="container-wrapper">
<div class="container">
<c:url var="addAction" value="addproduct"></c:url>
<form:form id="registerform" modelAttribute="product" method="post"   action="${addAction}" enctype="multipart/form-data">
<div class="form-group">
<label for="id"></label>
<form:hidden path="id"/>
</div>
 <div class="form-group">
<label for="name">Product name</label>
<form:input path="name" class="form-control"/>
<form:errors path="name" cssstyle="color:#ff0000"></form:errors>
</div>
<div class="form-group">
<label for="description">Description</label>
<form:input path="description" class="form-control"/>
<form:errors path="description" cssstyle="color:#ff0000"></form:errors>
</div>
<div class="form-group">
<label for="price">Price</label>
<form:input path="price" class="form-control"/>
<form:errors path="price" cssstyle="color:#ff0000"></form:errors>
</div>
<div class="form-group">
<label for="quantity">Quantity</label>
<form:input path="quantity" class="form-control"/>
</div>
<div class="form-group">
<label for="dtg">Manufactured Date</label>
<form:input path="dtg" type="Date" class="form-control"/>
</div>

<div class="form-group">
<label for="category">Category</label>
<c:forEach var="c" items="${categories}">
<form:radiobutton path="category.id" value="${c.id}"/>${c.categorydetails }
</c:forEach>

</div>
<div class="form-group">
   <label for="image">Image</label>
   <input name="fileUpload" type="file"/>
  </div>
  
<input type="submit" value="Add product" class="btn btn-default">
</form:form>
</div>
</div>
</body>
</html> 