<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.47/jquery.form-validator.min.js"></script>
<script> $.validate(); </script>
<title>Create User</title>

	<script>
		function validate(){
			var validateValue = document.forms["registerationform"]["fname"].value;
			var validateValue_lname = document.forms["registerationform"]["lname"].value;
			var validateValue_email = document.forms["registerationform"]["emailid"].value;
			var validateValue_dob = document.forms["registerationform"]["dob"].value;
			var validateValue_uname = document.forms["registerationform"]["uname"].value;
			
			if((validateValue==null||validateValue =="") || (validateValue_lname==null||validateValue_lname =="") 
					|| (validateValue_email==null||validateValue_email =="") || (validateValue_dob==null||validateValue_dob =="")
					|| (validateValue_uname==null||validateValue_uname =="")){

					alert("Please enter data in required field");
				return false;
				}
			}
	</script>
</head>
<body>
		<h3>Please enter your details below</h3>
		<form:form action="user" method="post" name="registerationform" commandName="user" onsubmit=" return validate()">
			<table align="center" border="1" cellspacing="2" bgcolor="green">
				<tr>
				<th>First Name<input type="text" name="fname" maxlength="10" placeholder="Please enter your first name"/></th>
				</tr>
				
				<tr>
				<th>Last Name<input type="text" name="lname" maxlength="15" placeholder="Please enter your last name"/></th>
				</tr>
				
				<tr>
				<th>Email ID<input type="text" name="emailid" maxlength="20" placeholder="Please enter your email id"/></th>
				</tr>
				
				<tr>
				<th>Date of Birth<input type="text" name="dob" maxlength="20" placeholder="Please enter your date of Birth"/></th>
				</tr>
				
				<tr>
				<th>UserName<input type="text" name="uname" maxlength="10" placeholder="Please enter your Username"/></th>
				</tr>
				
				<tr align="left">
				<th><input type="submit" name="submit" value="Register"/></th>
				<th><input type="reset" name="reset" value="Reset"/></th>
				</tr>
			</table>
			
			<div class="fieldgroup">
            <p>Already registered? <a href="login.jsp">Sign in</a>.</p>
        </div>
			
		</form:form>
</body>
</html>