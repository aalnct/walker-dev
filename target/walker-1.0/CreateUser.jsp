<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<title>Create User</title>

	<style type="text/css">
		body {
 				   background-color:grey;
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
    				table th{
    					width: 300px;
    				}
		</style>
		
		<script>
  			$(function() {
    			$( "#datepicker" ).datepicker({
  			      changeMonth: true,
	  		      changeYear: true,
  			      showButtonPanel: true
  			    });
  			    //for tooltip
    			 $( document ).tooltip();  		
					//for dropdown
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
					//$('form[name=registerationform]').submit(function(){
   				   $('#registerationform').submit(function(){
   	   				   		var count=0;
   	   				   		$('#registerationform [data-validate^="require"]').each(function(){
   	   	   				   			var validate =$(this).attr('data-validate').split('|');
   	   	   				   			//alert('hi');
   	   	   				   			for(var i=0 ;i<validate.length;i++){
   	   	   				   				//alert(validate[i]);
   	   	   				   				
   	   	   				   				switch(validate[i]){
		   	   	   				   				case 'require':
		   	   	   	   				   				if(!$(this).val()){
			   	   	   	   				   				//alert('check validation');
		   	   	   	   	   				   						count++;
						   	   		   	   	   				 	var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'
						   	  									+$(this).attr('name')}).html('Field is required');
								   	  							$(this).after(error);
								   	  							//return;
		   	     	   	   				   				}
		   	   	   	   				   				break;
		   	   	   				   				case 'email':
					   	   	   				   		if(!validateEmail($(this).val())){
															count++;
									   	   	   				 var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'
															+$(this).attr('name')}).html('Email is not valid');
								  							$(this).after(error);
			   	   				   				}
		   	   	   	   				   				break;
		   	   	   	   				   			default:
		   	   	   	   				   				break;
		   	   	   				   				}
	   	   	   				   			}
   	   	   				   		});
	   	   				   		if(count>0)
			   	   				  return false;
	   	   				   		
   	   				   });
 			});
  		</script>
</head>
	

<body>
	<!--  -->
		
		
<!-- onsubmit=" return validate()" -->
		<h3>Please Register</h3>
		<th></th>
		<form:form action="user" method="post" name="registerationform" commandName="user" data-validation-form="registerationform" id="registerationform">
		
        	<div id="admin">
        			<p><a href="/walker/admin.jsp">Admin Please click here</a>.</p>
        	</div>
        
		<fieldset>
		<div style="float: right;text-align: right;" valign="middle">
			<table align="left" border="1" cellspacing="2" width="100%">
					
				<tr>
				<th>First Name</th><td><input type="text" name="fname" maxlength="10" title="Please Enter your first name"  data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>Last Name</th><td><input type="text" name="lname" maxlength="15" title="Please Enter your last name"  data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>Email ID</th><td><input type="text" name="emailid" maxlength="140" title="Please enter Email ID"  data-validate="require|email"/></td>
				</tr>
				
				<tr>
				<th>Date of Birth</th><td><input type="text" id = "datepicker" name="dob" maxlength="20" data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>UserName</th><td><input type="text" name="uname" maxlength="20" title="Please enter your unique username" data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>addressLine1</th><td><input type="text" name="addressLine1" maxlength="20" title="Please enter address line 1" data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>addressLine2</th><td><input type="text" name="addressLine2" maxlength="20" title="Please enter address line 2" data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>addressLine3</th><td><input type="text" name="addressLine3" maxlength="20" title="Please enter address line 3"/></td>
				</tr>
				
				<tr>
				<th>City</th><td><input type="text" name="city" maxlength="20" data-validate="require"/></td>
				</tr>
				
				<!-- <tr>
				<th>state</th><td><input type="text" name="state" maxlength="20" title="Please enter your state"/></td>
				</tr> -->
				
				<tr>
				<th>zipCode</th><td><input type="text" name="zip" maxlength="20" title="Please enter your zipcode"/></td>
				</tr>
				
				<tr>
				<th>Upload Image</th><td><input type="file" name="image" title="Please upload your image"/></td>
				</tr>
				
				<tr>
				<th></th>
				<td>
					<input type="radio" name="gender" value="male"/>Male
					<input type="radio" name="gender" value="female"/>Female
				</td>
				</tr>
				<tr>
				<th align="left"></th>
					<td>
					<select name="list_country" style = "width:100px;" >
						<option value="country">Please select Country</option>
						<option value="india">India</option>
						<option value="usa">USA</option>
	  				</select>
				</td>
				</tr>
				
				<!-- this is the second drop down
				 -->
				<tr>
				<th align="left"></th>
				<td>	<select name="list_state_usa" style = "display:none;" >
						<option value="state">Please select state</option>
						<option value="Georgia">Georgia</option>
						<option value="Illinois">Illinois</option>
						<option value="NewYork">NewYork</option>
						<option value="Delaware">Delaware</option>
	  				</select>	
				</td>
				</tr>
				
				<tr>
				<th></th>
				<td>	<select name="list_state_india" style = "display:none;" >
						<option value="state">Please select State</option>
						<option value="MadhyaPradesh">Madhya Pradesh</option>
						<option value="Bihar">Bihar</option>
						<option value="Delhi">Delhi</option>
						<option value="Kashmir">Kashmir</option>
	  				</select>	
				</td>
				</tr>
				
				<tr>
					<th></th>
					<td><input type="submit" name="submit" value="Register"/>
					<input type="reset" name="reset" value="Reset"/>
					</td>
				</tr>
				</table>
				</div>
			</fieldset>
			
			
		</form:form>
		
</body>
</html>