<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/freelancer.css" rel="stylesheet"/>
<link href="/walker/styles/font-awesome.min.css" rel="stylesheet" type="text/css"></link>
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css"></link>
<link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css"></link>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>Welcome to Walker Application</title>


			<script type="text/javascript">
			$(function(){
				$('#contact').hide();

				$('#contactContainer').click(function(){
					$('#contact').show();
					});

				
			$("select[name=user]").change(function(){
				if($(this).val() == 0){
					document.inline = 'please select an option';
				}
				
				if($(this).val() == 1){
						window.location.replace("/walker/admin.jsp");
					}

				if($(this).val() == 2){
					window.location.replace("/walker/login.jsp");
				}
				});
			});
			</script>
					
</head>
<body id="page-top" class="index">
<!-- Navigation -->
   
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Welcome to Walker Application</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">Home</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact" id="contactContainer">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
<!-- Header -->
	<header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="/walker/styles/walker_image.jpeg" alt="">
                    <div class="intro-text">
                        <span class="name">Let us know what you choose</span>
                        <hr class="star-light">
                        <span class="skills">
                        <div style="float: center; text-align: center;">
							<select name="user" id="user">
							<option value="0">Select User Role</option>
							<option value="1">Admin</option>
							<option value="2">Application User</option>
							</select> 
						</div>
						</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    		<!-- footer -->
    		<%@include file="/contactus.jsp"%>
</body>
		
</html>