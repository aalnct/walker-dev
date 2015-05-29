<div id = "collegeDetails_facutly_details" class="panel-control">

<form:form commandName = "college" action = "">
<div class="panel-body">	
	
	<div class="form-group">
      <label for="id">College Name:</label>
      <input type="text" class="form-control" id="college_name" name = "collegeName">
    </div>
	
	<div class="form-group">
      <label for="username">Dean Name:</label>
      <input type="text" class="form-control" id="dean_name" name = "deanName">
    </div>
    
    <div class="form-group">
      <label for="firstname">Faculty Name:</label>
      <input type="password" class="form-control" id="faculty_name" name="facultyName">
    </div>

	<div class="form-group">
      <label for="email id">Faculty Email Address:</label>
      <input type="text" class="form-control" id="faculty_email_address" name="facultyEmailAddress">
    </div>
    
    <div class="form-group">
      <label for="username">College Identification Code:</label>
      <input type="text" class="form-control" id="college_identification_code" name="collegeIdentificationCode">
    </div>
    
	<div class="form-group">
                	<input type="submit" name = "save" id = "profileUpdate" rel = "profile-update" value = "Save" class="btn btn-lg btn-success"/>
                	<input type="button" name = "cancel" id = "cancelUpdate" rel = "cancel-update" value = Cancel class="btn btn-lg btn-danger pull-right"/>
	</div>
	
</div>	
</form:form>
</div>