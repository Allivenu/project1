var app = angular.module("app",[]);
app.controller("ProductController",function($scope,$http){
	
	$scope.addToCart = function(productId){
		
		$http.put('http://localhost:8081/Project/cart/addCartItem/'+productId).then(function(){
			alert("successfully added to the cart");
		});
	}
  
	$scope.getCart=function(cartId){
		
		$scope.cartId = cartId;
		
		$http.get('http://localhost:8081/Project/cart/getCart/'+cartId).then(function(data){
			$scope.cart=data;
			console.log($scope.cart);
		});
	}
  $scope.removeFromCart=function(cartItemId){
	  
	  $http.put('http://localhost:8081/Project/cart/removeCartItem/'+cartItemId).success(function(){
		  $scope.getCart($scope.cartId);
	  });
  }
  $scope.clearCart=function(){
	
	 $http.put('http://localhost:8081/Project/cart/removeAllCartItems/'+$scope.cartId).success(function(){
		 $scope.getCart($scope.cartId);
	 })
  }
  $scope.calculateGrandTotal=function(){
	  var grandTotal = 0.0;
	  for(i=0;i<$scope.cart.cartItems.length;i++){
		   grandTotal = grandTotal+$scope.cart.cartItems[i].totalPrice;
	  }
	  return grandTotal;
  }
});