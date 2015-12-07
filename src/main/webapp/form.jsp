<style>
		table td{padding:5px;}
		.label-error{color:red;}
		.error-field{border:1px solid red;}
</style>
			<script>
				
			$(function(){
				$('[rel=cancel]').click(function(){
					$('form [rel = employeeFormDetails]').val('');
				});
			});
			
			</script>
			
			
		<body ng-app="formValidationApp">
			<div class = "panel-control" id = "employeeDetails">
			<div id="wrapper">
			
					<form action = "/walker/createAdminProfile" method="post" name="registerForm" novalidate ng-controller="processController" ng-submit="submit();" rel  = "employeeFormDetails" commandName = "customerVO">
					
						<fieldset style="width: 1500px;">
						
							<legend align="center">Register</legend>
							
							<table width = "350px;" cellspacing="0" align = "center" border="1">
							
							<tr>
								<td>First Name</td>
								<td><input type="text" ng-model='user.firstName' name="firstName" ng-class=
							"{'error-field':registerForm.firstname.$error.required && (registerForm.$submitted || registerForm.firstName.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.firstName.$touched) && registerForm.firstName.$error.required" class="label-error">
											First Name is required	
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>Last Name</td>
								<td><input type="text" ng-model='user.lastName' name="lastName" ng-class=
							"{'error-field':registerForm.lastname.$error.required && (registerForm.$submitted || registerForm.lastName.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.lastName.$touched) && registerForm.lastName.$error.required" class="label-error">
											Last Name is required	
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>Email ID</td>
								<td><input type=email ng-model='user.emailAddress' name="user.emailAddress" ng-class=
							"{'error-field':registerForm.emailAddress.$error.required && (registerForm.$submitted || registerForm.emailAddress.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.emailAddress.$touched) && registerForm.emailAddress.$error.required" class="label-error">
											Email is required
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>Password</td>
								<td><input type="password" ng-model='user.password' name="password" ng-class=
							"{'error-field':registerForm.password.$error.required && (registerForm.$submitted || registerForm.password.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.password.$touched) && registerForm.password.$error.required" class="label-error">
											Password is required
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>Address Line 1</td>
								<td><input type="text" ng-model='user.addressLine1' name="address.addressLine1" ng-class=
							"{'error-field':registerForm.address.addressLine1.$error.required && (registerForm.$submitted || registerForm.address.addressLine1.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.addressLine1.$touched) && registerForm.addressLine1.$error.required" class="label-error">
											Address is required
									</div>
								</td>
						  </tr>
						  
						  
						  <tr>
								<td>Address Line 2</td>
								<td><input type="text" ng-model='user.addressLine2' name="address.addressLine2" ng-class=
							"{'error-field':registerForm.addressLine2.$error.required && (registerForm.$submitted || registerForm.addressLine2.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.addressLine2.$touched) && registerForm.addressLine2.$error.required" class="label-error">
											Address is required
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>City</td>
								<td><input type="text" ng-model='user.city' name="address.city" ng-class=
							"{'error-field':registerForm.city.$error.required && (registerForm.$submitted || registerForm.city.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.city.$touched) && registerForm.city.$error.required" class="label-error">
											City is required
									</div>
								</td>
						  </tr>
						  
						  <tr>
								<td>State</td>
								<td><input type="text" ng-model='user.state' name="address.state" ng-class=
							"{'error-field':registerForm.state.$error.required && (registerForm.$submitted || registerForm.state.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.state.$touched) && registerForm.state.$error.required" class="label-error">
											State is required
									</div>
								</td>
						  </tr>
						  
						   <tr>
								<td>Country</td>
								<td><input type="text" ng-model='user.address.country' name="address.country" 
								ng-class=
							"{'error-field':registerForm.address.country.$error.required && (registerForm.$submitted || registerForm.address.country.$touched)}" required>
									
									<div ng-show="(registerForm.$submitted || registerForm.address.country.$touched) && registerForm.address.country.$error.required" class="label-error">
											Country is required
									</div>
								</td>
						  </tr>
						  
						   <tr>
								<td>ZipCode</td>
								<td><input type="text" ng-model='user.address.zipCode' name="address.zipCode" 
								ng-class=
							"{'error-field':registerForm.address.zipCode.$error.required && (registerForm.$submitted || registerForm.address.zipCode.$touched)}"required>
									
									<div ng-show="(registerForm.$submitted || registerForm.address.zipCode.$touched) && registerForm.address.zipCode.$error.required" class="label-error">
											Zip-Code is required
									</div>
								</td>
						  </tr>
						  
						  <tr>
							<td>Phone</td>
							<td><input type="text"  ng-model='user.address.phone' name="address.phone" ng-class=
							"{'error-field':registerForm.address.phone.$error.required && (registerForm.$submitted || registerForm.address.phone.$touched)}" required>
								<div ng-show="(registerForm.$submitted || registerForm.address.phone.$touched) && registerForm.address.phone.$error.required" class="label-error">
									Phone is required	
								</div>
							</td>
						</tr>
						  
						  
						  
						  <tr>
							<td>&nbsp;</td>
							<td><input type="submit" value = "Register" class = "btn btn-success">
							<input type="button" value = "Reset" rel = "cancel" class = "btn btn-warning"></td>
						</tr>
						  
								
							
							</table>
						
						</fieldset>
					
					</form>
			</div>
			</div>
		
		</body>