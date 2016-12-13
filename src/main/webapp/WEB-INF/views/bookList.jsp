<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
    <%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html >

<html>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script src="<c:url value="/resources/js/controller.js"></c:url>">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
  table,th,td{
      border:1px solid black;
      border-collapse:collapse;
  }
  th,td{
     padding:15px;
     }
     
    th{ text-align:center;
  }

</style>
</head>

<body style="background-color:LightGray;">

<div ng-app="myapp">
<div ng-controller="bookController" ng-init="getBooks()">


Search: <input type="text" ng-model="searchCondition" placeholder="Search Book">
<br>
<br>

<security:authorize access="hasRole('ROLE_ADMIN')">
    <a href="<c:url value="/admin/book/addBook"/>"><span class="btn btn-primary">Add New Book</span></a>
</security:authorize>

<br>
<br>

<H1> List of Books</H1>
	
	<!--  use JSTL tags -->
	<!--  iterate list of objects -->
	<!--  For each book b in books -->
	
	<table>
	<thead>
		<tr>
		    <th>IMAGE</th>
			<th>ISBN</th>
			<th>TITLE</th>
			<th>CATEGORY NAME</th>
			<th>PRICE</th>
			<th>VIEW</th>
			<security:authorize  access="hasRole('ROLE_ADMIN')">
			<th>View/edit/delete</th>
			</security:authorize>
		</tr>
</thead>
<tbody>
<tr ng-repeat="b in books | filter:searchCondition">

<c:url value="resources/images/{{b.isbn}}.jpg" var="src" />
		<td ><img src="${src }" style="width:40%"/></td>
		
        <td><a href="getBookByIsbn/{{b.isbn}}" >{{b.isbn}}</a></td>
		<td>{{b.title}}</td>
		<td>{{b.category.categoryName}}</td>
		<td>{{b.price}} RS.</td>
		
		<td><a href="getBookByIsbn/{{b.isbn}}"><span class="glyphicon glyphicon-info-sign"></span></a>
		
		<security:authorize  access="hasRole('ROLE_ADMIN')">
		<a href="admin/book/delete/{{b.isbn}}"><span class="glyphicon glyphicon-trash"></span></a>
		<a href="admin/book/editBook/{{b.isbn}}"><span class="glyphicon glyphicon-edit"></span></a>
		</security:authorize>
         	</td>	
</tr>

</tbody>
</table>

<br>
<br>

</div>
</div>

<br>
<br>
<br>
<br>

<%@ include file="footer.jsp" %>
</body>
</html>
