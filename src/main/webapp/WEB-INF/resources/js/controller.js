var myapp=angular.module("myapp",[])
.controller("bookController",function($scope,$http){
	
	
	 $scope.getBooks=function(){
		 $http.get('http://localhost:8088/Hibernate/getBooksList').success(function(data){
			 $scope.books=data;
		  })
	  }
	   
	  $scope.addToCart=function(isbn) {
		  $http.put('http://localhost:8088/Hibernate/cart/add/' + isbn).success(function() {
			  alert('Book successfully added to the cart!')
		  })
	  }
	  
	    $scope.refreshCart=function(){
	    	$http.get('http://localhost:8088/Hibernate/cart/getCart/'+$scope.cartId).success(function(data){
	    		$scope.cart=data;
	    	})
	    } 
	    $scope.getCart=function(cartId){
	    	$scope.cartId=cartId;
	    	$scope.refreshCart(cartId);
	    }
	    
	   
	    $scope.removeFromCart=function(cartItemId){
	    	$http.put('http://localhost:8088/Hibernate/cart/removecartitem/'+cartItemId).success(function(){
		        $scope.refreshCart();
		        alert('selected Item removed successfully')
	        })
        }
	    

	     $scope.clearCart=function(){
	    	$http.put('http://localhost:8088/Hibernate/cart/removeAllItems/'+$scope.cartId).success(function(){
		        $scope.refreshCart();
		        alert('Cart is clear successfully')
	         })
        }
	    
	    $scope.calculateGrandTotal=function(){
	    	var grandTotal=0.0;
	    	for(var i=0;i<$scope.cart.cartItem.length;i++)
	    		{
	    		   grandTotal=grandTotal+$scope.cart.cartItem[i].price;
	    		}  
	    	        return grandTotal;
	       	
	    }
	    
	});

