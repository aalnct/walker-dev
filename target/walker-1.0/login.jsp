<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
				/* data-validate1="require" */
			</style>
</head>
<body>
	
	<div class="panel panel-default" style="float: !important; text-align: center; font-size:16px; font-style: italic;
	font-weight: 100;">
	 	<div class="panel-heading">If not a member,
	 	</div>
	 	<div class="panel-body">
				<a href="javascript:void(0);" rel='createuser'>Please Register</a></p>
		</div>
	</div>
	
	<div id="logincontainer">
		<div id="loginbox">
			<div id="loginheader">
			<img src="styles/cp_logo_login.png" alt="Control Panel Login" />
			</div>
				
			<div id="innerlogin">
			
				<%-- <form:form action="general_user" id="loginform" name="form" commandName="general_user" method="post"> --%>
				<form:form action="dashboard" id="loginform" name="form" commandName="dashboard" method="post">
			
			<img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt=""/>
			
					<p>Enter your User Name:</p>
                	<input type="text" class="logininput" name="username"/>
                	<p>Enter your Last Name:</p>
                	<input type="password" class="logininput" name="lastname"/>
                	<input type="submit" class="loginbtn" name="login" value="Login"/>
         
				</form:form>
				
			</div>
			
			<!-- <p id="register">If not a member, please
			<a href="javascript:void(0);" rel='createuser'>Register</a></p> -->
				
		</div>
				<img src="styles/login_fade.png" alt="Fade" />
	</div>
	<!-- <p align="center"><b>Admin Please login</b></p> -->
	<!-- <div id="admin">
        			<p id="admin" align="center"><a href="/walker/admin.jsp">Admin Please click here</a>.</p>
        	</div> -->
</body>
</html>