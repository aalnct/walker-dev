<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="/walker/styles/angular.min.js">
    </script>   
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script
	src="/walker/styles/hondaemployee.js">
    </script>    

 

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to Honda Showroom</title>



		<style>
					
					.row {
							text-align: center;
							padding-top: 20px;
							font-size: medium;
					}
		
		</style>
		
		
		<script>
			
		$(function(){
			
			
			$('.panel-control').hide();
			
			
				$('a[rel=home]').click(function(){
					window.location.replace("/walker/welcomeuser.jsp");
				});
				$('a[rel=customer]').click(function(){
					var rel = $(this).attr('rel');
					$('.panel-control').hide();
					$('#' + rel).show();
				});
				
				$('a[rel=customerRegister]').click(function(){
					var rel = $(this).attr('rel');
					$('.panel-control').hide();
					$('#' + rel).show();
				});
				
				$('a[rel=login_admin]').click(function(){
					var rel = $(this).attr('rel');
					$('.panel-control').hide();
					$('#' + rel).show();
				});
				$('ul li ul li a[rel=employeeDetails]').click(function(){
					var rel = $(this).attr('rel');
					$('.panel-control').hide();
					$('#' + rel).show();
				});
				$('ul li ul li a[rel=saleRecords]').click(function(){
					
				});
		});
		
		</script>


</head>
<body>
			
		<div class = "container">	
			<div class="row"> 
			 <div class="panel-heading">
					<div class = "panel-title">
			<p>
					Welcome to MainLand Bank
			</p>
					</div>
					</div>
				</div>
			</div>
			
			
			<nav role="navigation" class="navbar navbar-inverse">
				<div class="navbar-header">
						<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			                <span class="sr-only">Toggle navigation</span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			                <span class="icon-bar"></span>
			           </button>
				
			<ul class="nav nav-pills">
				<li class="">
					<a href="javascript:void(0);" class="navbar-brand" rel = "home">Home</a>
		        </li>
		        
		        <li>
		        	<!-- <a href="javascript:void(0);" class="navbar-brand" rel = "customer">Customer Login</a> -->
		        	
		        	
		        	<div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Customer
					    <span class="caret"></span></button>
					    
						    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						      <li><a href="javascript:void(0);" class="navbar-brand" rel = "customer">Customer Login</a></li>
						      <li role="presentation" class="divider"></li>
						      <li><a href="javascript:void(0);" class="navbar-brand" rel = "customerRegister">Customer Register</a></li>
						    </ul>
					</div>
		        	
		        	
		        </li>
		        
		        <li class="dropdown" style="font-size:large;">
			        <a href="javascript:void(0);" data-toggle="dropdown" class="dropdown-toggle" rel = "inventory">Others (only for Employees)
			        <b class="caret"></b>
			        </a>

           		<ul class="dropdown-menu">
	                <li><a href="javascript:void(0);" rel = "saleRecords">Sale Records</a></li>
	                <li><a href="javascript:void(0);" rel = "employeeDetails">Employee Details</a></li>
	                <li><a href="javascript:void(0);">Inventory Available</a></li>
	                <li class="divider"></li>
	                <li><a href="javascript:void(0);">Delete</a></li>
            </ul>
        	</li>
        		</ul>
				
		</div>		
		
		<div id="navbarCollapse" class="collapse navbar-collapse">
			
			<ul class="nav navbar-nav navbar-right">
               <li><a href="javascript:void(0);" rel = "login_admin">Admin Login</a></li>
           </ul>
	   
	   </div>
	
		</nav>
			
				<%@include file="/customer.jsp"%>
				<%@include file="/Login_Admin_Honda.jsp"%>
				<%@include file="/form.jsp"%>
				<%@include file="/customerRegister.jsp"%>
</body>
</html>