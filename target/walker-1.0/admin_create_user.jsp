
		
		<form:form action="user" method="post" name="registerationform" commandName="user" data-validation-form="registerationform" id="registerationform">
        
		
		<div style="float: left; width:50% ; border:1px solid #ccc; padding:5px" valign="middle">
			<table align="left" cellspacing="2" width="100%">
					
				<tr>
				<th>First Name</th><td><input type="text" name="fname" maxlength="10" title="Please Enter your first name"  data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>Last Name</th><td><input type="text" name="lname" maxlength="15" title="Please Enter your last name"  data-validate1="require"/></td>
				</tr>
				
				<tr>
				<th>Email ID</th><td><input type="text" name="emailid" maxlength="140" title="Please enter Email ID"  data-validate1="require|email"/></td>
				</tr>
				
				<tr>
				<th>Date of Birth</th><td><input type="text" id = "datepicker" name="dob" maxlength="20"/></td>
				</tr>
				
				<tr>
				<th>UserName</th><td><input type="text" name="uname" maxlength="20" title="Please enter your unique username"/></td>
				</tr>
				
				<tr>
				<th>addressLine1</th><td><input type="text" name="addressLine1" maxlength="20" title="Please enter address line 1"/></td>
				</tr>
				
				<tr>
				<th>addressLine2</th><td><input type="text" name="addressLine2" maxlength="20" title="Please enter address line 2"/></td>
				</tr>
				
				<tr>
				<th>addressLine3</th><td><input type="text" name="addressLine3" maxlength="20" title="Please enter address line 3"/></td>
				</tr>
				
				<tr>
				<th>City</th><td><input type="text" name="city" maxlength="20" /></td>
				</tr>
				
				<tr>
				<th>state</th><td><input type="text" name="state" maxlength="20" title="Please enter your state"/></td>
				</tr>
				
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
				<!-- <tr>
				<th align="left"></th>
					<td>
					<select name="list_country" style = "width:100px;" >
						<option value="country">Please select Country</option>
						<option value="india">India</option>
						<option value="usa">USA</option>
	  				</select>
				</td>
				</tr>
				
				this is the second drop down
				
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
				</tr> -->
				
				<tr>
					<th></th>
					<td><input type="submit" name="submit" value="Register"/>
					<input type="reset" name="reset" value="Reset"/>
					</td>
				</tr>
				</table>
				</div>
			
		</form:form>