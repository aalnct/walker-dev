<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet" type="text/css" />

		
		
		<script>
						
			$(function(){
						
				
				$('#submitForm').submit(function(event){
				var count = 0;
				$('#submitForm [data-type=error]').remove();
				$('#submitForm [data-validate^="require"]').each(function(){
					//$('#error_'+$(this).attr('name')).remove();
					$(this).removeClass('input-error');
						if(!$(this).val()){
							count++;
							var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'+$(this).attr('name'),"data-type" : "error"})
							.html($(this).attr('name').substring(0, 1).toUpperCase() + $(this).attr('name').substring(1).toLowerCase() + '' + ' is required');
	  						$(this).addClass('input-error').after(error.css('color','red'));
	  						
						}
					});
					if(count > 0){
						event.preventDefault();
						}
				});
			});
			
			</script>
			
			<style>
			
				.input-error{
							
							border: 1px solid red;
				
				}
			
			</style>

<div id = "student" class="panel-control">
<form:form action = "/walker/details" method="post" commandName = "student" id = "submitForm" name="details">

		
		<c:if test="${not empty identifier}">
    		<c:out value="${identifier}"></c:out> 
		</c:if>	
		 	
			
		
		<div class="panel-body">
		
				<div class="form-group">
            		<label>
           					Unique Identifier
            		</label>
            		<input type="text" id="identifier" name = "identifier" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
		
            	<div class="form-group">
            		<label>
           					Name
            		</label>
            		<input type="text" id="name" name = "name" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	
            	<div class="form-group">
            		<label>
           					Branch
            		</label>
            		<input type="text" id="branch" name = "branch" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
            	
            	<div class="form-group">
            		<label>
           					Sports Team
            		</label>
            		<input type="text" id="sportsTeam" name = "sportsTeam" value="" class="form-control" data-validate = "require"/>
            	
            	</div>
           		
           		<div class="form-group">
                	<input type="submit" name = "save" id = "student" value = "Save" class="btn btn-lg btn-primary"/>
                </div>

            </div>

</form:form>
</div>