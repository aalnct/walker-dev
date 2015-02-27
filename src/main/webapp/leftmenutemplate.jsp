<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
			
		/* out.println(theDate); */

%>

	<script type="text/javascript">
	
	
	$(function(){ 

		$('.left-menu a').click(function(){
				var rel = $(this).attr('rel');
				$('.panel-control').hide();
				$('#' + rel).show();
		});
	});
	
	</script>
<form:form method="GET">
            
<div class="col-md-3">

    	<ul class="left-menu">
                        
    		<li>
    			<h4>Health DashBoard</h4>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);" rel="heart">Heart Rate</a>
    		</li>

    		<li>
    			<a href="javascript:void(0);"rel="bmicalculator">BMI Calculator</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="exercise">Exercise</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="foodContainer">Food</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="sleep">Sleep</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="coachContainer">Coach</a>
    		</li>
    		
    		<li>
    			<a href="<c:url value="/retrieveHistory/${id}/"/>">History</a>
    			
    		</li>
    	</ul>
    </div>
</form:form>
