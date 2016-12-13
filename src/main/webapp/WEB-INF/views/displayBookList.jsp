<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Insert title here</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body style="background-color:LightGray;">


<H1> List of Books</H1>
	
	<!--  use JSTL tags -->
	<!--  iterate list of objects -->
	<!--  For each book b in books -->
<div class="table-responsive">	
<table class="table table-bordered">
 
	<thead>
		<tr>
		    <th scope="row">IMAGE</th>
		    <th scope="row">ISBN</th>
			<th scope="row">TITLE</th>
			<th scope="row">CATEGORY NAME</th>
			<th scope="row">PRICE</th>
			<th scope="row">VIEW</th>
		</tr>
    </thead>
    <tbody>
          
          <!--  for Each book b in books -->
		     <c:forEach items="${books}" var="b">
            
            <tr>
               <c:url value="resources/images/${b.isbn}.jpg" var="src" />
		     <td><img src="${src }" style="width: 30%"/></td>
		
             <td><a href="getBookByIsbn/${b.isbn}" >${b.isbn}</a></td>
		     <td>${b.title}</td>
		     <td>${b.category.categoryName}</td>
		     <td>${b.price} RS.</td>
		
		     <td><a href="getBookByIsbn/${b.isbn}"><span class="glyphicon glyphicon-info-sign"></span></a></td>
        
           </tr>
        </c:forEach>
     </tbody>
</table>
</div>

<br>
<br>
<br>
<br>

<%@ include file="footer.jsp" %>
</body>
</html>
