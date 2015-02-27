<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<%
			
		/* out.println(theDate); */

%>

	<script type="text/javascript">
	$(function(){ 
		 $("a[rel=bmicalculator]").on('click',function(){
			 $('.panel-body').toggle();
		 });
	});
	$(function(){ 
		 $("a[rel=food]").on('click',function(){
			 $('#dropdownChart').toggle();
			 //$('.panelbmi').hide();
		 });
	});
	</script>
            
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
    			<a href="javascript:void(0);"rel="food">Food</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="sleep">Sleep</a>
    		</li>
    		
    		<li>
    			<a href="javascript:void(0);"rel="coach">Coach</a>
    		</li>
    	</ul>
    </div>
    
