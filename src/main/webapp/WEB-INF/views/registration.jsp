<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
   background-image:url('resources/images/download1.jpg');
}
</style>
</head>

<body> 

<div class="row centered-form">
    <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
      <div class="panel panel-primary">
       <div class="panel-heading">
		<h3 class="panel-title"> Sign up </h3>
	   </div>
	  <div class="panel-body">
	  
	  <c:url value="/registration" var="url" ></c:url>
       <form:form action="${url }" method="post" commandName="customer" >
	  
<div class="row">
	 <h3> Basic Info:</h3>
	 <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
         <form:input type="text" readonly="true" path="customerId" class="form-control input-sm floatlabel" placeholder="ID" required="true" />
		</div>
	</div>
		
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="customerName" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="Customername" path="customerName" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
       
       <c:if test="${duplicateEmail!=null }"> ${duplicateEmail }</c:if>
       
        <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="customerEmail" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="Email" path="customerEmail" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
        
        <c:if test="${duplicateUname!=null }"> ${duplicateUname }</c:if>
        
        <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="customerPhone" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="phone" path="customerPhone" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
        
        <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="userDetail.username" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="username" path="userDetail.username" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="userDetail.password" cssStyle="color: #ff0000"/>
            <form:input type="password" placeholder="password" path="userDetail.password" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
<br/>
        <h3> Billing Address:</h3>
        <div class="col-xs-6 col-sm-6 col-md-6">
		  <div class="form-group">
		    <form:errors path="billingAddress.streetName" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="streetName" path="billingAddress.streetName" class="form-control input-sm floatlabel" required="true" />
		  </div>
	    </div>
         
         <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="billingAddress.apartmentNumber" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="apartmentNumber" path="billingAddress.apartmentNumber" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="billingAddress.city" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="city" path="billingAddress.city" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="billingAddress.state" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="state" path="billingAddress.state" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="billingAddress.country" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="country" path="billingAddress.country" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="billingAddress.zipcode" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="zipcode" path="billingAddress.zipcode" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
         
<br/>

        <h3> Shipping Address:</h3>
        <div class="col-xs-6 col-sm-6 col-md-6">
		  <div class="form-group">
		    <form:errors path="shippingAddress.streetName" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="streetName" path="shippingAddress.streetName" class="form-control input-sm floatlabel" required="true" />
		  </div>
	    </div>
         
         <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="shippingAddress.apartmentNumber" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="apartmentNumber" path="shippingAddress.apartmentNumber" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="shippingAddress.city" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="city" path="shippingAddress.city" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="shippingAddress.state" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="state" path="shippingAddress.state" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="shippingAddress.country" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="country" path="shippingAddress.country" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
	   
	   <div class="col-xs-6 col-sm-6 col-md-6">
		 <div class="form-group">
		    <form:errors path="shippingAddress.zipcode" cssStyle="color: #ff0000"/>
            <form:input type="text" placeholder="zipcode" path="shippingAddress.zipcode" class="form-control input-sm floatlabel" required="true" />
		 </div>
	   </div>
         
<br/><br/>
           
            <input type="submit" value="submit" class="btn btn-primary">
   	        <input type="reset" value="Reset" class="btn btn-default"/>           
            <input type="submit" value="cancel" class="btn btn-info">
           
      </div>
    </form:form>
   </div>
  </div>
 </div>
</div>
    
<br>
<br>

<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>