<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
 
  
  <!-- DataTables -->
  <link rel="stylesheet" href="//cdn.datatables.net/1.10.1/css/jquery.dataTables.css"/>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="//cdn.datatables.net/1.10.1/js/jquery.dataTables.js"></script>    
  
  <!-- Calendar -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
  <!-- Main bootstrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <c:url var="style1" value="/resources/css/header.css"></c:url>
<link rel="stylesheet" href="${style1}"/>

<c:url var="script8" value="/resources/js/angular.min.js"></c:url>
<script src="${script8}"></script> 
  

</head>
<body>

  <nav class="navbar navbar-default ">
    <div class="container-fluid">
    <div class="navbar-header">
    <a class="navbar-brand" href="#"><strong>genus<em>cart</em></strong></a>
</div>
        <ul class="nav navbar-nav">
          <li class="pull-left"><a href="home">Home</a></li>
           
           <li class="pull-left"><a href="aboutus">About</a></li>
           
           <c:if test="${pageContext.request.userPrincipal.name!=null }">
           <security:authorize access="hasRole('ROLE_ADMIN')">
            <c:url var="productform" value="/admin/product/Productform"></c:url>
     <li><a class="two" href="${productform }"><span class="one">Add New Product</span></a></li>
           </security:authorize>
          
           <c:url var="allproducts" value="/all/product/getallproducts"></c:url>
     <li><a href="${allproducts }"><span class="one">Browse products</span></a></li>
    
     
          <li class="dropdown">
        <a id="uni" href="" class="dropdown-toggle" data-toggle="dropdown"><span id="on">Select By Category</span><b class="caret"></b></a>  
              <ul class="dropdown-menu">
                  
                  <c:url var="url1" value="/all/product/productsByCategory?searchCondition=New Arrivals"></c:url>
                  <li><a id="uni" href="${url1}"><span id="on">New Arrivals</span></a></li>
                  <c:url var="url2" value="/all/product/productsByCategory?searchCondition=Old"></c:url>
                  <li><a id="uni" href="${url2}"><span id="on">Old</span></a></li>
                  <c:url var="url3" value="/all/product/productsByCategory?searchCondition=Discount"></c:url>
                  <li><a id="uni" href="${url3}"><span id="on">Discount</span></a></li>
              </ul>
    </li> 
    <security:authorize access="hasRole('ROLE_USER')">
    <c:url var="cart" value="/cart/getCartId"></c:url>
    <li><a href="${cart }"><span class="on">Cart</span></a></li>
    </security:authorize>
    
     <li><a href=""><span class="on">welcome ${pageContext.request.userPrincipal.name}</span></a></li>
     </c:if>
       <!-- when user not logged in -->
    <c:if test="${pageContext.request.userPrincipal.name==null }">
    <li><a href="<c:url value="/all/registrationForm"></c:url>"><span class="on">Register</span></a></li>
    
     <c:url var="login" value="/login"></c:url>
     <li><a  href="${login}"><span class="on">Login</span></a></li>
     </c:if>
     
    <!-- when user want to log out -->
     <c:if test="${pageContext.request.userPrincipal.name!=null }">
     <li><a href="<c:url value="/j_spring_security_logout"></c:url>"><span class="on">logout</span></a></li>
     </c:if>
       </ul>
       
    </div>
    </nav>
   </body>
</html>

