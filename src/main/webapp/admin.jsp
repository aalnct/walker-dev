<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<style>
	
	body{
		background: lightblue;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Admin Users Login</title>

		<script type="text/javascript">

		/* function validateFields(eve){
				var validateValue_username = document.forms["admin_login_form"]["username"].value;
				var validateValue_lastname = document.forms["admin_login_form"]["lastname"].value;

				if(validateValue_username ==null || validateValue_username == '' 
					|| validateValue_lastname==null || validateValue_lastname==''){
					
					if(!NaN(validateValue_username && validateValue_lastname)){
						var element = document.getElementById("validationMessage")
						element.innerHTML = 'Please enter username/lastname to login';

						eve.preventDefault();
					}					
						return false;					
						eve.preventDefault();

					}	
			}
 */		</script>


		<style type="text/css">
			login_btn{
						border:background;
						padding-bottom: 10cm;
						background-color: red;
				}
				validationMessage {
						border:background;
						padding-bottom: 10cm;
						background-color: red;
						font-family: cursive;
				}
				
		</style>

</head>
<body>
			
			<form:form action="/walker/searchuser/username/lastname" name="admin_login_form" commandName="admin_user" method="posts">
			
			<c:if test="${messages != null}">
				<c:out value="${messages}" ></c:out>
			</c:if>
			
			
		<table align="center" border="1" cellspacing="2">
			<tr>
			<th>UserName:<input type="text" name="username" required="true"/></th></tr>
			
			<!-- <div id="validationMessage" align="center">
			</div> -->
			
			<tr><th>LastName:<input type="password" name="lastname" required="true"/></th>
			</tr>
		</table>
			<div id="login_btn" align="center">
				<input type="submit" name="admin" value="Submit" />
			</div>
	</form:form>
			
</body>
</html>