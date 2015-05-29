<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
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
					document.inline = 'Please select an option';
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
   <%-- <table>
    		<tr>
		<td>
			<tiles:insertAttribute name="header"/>
		</td>
	</tr>
</table> --%>
			Here goes header
<!-- Header -->
	<header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="/walker/styles/walker_image.jpeg" alt="Keep Running"/>
                    <div class="intro-text">
                        <span class="options">Please select atleast one option</span>
                        <hr class="star-light"/>
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