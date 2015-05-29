<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />


<title>Welcome to Illinois Institute of Technology</title>


<script>
			
			$(function(){
				
				$('#faculty-details').hide();
				$('#collegeList').hide();
				$('#collegeDetails_facutly_details').hide();
				
			/* 	$('#about').on('click',function(){
					$about = $(this);	
					//getting the next element
					 $content = $about.next();
						$content.slideToggle(500, function () {
						$('nav a[rel=about]').text(function () {
				            //change text based on condition
				            return $content.is(":visible") ? "About" : "About";
				        });
					});
				}); */
				
				
				$('nav a[rel=academics]').on('click',function(){
					$('#faculty-details').hide();
					$('#collegeList').toggle();
				});
				
				$('nav a[rel=faculty]').on('click',function(){
					$('#faculty-details').toggle();
					$('#collegeList').hide();
				});
				
				$('nav a[rel=collegeDetails]').on('click',function(){
					$('#faculty-details').hide();
					$('#collegeList').hide();
					$('#collegeDetails_facutly_details').toggle();
				});
			});

</script>


<style>
	#clearfix{
			font-size: 16px;
	}
	
	#faculty-details{
		margin-left: auto;
    	margin-right: auto;
    	padding-top:100px;
    	width: 10%;
   	 	border: 2px;
	}
	
	.container {
    width:100%;
    border:1px solid #d3d3d3;
	}
	.container div {
    width:100%;
	}
	.container .header {
    background-color:#d3d3d3;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
	}

</style>

<body>
		
		<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
								<span class="sr-only">Toggle navigation</span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
						        <span class="icon-bar"></span>
							</button>
							<a class="navbar-brand" rel = "home" href="javascript:void(0);" style="color: red; position: relative;">ILLINOIS INSTITUTE OF TECHNOLOGY</a>
							<form:form class="navbar-form navbar-right" role="search" action = "/walker/searchresult" method = "post">
								  <div class="form-group">
								    	<input type="text" class="form-control" placeholder="Search" name = "search"/>
								  </div>
								  	<button type="submit" class="btn btn-info">
								  	<span class="glyphicon glyphicon-search">
								  	</span>
								  	Submit
								  	</button>
						   </form:form>
					</div>
				</div>
		</nav>
		
		<div class="panel-group">
  				<div class="panel panel-primary">
  					<div class="panel-heading">
					<nav id="clearfix" style="display:box;">
						<ul>
					
							<a href="javascript:void(0);" title="About" rel="about" class = "" id="about" style="padding-left: 550px;margin-left: 30px; color: white;">About</a>&nbsp;&nbsp;
							<a href="javascript:void(0);" title="Academics" rel="academics" style="margin-left: 30px;color: white;">Academics</a>&nbsp;&nbsp;
							<a href="javascript:void(0);" rel="collegeDetails" style="margin-left: 30px;color: white;" title = "College Details with faculty information">College Details</a>
							<a href="javascript:void(0);" title="Faculty Details" rel="faculty" style="margin-left: 30px;color: white;">Faculty Details</a>
					
					</ul>
				</nav>
				</div>
			</div>
		</div>
		
		
		
		<!-- <div class="content" style="display:none; padding : 5px;">
					<ul>
						<li>
									This is some random content
						</li>
						<li>
									This is some random content
						</li>
					</ul>
		</div> -->
		
		
		<div id ="faculty-details">
		<table>
		<form:form class="navbar-form navbar-right" role="saveFacultyData" action = "/walker/saveFacultyData" method = "post">
				<div class="form-group">
            		<label>
           					Name
            		</label>
            		<input type="text" id="facultyname" name = "name" value="" class="form-control" data-validate = "require" placeholder = "Enter your name"/>
            	</div>
            	
            	
            <div class="form-group">
            		<label>
           					Email Address
            		</label>
            		<input type="text" id="emailid" name = "emailAddress" value="" class="form-control" data-validate = "require"placeholder="Enter Email ID"/>
            	</div>
            	
            	
            	<div class="btn-group">
            		<label>
           					Department
            		</label>
            		
            		</br>
            		
            		<!-- <input type="text" id="identifier" name = "identifier" value="" class="form-control" data-validate = "require"/> -->
            		<!-- <a href="#" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" name="department"> Select One Option <span class="caret"></span>
            		<ul class="dropdown-menu">
			                <li><a href="#">Action</a></li>
			                <li><a href="#">Another action</a></li>
			                <li class="divider"></li>
			                <li><a href="#">Separated link</a></li>
            		</ul>
            		</a> -->
            		<input type="text" id="dept" name = "department" value="" class="form-control" data-validate = "require" placeholder="Enter your department"/>
            		</div>
            	
            	
            	</br>
            	</br>
            	
            	<div class="form-group">
            		<label>
           					Subjects
            		</label>
            		<input type="text" id="subjects_id" name = "subjects" value="" class="form-control" data-validate = "require"placeholder="Enter Subjects you teach"/>
            	</div>
            	
            	<div class="form-group">
                	<input type="submit" name = "submit" id = "student" value = "Save" class="btn btn-lg btn-primary"/>
                	<input type="submit" name = "cancel" id = "student" value = "Cancel" class="btn btn-lg btn-warning pull-right"/>
                </div>
            </form:form> 
          </table>
		</div>
		
		<%@include file="/collegedetails.jsp"%>
		
		
		<div id= "collegeList">
				<form class="form-horizontal" role="form">
					<!-- list of colleges -->
					<div class="form-group">
						<ul>
						  
							  <li class="btn btn-link">
												School of Applied Technology
							  </li>
							 
							 
							 <li class="btn btn-link">
												School of Applied Mathematics
							 </li>
							 
							 <li class="btn btn-link">
												Computer and Applied Science
							 </li>
							 
							 <li class="btn btn-link">
												Physics and Chemistry
							</li>
						
						</ul>
				</div>
			</form>			
		</div>

</body>

</head>
</html>