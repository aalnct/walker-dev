/**
 * 
 */

function valdiated(){
	alert('function call');
}


$(function(){ 
	$("a[rel=createuser]").on('click',function(){
		
		$('#dynamicWrapper').remove();
		
		var dialog = $("<div/>").attr({"id":'dynamicWrapper'});
		
		dialog.appendTo('body');
		
		
		$('#dynamicWrapper').dialog({
			width:"700",
			open:function(){
				$.get('CreateUser.jsp',function(html){
					$('#dynamicWrapper').html(html);
				});
			}
		});
		
	});
});

function validateEmail(email){
	var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
}

$(function(){
	$('form').submit(function(e){
			var count = 0;
			$("[data-validate='require']").each(function(){
					if(!$(this).val()){
						count++;
						var error = $('<div/>').attr({"class" : "input_error" , "id" : 'error_'
							+$(this).attr('name')}).html('Field is required');
						
						$(this).after(error);
						}
					else{
						$('#error_'+$(this).attr('name')).remove();
						}
				});
			if(count > 0){
				e.preventDefault();
				}
		});
});