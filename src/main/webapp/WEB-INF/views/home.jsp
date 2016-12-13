<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>
 
</head>
<body style="background-image:url('resources/images/img.jpg');">

<%@ include file="header.jsp" %>

<div class="container-fluid">
  
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
  
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="resources/images/image1.jpg" style="width:100%; height:600px" class="img-responsive">
        <div class="carousel-caption">
        <h3>Nature</h3>
  <p>"Bad libraries build collections, good libraries build services, great libraries build communities." - R. David Lankes</p>
        </div>
      </div>

      <div class="item">
        <img src="resources/images/image2.jpg" style="width:100%; height:600px" class="img-responsive">
        <div class="carousel-caption">
        <h3>Nature</h3>
  <p>"The truth is libraries are raucous clubhouses for free speech, controversy and community." - Paula Poundstone </p>         
        </div>
      </div>
    
      <div class="item">
        <img src="resources/images/image3.jpg" style="width:100%; height:600px" class="img-responsive">
        <div class="carousel-caption">
         <h3>Study</h3>
  <p>"Libraries store the energy that fuels the imagination. 
               They open up windows to the world and inspire us to explore and achieve,
                and contribute to improving our quality of life." - Sidney Sheldon </p>
        </div>
      </div>

      <div class="item">
        <img src="resources/images/image4.jpg"  style="width:100%; height:600px" class="img-responsive">
        <div class="carousel-caption">
         <h3>Library</h3>
  <p>"A library is a place where you can lose your innocence without losing your virginity." - Germaine Greer </p>
          
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br>
<br>
<br>
<br>

<div class="container-fluid text-center" style="color:white">
  <h3 class="margin">Books Information</h3><br>
  <div class="row">
  <p>The library card is a passport to wonders and miracles, glimpses into other lives, religions, experiences, the hopes and dreams and strivings of ALL human beings, and it is this passport that opens our eyes and hearts to the world beyond our front doors, that is one of our best hopes against tyranny, xenophobia, hopelessness, despair, anarchy, and ignorance.

<br>- Libba Bray

  </p>
   <br> 
    <br>
    <div class="col-sm-4">
      <img src="resources/images/image7.jpg" class=" img-circle" style="width:250px; height:250px" alt="Image">
    <h4>New Arrivals</h4>
    </div>
    
    <div class="col-sm-4">
      <img src="resources/images/image5.jpg" class="img-circle" style="width:250px; height:250px" alt="Image">
    <h4>Special Edition</h4>
    </div>
   
    <div class="col-sm-4">
      <img src="resources/images/image6.jpg" class=" img-circle" style="width:250px; height:250px" alt="Image">
    <h4>General</h4>
    </div>
    
  </div>
</div>
<br>
<br>



<%@ include file="footer.jsp" %>

</body>
</html>