<Html>
<head>
<title>Jquery Selectors</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<boby>
<div id="wrapper">
	
<select name="language" data-bind="dropdown">
	<option value="php">PHP</option>
	<option value="java">Java</option>
	<option value="node">Node Js</option>
	<option value="ruby">Ruby</option>
	<option value="perl">Perl</option>	
	<option value="net">.Net</option>
</select>


<select name="client_language" data-bind="dropdown">
	<option value="jquery">Jquery</option>
	<option value="javascript">Javascript</option>
	<option value="angular">Angular Js</option>
</select>

<select id="show_dropdown" data-bind="dropdown">
	<option value="lang1">Lang 1</option>
	<option value="lang2">Lang 2</option>
	<option value="lang3">Lang 3</option>
</select>

<select id="show_dropdown2">
	<option value="lang1">Test 1</option>
	<option value="lang2">Test 2</option>
	<option value="lang3">Test 3</option>
</select>

<select id="country">
	<option value="india">india</option>
	<option value="USA">USA</option>
</select>

<select id="state">
	<option value="MP">MP</option>
	<option value="IL">IL</option>
</select>

<div id="container"></div>
</div>
<script type="text/javascript">
$(function(){
	
	$.fn.dropdown = function(config){
	   var defaults = $.extend({},{onChange:false},config);
		
		$(this).each(function(){
			 $(this).change(function(e){
			 	
			 	if(typeof defaults.onChange == 'function' ){
			 		defaults.onChange.call(this,$(this), $(this).val());
			 		
			 	}
			 });
		});
		
	};
	
	$('select[data-bind="dropdown"]').dropdown({
			onChange:function(el,val){
				$('#show_dropdown').hide();
				alert("You Choose:"+ val);
			}
	});
	
	$('#country').dropdown({
		onChange:function(EL,val){
			$(this).after('you choose ' + val)
			alert("You Choose:"+ val);
			
			
				$.get(
					
					'/walker/test.jsp'+val,function(response){
						$('#state').html(response);
					},
					
					
					
				);
			
			
			
		}
});
	
});
</script>
</boby>
</Html>