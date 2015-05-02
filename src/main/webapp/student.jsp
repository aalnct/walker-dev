<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id = "student" class="panel-control">
<form:form action = "/walker/student" method="post" commandName = "student">



		
		<div class="panel-body">
            	<div class="form-group">
            		<label>
           					Name
            		</label>
            		<input type="text" id="name" value="" class="form-control"/>
            	
            	</div>
            	
            	
            	<div class="form-group">
            		<label>
           					Branch
            		</label>
            		<input type="text" id="branch" value="" class="form-control"/>
            	
            	</div>
            	
            	<div class="form-group">
            		<label>
           					Sports Team
            		</label>
            		<input type="text" id="sprots_team" value="" class="form-control"/>
            	
            	</div>
           		
           		<div class="form-group">
                	<input type="submit" name = "save" id = "student" value = "Save" class="btn btn-lg btn-primary"/>
                </div>

            </div>

</form:form>
</div>