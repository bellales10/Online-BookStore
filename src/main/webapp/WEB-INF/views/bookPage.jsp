<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ page isELIgnored="false" %>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="background-color:LightGray;">
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Book Information :</h1>
         </div>
      
           <center>
          <div ng-app="myapp">
          
       <img src="<c:url value="/resources/images/${bookObj.isbn}.jpg" />" alt="image" style="width:40%"/>
         <br>
         <br>   
             ISBN : ${bookObj.isbn } <br>
             TITLE : ${bookObj.title } <br>
             PRICE : ${bookObj.price } <br>

<br>
           <div ng-controller="bookController">
               
              <c:url value="/cart/add/${bookObj.isbn }" var="url"></c:url>
               
                <security:authorize access="hasRole('ROLE_USER')">
                   <a href="${url}" ng-click="addToCart(${bookObj.isbn})"  class="btn btn-warning btn-large">
                           <span class="glyphicon glyphicon-shopping-cart"></span>addToCart</a>
                </security:authorize>
         
        
               <a href="<c:url value="/getAllBooks"></c:url>" class="btn btn-primary btn-large">Back</a>
          </div>
        </div>
      </center>
   </div>
 </div>
 
<script src="<c:url value="/resources/js/controller.js" /> "></script>

</body>
</html>
