		
		<script>
			$(function(){
				$('#foodCategory li a').click(function(){
						var foodItems = $(this).attr('role');
						alert(foodItems);
					});
				
				});
			
			
			
			</script>
<div id="foodContainer" class="panel-control">

<div class="panel-body">
		
            	<div class="form-group">
            		<label>
           					Tell us more about your diet, may be we can help
            		</label>
            	</div>
            	
            	
            	<div class="dropdown" >
					<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
    					Food Chart
  					</button>
  					
  					<ul class="dropdown-menu" id="foodCategory">
  					    <li><a role="breakfast" tabindex="-1" href="javascript:void(0);">BreakFast</a></li>
					    <li><a role="lunch" tabindex="-1" href="javascript:void(0);">Lunch</a></li>
					    <li><a role="tea" tabindex="-1" href="javascript:void(0);">Tea Time</a></li>
					    <li><a role="snacks" tabindex="-1" href="javascript:void(0);">Snacks</a></li>
					</ul>
					
            		</div>
  </div>
</div>