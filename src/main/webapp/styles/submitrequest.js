
$(function(){
	
	$('#accForm').on('click', function(){
			
		//before going to form, fetch the data and populate
		window.location.assign("/walker/accounting.jsp")
	});
	
	
	
	$('#accountingForm').on('submit',function(event){
			event.preventDefault();
			BootstrapDialog.show({
	            message: 'Form is Submitted!'
	        });
			
	});
	
	$('#mainmenu').on('click',function(event){
		event.preventDefault();
		
		BootstrapDialog.show({
            message: 'Redirecting to main menu. Please Wait!'
        });
		
		window.location.href = '/walker/learning2.jsp';
		
	});
	
	
	$('#ac21Form').validate({
		rules: {
			amount: {
				required: true,
				min: 1000
			},
			division: {
				required : true,
			},
			category:{
				required: true,
			},
			format: {
				required: true,
			},
			location: {
				required: true,
			},
			invDate: {
				required : true,
			},
			dateEntered: {
				required : true,
			},
			explanation: {
				required : true
			},
			textbox: {
				required : true,
			},
			uploadedFile:{
				required: true,
			}
		},
		messages: {
			amount: "Please Enter amount to contuinue",
			
			format: {
				required : "Please Enter Format to Continue"
			},
			location: {
				required : "Please Enter location to Continue"
			},
			invDate: {
				required : "Please Enter Inventory Date to Continue"
			},
			dateEntered: {
				required: "Please Enter Date to Continue"
			},
			explanation :{
				required: "Please provide Explanation to continue"
			},
			division: {
				required: "Please Enter Division to continue"
			},
			category: {
				required : "Please Enter Category to continue"
			},
			textbox: {
				required: "Please provide value to continue"
			},
			uploadedFile: {
				required: "Please upload document to validate your claim"
			}
		}
});
	
	var counter = 0; //to limit the number of text boxes being created

	$('#addButton')
			.click(
					function() {

						

						var newTextBoxDiv = $(document.createElement('div'))
								.attr("id", 'TextBoxDiv' + counter);

						//adding text boxes dynamically

						newTextBoxDiv
								.after()
								.html(
										'<label>Division '
												+ ' '
												+ ' : </label>'
												+

												'<input type="text" name="textbox' + counter + 

  '" id="textbox' + counter + '" value="" >'
												+ '<label>Category '
												+ ' '
												+ ' : </label>'
												+

												'<input type="text" name="textbox' + counter + 

  '" id="textbox' + counter + '" value="" >'

												+ '<label>Amount '
												+ ' '
												+ ' : </label>'
												+

												'<input type="text" name="textbox' + counter + 

  '" id="textbox' + counter + '" value="" >');

						newTextBoxDiv.appendTo('#TextBoxesGroup');

						counter++;

					});

	//Remove Textbox function dynamically

	$('#removeButton').click(function() {
		counter--;
		$("#TextBoxDiv" + counter).remove();

	});
	
});