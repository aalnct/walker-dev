<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<title>Login Page</title>

<link href="styles/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="styles/helper.js"></script>
<link href="styles/login.css" rel="stylesheet" type="text/css"/>
<!-- Theme Start -->
<link href="styles/styles.css" rel="stylesheet" type="text/css" />
<!-- Theme End -->


 			<style>
				#register{
					color: #ddd;
					padding: 2px;
					border:2px;
					position: right;
				}
				.input-error{
					border: 1px solid red;
				}
				
				.breadcrumb { 
					list-style: none; 
					overflow: hidden; 
					font: 18px Helvetica, Arial, Sans-Serif;
			   }
			   
			   .breadcrumb li a{
			   		/* background: hsla(34,85%,35%,1); */ 
			   		display: block;
			   }
				
			</style>
			
			
			<script>
						
					$(function(){
						$('#loginform').submit(function(event){
							var count = 0;
							$('#loginform [data-type=error]').remove();
							$('#loginform [data-validate^="require"]').each(function(){
								//$('#error_'+$(this).attr('name')).remove();
								$(this).removeClass('input-error');
									if(!$(this).val()){
										count++;
										var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'+$(this).attr('name'),"data-type" : "error"})
										.html($(this).attr('name').substring(0, 1).toUpperCase() + $(this).attr('name').substring(1).toLowerCase() + '' + ' is required');
				  						$(this).addClass('input-error').after(error.css('color','red'));
				  						
									}
								});
								if(count > 0){
									event.preventDefault();
									}
							});
						
						
						$(".panel-body a[rel=createuser]").on('click',function(){
							$.ajax ({
								url : '/walker/statelist',
								type:'get',
							});
						});
						
						$(".breadcrumb li[rel=home]").on('click',function(){
							window.location.replace("/walker/welcomeuser.jsp");
						});
						
			});
			</script>
			
			
</head>
<body>

		<c:if test="${not empty error}">
		   <div class="error">${error}</div>
		  </c:if>
		  <c:if test="${not empty msg}">
		   <div class="msg">${msg}</div>
		  </c:if>
		  
		  
		  <c:if test="${not empty error}">
            <div style="color:red">
                Your fake login attempt was bursted, dare again !!<br/>
                Caused : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
            </div>
        </c:if>
		  

	<ol class="breadcrumb">
				  <li class="text-primary" rel = "home"><a href="javascript:void(0);" title = "Go to Home Page">Home</a></li>
		   </ol>
	
	<div class="panel panel-default" style="float: !important; text-align: center; font-size:16px; font-weight: 100;">
	 	<div class="panel-body">
	 	<ul class="nav nav-pills">
	 	<li role="" class="active pull-right">
	 			<a href="javascript:void(0);" rel='createuser'>Register</a></p>
	 	</li>		
		</ul>
		</div>
	</div>
	
	
	
	
	<div id="logincontainer">
		<div id="loginbox">
			<div id="loginheader">
			<img src="styles/cp_logo_login.png" alt="Control Panel Login" />
			</div>
				
			<div id="innerlogin">
				<%-- <form:form action="dashboard" id="loginform" name="form" commandName="dashboard" method="post"> --%>
				<form action="<c:url value='j_spring_security_check' />" id="loginform" name="form" commandName="dashboard" method="post">
			
					<p>Enter your User Name:</p>
					
					<div class="form-group">
              			<!-- <input type="text" class="form-control input-lg" name="UserName" placeholder="User Name"data-validate="required" /> -->
              			<input type="text" class="form-control input-lg" name="j_username" placeholder="User Name"data-validate="required" />
            		</div>
                	<p>Enter your Password:</p>
                	<div class="form-group">
                	<!-- <input type="password" class="form-control input-lg" name="LastName" placeholder="Last Name" data-validate="required" /> -->
                	<input type="password" class="form-control input-lg" name="j_password" placeholder="Last Name" data-validate="required" />
                	</div>
                	
                	<input type="submit" class="btn btn-primary" name = "login" value="Login" id=""/>
         			<button class="btn pull-right" data-dismiss="modal" aria-hidden="true">Cancel</button>
         			
				</form>
				
				 
				
			</div>
				
		</div>
	</div>
</body>
</html>