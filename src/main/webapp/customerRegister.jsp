<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class = "panel-control" id = "customerRegister">

<form:form action = "" method="post" commandName = "student" id = "submitForm" name="details">
		
						
		
		<div class="panel-body" align="center">
		<b align="center" style = "color: green;">Please Register</b>
		
		
				<div class="input-group">
            		<label>
           					First Name
            		</label>
            		<input type="text" id="identifier" name = "identifier" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
		
            	<div class="input-group">
            		<label>
           					Last Name
            		</label>
            		<input type="text" id="name" name = "name" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	
            	<div class="input-group">
            		<label>
           					Address
            		</label>
            		<input type="text" id="branch" name = "address" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	
            	<div class="input-group">
            		<label>
           					Account Number
            		</label>
            		<input type="text" id="branch" name = "accountNumber" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	
            	<div class="input-group">
            		<label>
           					Date of Birth
            		</label>
            		<input type="text" id="sportsTeam" name = "dob" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	
            	<div class="input-group">
            		<label>
           					Zip-Code
            		</label>
            		<input type="text" id="sportsTeam" name = "zipCode" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	<div class="input-group">
            		<label>
           					City
            		</label>
            		<input type="text" id="sportsTeam" name = "city" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	<div class="input-group">
            		<label>
           					State
            		</label>
            		<input type="text" id="sportsTeam" name = "state" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	<div class="input-group">
            		<label>
           					Country
            		</label>
            		<input type="text" id="sportsTeam" name = "country" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
           		
           		<div class="input-group">
                	<input type="submit" name = "save" id = "student" value = "Save" class="btn btn-lg btn-primary"/>
                </div>

            </div>




</form:form>
</div>