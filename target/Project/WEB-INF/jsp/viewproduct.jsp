

<!DOCTYPE html>
    <%@ include file="header.jsp"%>
<html>
<head>

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>
<body>
<div ng-app="app" ng-controller="ProductController">

<div class="page-header">
<b>PRODUCT DETAILS</b>
</div>
<table class="table">
<tr>
<td>Product name</td>
<td>${product.name}</td>
</tr>
<tr>
<td>Price</td>
<td>${product.price}</td>
</tr>
<tr>
<td>Quantity</td>
<td>${product.quantity}</td>
</tr>
<tr>
<td>Date manufactured</td>
<td>${product.dtg}</td>
</tr>
<tr>
<td>Product Description</td>
<td>${product.description}</td>
</tr>

<tr>
<td>
			</td>
			
			<td><a href="" ng-click="addToCart(${product.id })"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
			</tr>
</table>

</div>

<c:url var="script6" value="/resources/js/controller.js"></c:url>
<script src="${script6}"></script> 
</body>
</html>