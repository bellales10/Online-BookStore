<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

   table{padding:20px;}
   
</style>
</head>

<body style="background-color:LightGray;">

<div class="container">

	<c:url value="/admin/book/addBook" var="url"></c:url> 
	<form:form method="post" action="${url}" commandName="bookFormObj" enctype="multipart/form-data">

		<center>
            <table>
                <thead>
                    <tr>
                        <th colspan="2"><h3>Add New Book</h3></th>
                        <th></th>
                    </tr>
               </thead>  
               
         <tr>
	           <td><form:label path="bookImage">Upload Image :</form:label></td>
               <td><form:input type="file" path="bookImage" /></td>
         </tr>
              
         <tr>
			<td><form:label path="isbn"></form:label></td>
			<td><form:hidden path="isbn" /></td>
        </tr>
        
        <tr>
           <td><form:label path="title">TITLE :</form:label></td>
           <td><form:input path="title"></form:input>
               <form:errors path="title"></form:errors></td>
       </tr>
       
	    <tr>
           <td><form:label path="publisher">PUBLICATION :</form:label></td>
           <td><form:input path="publisher"></form:input>
               <form:errors path="publisher"></form:errors></td>
	    </tr>

	     <tr>
            <td><form:label path="price">PRICE :</form:label></td>
            <td><form:input path="price"></form:input></td>
                <form:errors path="price"></form:errors>
	    </tr>
	    
	     <tr>
            <td><form:label path="author">AUTHOR :</form:label></td>
            <td><form:input path="author"></form:input></td>
	    </tr>
	    
	    <tr>
	       <td><form:label path="category">CATEGORY</form:label></td>
	    <td>
	       <form:radiobutton path="category.cid" value="1"/>New Arrivals
	       <form:radiobutton path="category.cid" value="2"/>Special Edition	
	       <form:radiobutton path="category.cid" value="3"/>Discount Sale
	       <form:radiobutton path="category.cid" value="4"/>General
	    </td>
	    </tr>
	       
	    <tr>
	       <td><input type="submit" class="btn btn-success" value="AddBook"></td>
	       <td><input type="reset" class="btn btn-info" value="Reset" /></td>
	       
	    </tr>
	    
		</table>
   <a href="<c:url value="/getAllBooks"></c:url>" class="btn btn-primary btn-large">Back</a>
		
	</center>
</form:form>
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
<br>
<br>
<br>
<br>
<br>
<br>
		<%@ include file="footer.jsp" %>
	
</body>
</html>