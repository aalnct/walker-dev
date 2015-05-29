<Html>
<head>
<title>Jquery Selectors</title>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<boby>
<div id="wrapper">
<h1>Services</h1>
<ul>
	<li  data-type="services_php" class="select">PHP</li>
	<li  data-type="services_java" class="select" data-url='../ajax_content.php?type=java'>Java</li>
	<li  data-type="services_net" class="select" data-url='../ajax_content.php?type=net'>.NET</li>
	<li  data-type="services_net">Unbind Element</li>
</ul>
<div id="container"></div>
</div>
<script type="text/javascript">
$(function(){
	
	$.fn.select = function(config){
		var defaults = $.extend({},{ajax:false},config);
		
		$(this).each(function(){
			 $(this).click(function(){
			 	$(this).parent('ul').find('li').removeClass('selected');
			 	$(this).addClass('selected');
			 	
			 	var url = $(this).attr('data-url');
			 	if(defaults.ajax && typeof url !='undefined'){
			 		$.get(url,function(response){
			 			$('#container').html(response);
			 		});
			 	}
			 	
			 });
		});
		
	};
	
	$('li.select').select({ajax:false});
	
});
</script>
<style>
	ul {list-style:none;width:50%;}
	ul li{background:#ccc;border:1px solid #aaa;padding:10px;cursor:pointer;}
	.selected{background:#aaa;border:1px solid #aaa;}
</style>
</boby>
</Html>