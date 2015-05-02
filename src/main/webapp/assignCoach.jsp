			
			
			<script>
			
			$(function(){
				
				$('#assign').click(function(event){
					var count = 0;
					$('.input-group [data-validate^="require"]').each(function(){
						if(!$(this).val()){
							count++;
						}
						else{
							//will make ajax request here
							
						}
				});
					if(count>0){
						alert('Required Field cannot be left blank');
						event.preventDefault();
					}
					else {
						$.ajax ({
							type : 'post',
							url : '/walker/assignCoach',
							data :{
								'coachName' : $('#coachName').val(),
								'coachEmail' : $('#coachEmail').val(),
								'userName' : $('#user-name').val(),
								'useremail' : $('#user-email-id').val(),
							},
							success : function(response){
								alert(response);
							},
							error : function(response){
								alert(response);
							}
								
						});
						
					}
			});
			});
			</script>


<div class="container">
	<div class = "row">
			
			<div class="panel panel-default">
					<div class="panel-title text-center">
								<b>Assign coach to User</b>
					</div>
					
						<div class = "panel-body" style = "padding-left: 30px; margin:10px;">
								
							<div class = "input-group" style = "padding-left: 10px;margin:10px;">
								<input type = "text" id = "coachName" class = "form-control" placeholder = "Coach Name" data-validate = "require">
							</div>
							
							<div class = "input-group" style = "padding-left: 10px;margin:10px;">
								<input type = "text" id = "coachEmail" class = "form-control" placeholder = "Coach Email ID" data-validate = "require">
							</div>
								
							<div class = "input-group" style = "padding-left: 10px;margin:10px;">
								<input type = "text" id= "user-name" class = "form-control" placeholder = "User Name" data-validate = "require">
							</div>
								
							<div class = "input-group" style = "padding-left: 10px;margin:10px;">
								<input type = "Email" id = "user-email-id" class = "form-control" placeholder = "User Email ID" data-validate = "require">
							</div>
								
								
						</div>
						<div class = "form-group" style = "padding-top: 30px;margin-left:90px;">
						<input type = "button" value ="Assign" id = "assign" class = "btn btn-lg btn-primary">
						</div>
			</div>
			
	</div>
</div>