

<script>
		
		$(function(){
			var count = 0;
				$('#cancelUpdate').click(function(){
					
					/* if($(".form-control").val() == ''){
						alert('function cannot be executed, since no value is entered');
						
					} */
					
						//alert('Are you sure!!');
						$(".form-control").val("");	
					
					
				});
		});
		
</script>

<div id = "profileupdate" class="panel-control">
<form:form commandName = "user" action = "/walker/updateprofile">
<div class="panel-body">	
	
	<div class="form-group">
      <!-- <label for="id">UserID:</label> -->
      <input type="text" class="form-control" id="id" name = "id">
    </div>
	
	<div class="form-group">
      <label for="username">First Name:</label>
      <input type="text" class="form-control" id="fname" name = "firstName">
    </div>
    
    <div class="form-group">
      <label for="firstname">Last Name:</label>
      <input type="password" class="form-control" id="lname" name="lastName">
    </div>

	<div class="form-group">
      <label for="email id">Email ID:</label>
      <input type="text" class="form-control" id="emailid" name="emailAddress">
    </div>
    
    <div class="form-group">
      <label for="username">UserName:</label>
      <input type="text" class="form-control" id="username" name="username">
    </div>
    
	<div class="form-group">
      <label for="dob">Date of Birth:</label>
      <input type="text" class="form-control" id="dateofbirth" name="dob">
    </div>
	
	
	<div class="form-group">
      <label for="AddressLine1">Address Line1:</label>
      <input type="text" class="form-control" id="add1" name="addressLine1">
    </div>
    
    
    
    <div class="form-group">
      <label for="AddressLine2">Address Line2:</label>
      <input type="text" class="form-control" id="add2" name="addressLine2">
    </div>
    
    
    
    <div class="form-group">
      <label for="AddressLine3">Address Line3:</label>
      <input type="text" class="form-control" id="add3" name="addressLine3">
    </div>
    
	
	<!-- <div class="form-group">
      <label for="country">Country:</label>
      <input type="text" class="form-control" id="Country" name="country">
    </div> -->
	
	<div class="form-group">
      <label for="state">State:</label>
      <input type="text" class="form-control" id="State" name="state">
    </div>
    
    <div class="form-group">
      <label for="state">City:</label>
      <input type="text" class="form-control" id="City" name="city">
    </div>
    
    <div class="form-group">
      <label for="zip">ZipCode:</label>
      <input type="text" class="form-control" id="zipCode" name="zipcode">
    </div>
	
	<div class="form-group">
                	<input type="submit" name = "save" id = "profileUpdate" rel = "profile-update" value = "Save" class="btn btn-lg btn-success"/>
                	<input type="button" name = "cancel" id = "cancelUpdate" rel = "cancel-update" value = Cancel class="btn btn-lg btn-danger pull-right"/>
	</div>
	
</div>	
</form:form>
</div>