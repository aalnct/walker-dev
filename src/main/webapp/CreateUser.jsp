<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<title>Create User</title>

	<style type="text/css">
		body {
 				   background-color: lightblue;
			}
			
			fieldset > label {
				float:left;
				width:250px;
			}
			fieldset{
				font: italic;
				font-family: fantasy;
				background-position: left;
				border-width: thick;
				float: left;
			}
					admin{
						font: italic;
						font-family: fantasy;
						background-position: 90% 00%;
						border-width: thick;
						float: left;
    				}
		</style>
		
		<script>
  			$(function() {
    			$( "#datepicker" ).datepicker({
  			      numberOfMonths: 3,
  			      showButtonPanel: true
  			    });
 			});

  			$(function() {
  			    $( document ).tooltip();
  			});
  			
			$(function(){
				
				$("select[name=list_country]").change(function(){
					if($(this).val() == "india"){
						$("select[name=list_state_india]").show();
						$("select[name=list_state_usa]").hide();
					}if($(this).val() == "usa"){
						$("select[name=list_state_usa]").show();
						$("select[name=list_state_india]").hide();
					}
					if($(this).val() == "country"){
						$("select[name=list_state_usa]").hide();
						$("select[name=list_state_india]").hide();
					}
				});
			});
				
	  			
  		</script>
</head>
	

<body>
	
		
		
<!-- onsubmit=" return validate()" -->
		<h3>Please Register</h3>
		<th></th>
		<form:form action="user" method="post" name="registerationform" commandName="user">
        	<div id="admin">
        			<p><a href="/walker/admin.jsp">Admin Please click here</a>.</p>
        	</div>
        
		<fieldset>
		<div style="float: right;text-align: right;" valign="middle">
			<table align="left" border="1" cellspacing="2">
					
				<tr>
				<th>First Name&nbsp;&nbsp;&nbsp;<input type="text" name="fname" maxlength="10" title="Please Enter your first name"/></th>
				</tr>
				
				<tr>
				<th>Last Name&nbsp;&nbsp;&nbsp;<input type="text" name="lname" maxlength="15" title="Please Enter your last name"/></th>
				</tr>
				
				<tr>
				<th>Email ID&nbsp;&nbsp;&nbsp;<input type="text" name="emailid" maxlength="40" /></th>
				</tr>
				
				<tr>
				<th>Date of Birth<input type="text" id = "datepicker" name="dob" maxlength="20"/></th>
				</tr>
				
				<tr>
				<th>UserName&nbsp;&nbsp;&nbsp;<input type="text" name="uname" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>addressLine1&nbsp;&nbsp;&nbsp;<input type="text" name="addressLine1" maxlength="20" onblur="validated()"  /></th>
				</tr>
				
				<tr>
				<th>addressLine2&nbsp;&nbsp;&nbsp;<input type="text" name="addressLine2" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>addressLine3&nbsp;&nbsp;&nbsp;<input type="text" name="addressLine3" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>City&nbsp;&nbsp;&nbsp;<input type="text" name="city" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>state&nbsp;&nbsp;&nbsp;<input type="text" name="state" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>zipCode&nbsp;&nbsp;&nbsp;<input type="text" name="zip" maxlength="20" /></th>
				</tr>
				
				<tr>
				<th>Upload Image :<input type="file" name="image"/></th>
				</tr>
				
				<tr>
				<th>
					<input type="radio" name="gender" value="male"/>Male
					<input type="radio" name="gender" value="female"/>Female
				</th>
				</tr>
				<tr>
				<th align="left">
					<select name="list_country" style = "width:100px;" >
						<option value="country">Please select Country</option>
						<option value="india">India</option>
						<option value="usa">USA</option>
	  				</select>
				</th>
				</tr>
				
				<!-- this is the second drop down
				 -->
				<tr>
				<th align="left">
					<select name="list_state_usa" style = "display:none;" >
						<option value="state">Please select state</option>
						<option value="Georgia">Georgia</option>
						<option value="Illinois">Illinois</option>
						<option value="NewYork">NewYork</option>
						<option value="Delaware">Delaware</option>
	  				</select>	
				</th>
				</tr>
				
				<tr>
				<th align="left">
					<select name="list_state_india" style = "display:none;" >
						<option value="state">Please select State</option>
						<option value="MadhyaPradesh">Madhya Pradesh</option>
						<option value="Bihar">Bihar</option>
						<option value="Delhi">Delhi</option>
						<option value="Kashmir">Kashmir</option>
	  				</select>	
				</th>
				</tr>
				
				<tr align="left">
					<th><input type="submit" name="submit" value="Register"/></th>
					<th><input type="reset" name="reset" value="Reset"/></th>
				</tr>
				</table>
				</div>
			</fieldset>
			
			
		</form:form>
</body>
</html>