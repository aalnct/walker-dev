<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id = "studentAdmin" class="panel-control">
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
           					Address
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