<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="/walker/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/styles.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/admintheme.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css"/>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<style>
	
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Admin Users Login</title>
		<style type="text/css">
			login_btn{
						border:background;
						padding-bottom: 20cm;
						background-color: red;
				}
		</style>
		
		
		<script type="text/javascript">
				
				$(function(){
					
					$('#adminlogin').click(function(event){
						var count = 0;	
						if ($("#username").val().length == 0) {
						   count ++;
			               var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'
									+$(this).attr('name')}).html('Username is required');
  	  							
			               //$(this).after(error);
			               alert('Please enter UserName');
			            }
						
						if($("#password").val().length == 0){
						count ++;
			               var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'
									+$(this).attr('name')}).html('Password is required');
	  							
			               //$(this).after(error);
			               alert('Please Enter Password');
						}
						
						if(count>0){
							event.preventDefault();
						}
					});
					
					
					$('div a[rel=home]').on('click',function(){
						window.location.replace("/walker/welcomeuser.jsp");
					});
					
				});
		
		</script>

</head>				

<body id="homepage">
  		<form:form action="/walker/searchuser/" name="admin_login_form" commandName="admin_user" method="POST,GET" class="form-inline" role="form"
  		style="padding-top:10px; margin-left:10px;">
  		<div align="center">
			<c:if test="${messages != null}" >
				<c:out value="${messages}" ></c:out>
			</c:if>
			
			<c:if test="${logOutSessions != null}">
				<c:out value="${logOutSessions}" ></c:out>
			</c:if>
		</div>
		
		<div>
			<a href="javascript:void(0);" rel = "home">Home</a>
		</div>
		
		
<div class="container">
    <div class="row colored">
        <div id="contentdiv" class="contcustom">
            <span class="fa fa-spinner bigicon"></span>
            <h2>Admin Login</h2>
            <div>
			
					<div class="form-group">
						<label for="name">UserName</label>
						<input type="text" name="username"  id = "username" data-validate="require"/>
					</div>
					
					<div class="form-group">
							<label for="name" style="padding:10px;">Password</label>
							<input type="password" name="lastname"  id = "password" data-validate="require"/>
					</div>
			
		
		
			<div id="login_btn" align="center" style="padding-top: 20px;">
				<input type="submit" name="admin" value="Submit" class="btn btn-success" id="adminlogin"/>
			</div>
		</div>
        </div>
    </div>
</div>	
	</form:form>
			
</body>
</html>