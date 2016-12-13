<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="header.jsp" %>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body style="background-color:LightGray;">

<div class="container-wrapper">
   <div class="container" style="background-image:url('resources/images/cart.jpg');">
     <section>
        <div class="jumbotron">
          <div class="container">
                           
          <h3>Cart</h3>
          <p>All the selected books in your shopping cart</p>

          </div>
        </div>
      </section>

<div ng-app="myapp" ng-controller="bookController">

<div ng-init="getCart(${cartId})">


    <h3> List of books purchased</h3>
     
<br>

     <div>
           <a class="btn btn-danger pull-left" ng-click = "clearCart()">
                  <span class="glyphicon glyphicon-remove-sign"></span> Clear Cart</a>
                  
           <a href="<c:url value="/order/${cartId }" ></c:url>" class="btn btn-success pull-right"> 
                  <span class="glyphicon glyphicon.shopping-cart"></span>Check-out</a>
 
      </div>

<br>
<br>
       <table class="table table-hover">
         <thead>
              <tr>
                  <th>TITLE</th>
                  <th>QUANTITY</th>
                  <th>Price</th>
                  <th>TOTAL PRICE</th>
                  <th>REMOVE FROM CART</th>
             </tr>

         </thead>
         
            <tr ng-repeat="cartitem in cart.cartItem">
            
              <td>{{cartitem.book.title}}</td>
              <td>{{cartitem.quantity}}</td>
              <td>{{cartitem.book.price}}</td>
              <td>{{cartitem.price}}</td>

              <td><a href="#" class="label label-danger" ng-click="removeFromCart(cartitem.cartItemId)">
                   
                   <span class="glyphicon glyphicon-remove"></span>remove</a></td>
           </tr>
           
             <tr>
                  <td></td>
                  <td></td>
                  <td class="text-right">
                  <h4><strong>Grand Total:</strong></h4></td>
                  <td class="text-center text-danger">
                  <h4><strong>RS. {{calculateGrandTotal()}}</strong></h4></td>
             </tr>
      </table>
</div>
<br>


  <a href="<c:url value="/getAllBooks"></c:url>" class="btn btn-success">Continue shopping</a>
  
     </div>
   </div>
</div>


<br>

<%@ include file="footer.jsp" %>


</body>
</html>
