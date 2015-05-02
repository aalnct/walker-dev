<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<div id = "passwordContainer" class="panel-control">
<div class="panel-body">
		
				<script>
						
						$(function(){
								$('#updatepsswd').click(function(){
									$.get('/walker/addmoreusers.jsp',function(response){
										
										});
								});
						});
				
				</script>
	<form:form action="" method="Post" commandName="User" >
            	<div class="form-group">
            		<label>
           					Please update your password
            		</label>
            	</div>
            	
            	<div class="input-group">
            			<input type="text" class="form-control" name = "username" placeholder="Username">
            	</div>
            	</br>
            	<div class="input-group">
            			<input type="password" class="form-control" name = "password" placeholder="LastName/Password">
            	</div>
            	
            	<div class = "form-group" style="padding: 10px;">
            		<input type = "button" value = "Update" class="btn btn-lg btn-success" id = "updatepsswd">
            		<input type = "button" value = "Cancel" class="btn btn-lg btn-warning pull-right">
            		
            	</div>
      </form:form>

</div>
</div>
