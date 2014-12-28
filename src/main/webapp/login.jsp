<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>Login Page</title>

			<script type="text/javascript">
				/* function validateFields(){
					var username = document.forms["login_form"]["username"].value;
					var password = document.forms["login_form"]["password"].value;
					if(username == "" || username == null || password=="" || password==null){
						alert('enter username and/or password please');
						return false;
					}
					return true;
					} */
				function register(){
					window.open("http://localhost:8080/walker/CreateUser.jsp",
							"_blank", "toolbar=yes, scrollbars=yes, resizable=yes, top=500, left=500, width=500, height=800");
					}
			</script>
			
			
			
			<style>
				#login_btn {
					border: black;				
				}
				
				body{
					background: lightblue;
				}
			</style>
			
			<script type="text/javascript">
				/* alert('checkpoint'); */
				$(function(){
						$('form').submit(function(e){
								var count = 0;
								$("[data-validate='require']").each(function(){
										if(!$(this).val()){
											count++;
											$(this).after($('<div/>')).attr({"class" : "input_error" , "id" : 'error_'
														+$(this).attr('name')}).html('Field is required');
											}
										else{
											$('#error_'+$(this).attr('name')).remove();
											}
									});
								if(count > 0){
									e.preventDefault();
									}
							});
					});
			</script>
			
<!-- onsubmit=" return validateFields()" -->
</head>
<body>
	<p align="center"><b>Please login</b></p>
	<div id="admin">
        			<p id="admin" align="center"><a href="/walker/admin.jsp">Admin Please click here</a>.</p>
        	</div>
	<form:form action="general_user" id="formid" name="form" commandName="general_user" method="post" >
	
		<table align="center" border="1" cellspacing="2">
			<tr>
			<th>UserName:<input type="text" data-validate="require" name="username"/></th></tr>
			<b><p align="center">After login for first time, you will be required to reset your password</p></b>
			<tr><th>LastName:<input type="password" data-validate="require" name="password"/></th> 
			</tr>
		</table>
		</br>
			<div id="login_btn" align="center">
				<input type="submit" name="login" value="Open"/>
				<input type="button" value="Register First" onclick="register()"/>
			</div>
			<!-- Validation Jquery -->
			
	</form:form>
</body>
</html>