<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

			<script>
			$(function(){
				$('#dropdownChart').hide();

				$('#dropdownMenu1').change(function(){
					alert('changes detected');
					});
				
				});
			
			/* $('#dropdownMenu1')..click(function(){
				$( ".dropdown-menu" ).change();
				alert('changes detected');
				}); */
			
			</script>

<div class="panel-body">
		<div id="dropdownChart">
            	<div class="form-group">
            		<label>
           					Tell us more about your diet, may be we can help
            		</label>
            	</div>
            	
            	
            	<div class="dropdown" >
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    					Food Chart
  					</button>
  					
  					<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
  					    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">BreakFast</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">Lunch</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">Tea Time</a></li>
					    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">Snacks</a></li>
					</ul>
					
            		</div>
</div>            
</div>