<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
  body{
  background-image: url('resources/images/book.jpg');
  }
 h2,p{
     text-align:center;
     font-style: italic; 
     color: black; 
  }
</style>

<title>Insert title here</title>
</head>

<body>

<div class="container-wrapper">
    <div class="container">
        <section>
            <div class="jumbotron"  style="background-image: url('resources/images/.jpg');">
                <div class="container">
                    <h2 class="alert alert-danger">Checkout cancelled!</h2>

                    <p>Your checkout process is cancelled! You may continue shopping.</p>
                </div>
            </div>
        </section>

        <section class="container">
            <p><a href="<c:url value="/getAllBooks" />" class="btn btn-success">Go to Books</a></p>
        </section>

</div>
</div>

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>