<Html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<title>Jquery Drop Down Change Event</title>

</head>
<boby>
			<script>
			$(function(){

					$('.test_div').hide();

				$('#submitButton').click(function(e){
					if($('#firstname').val() == ''){
							alert('first name is required');
						
						}
					});

						$('#ul1Id li').click(function(){

								alert($(this).html());

								var rel = $(this).attr('class');
								alert(rel);

								$('.test_div .' + rel).show();

								/* if($.trim($(this).html()) == 'Test UL'){
										$('.test_div').show();
										$('.test_div #ul1').show();
										$('.test_div #ul2').hide();
										$('.test_div #ul3').hide();
								}

								else if($.trim($(this).html()) == 'Test UL2'){
									$('.test_div').show();
									$('.test_div #ul1').hide();
									$('.test_div #ul2').show();
									$('.test_div #ul3').hide();
								}

								else if($.trim($(this).html()) == 'Test UL3'){
									$('.test_div').show();
									$('.test_div #ul1').hide();
									$('.test_div #ul2').hide();
									$('.test_div #ul3').show(); 

									}*/
							}); 
				});
					
				
			</script>

	<form>
	
			<fieldset>
			<table>
					<label>Enter First Name</label>
					<tr>
					<td>
						<input type ="text"  id="firstname" name="first_name">
					</td>
					
					
					<label>Enter Last Name</label>
					
					<td>
						<input type ="text" name="last_name" id="lastName">
					</td>
					
					
					<label>Enter User Name</label>

					<td>
						<input type ="text" name="user_name" id="userName">
					</td>
					
					
					
					<td><input type="submit" id = "submitButton" value = "Submit"></td>
					</tr>
					
			</table>		
			</fieldset>
			
	</form>
	
	
	<ul id="ul1Id">
		<li class ="class1">
		Test UL
		</li>
		<li class ="class2">
		Test UL2
		</li>
		<li class ="class3">
		Test UL3
		</li>
		
	</ul>
	
<div class="test_div">	
	
	<div id= "ul1" class ="class1">
				test ul1 content
	</div>
	
	<div id= "ul2">
				test ul2 content
	</div>
	
	<div id= "ul3">
				test ul3 content
	</div>

</div>
</boby>
</Html>