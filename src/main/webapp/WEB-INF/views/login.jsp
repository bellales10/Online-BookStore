<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ include file="header.jsp"%>
<%@page isELIgnored="false"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>

body {
   background-image:url('resources/images/download1.jpg');
}
</style>
<title>Insert title here</title>
</head>

<body>

<div class="row centered-form" >
    <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
      <div class="panel panel-primary">
       <div class="panel-heading">
		   <center><h3 class="panel-title">Please sign in</h3></center>
		</div>
	<div class="panel-body">
        
        <h1 align="center">Login Form</h1>

<%--  <form action="j_spring_security_check" method="post"> --%>

            <c:if test="${not empty logout}">
                <div class="error" style="color: #ff0000;">${logout}</div>
            </c:if>
            <form name="loginForm" action="perform_login" method="post">
            
                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>
     
       <div>
	      <input type="text" placeholder="Username" required id="username" name="username" 
	              class="form-control input-sm floatlabel" title="minimum length for username is 5"/>
       </div>
<br>
		
        <div>
           <input type="password" placeholder="Password" required id="password" name="password"  
                   class="form-control input-sm floatlabel" title="Enter Valid credentials"/>
        </div>
<br>
				
         <div>
	         <input type="submit" class="btn btn-success" value="Log in" /> 
	         
   	        <input type="reset" value="Reset" class="btn btn-info"/>           
	
	         <a href="registration" class="btn btn-warning" >SignUp</a><br>
	
        </div>
				
     </form>
			      	
		</div>
       </div>
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
<br>

<%@include file="footer.jsp" %>

</body>
</html>