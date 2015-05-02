<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>		
		
		<script type="text/javascript">

				$(function(){
						$('#coachid').click(function(){
								$.ajax ({
									
								url: "/walker/saveCoach/",
								data : {
									'name' : $('#nameid').val(),
									'coachEmailId' : $('#emailid').val(),
									'description' : $('#descriptionid').val()
									},
									
									type: "post",

									success : function(result){
										alert(result);
									},
									error : function(result) {
										alert('error with request');
									},
							});
					});
				});
		</script>

<form:form>
<div style="float: left; width:50% ; border:1px solid #ccc; padding:5px" valign="middle">
			<table align="left" cellspacing="2" width="100%">
					
				<tr>
				<th>Name</th><td><input type="text" name="cname" id ="nameid" maxlength="10" title="Please Enter Coach's name"  data-validate="require"/></td>
				</tr>
				
				<tr>
				<th>
				<label>Coach Email ID</label>
				</th>
				<td><input type = "email" name="cemail" id = "emailid"  placeholder = "Enter Coach Email ID"></td>
				</tr>
				
				
				<tr>
				<th>Description</th>
				</tr>
				<tr>
					<th>
					<textarea rows="4" cols="50" name="description" id = "descriptionid" placeholder="Tell Something about Coach... :)"></textarea>
					</th>
				</tr>
				
				<tr>
					<th></th>
					<td>
					
					</td>
					</tr>
					<tr>	
					<td>
					<input type="button" class = "btn btn-sm btn-primary" name="CoachInformation" id = "coachid" value="Save Information"/>
					</td>
				</tr>
				</table>
				</div>
				</form:form>