<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Welcome 
<c:out value="${messages}"></c:out>
</title>
<style>
</style>
			<script type="text/javascript">
			
			$(document).ready(function(){

				$('#saveCalculation').hide();
				$('.panel-control').hide();
				
				
				$('#bmi_calculate').click(function(e){
					$.ajax({
						type: 'get',
						data :{
							'age':$("#age").val(), 
							'height':$("#height").val(), 
							'weight':$("#weight").val()
							},
						url: '/walker/calculateBMI/',

						success : function(result){
							$('#bmiresult').val(result);
							
						},
						statusCode: {
						    404: function(response) {
						      alert('Page not found');
						    },
						  },
						error:function (result) {
							$('#bmiresult').append(${result});
							}
						});
					$('#saveCalculation').show();
				});

				$('#saveCalculation').click(function(){
					$.ajax({
						type: 'post',
						url: '/walker/savebmi/',
						data :{
							'id':'${id}',
							'age':$("#age").val(),
							'height':$("#height").val(), 
							'weight':$("#weight").val(),
							'bmi' : $("#bmiresult").val()
							},
							success : function(result){
								alert(result);
							},
					});
				});
				
			$( ".dropdown-menu li a[rel=editProfile]" ).on( "click", function(response) {
				      $.ajax({
				    	 	type:'get',
				    	 	url:'/walker/updateUserInformation/',
				   			data :{
				   				
				   				'id' : '${id}'
				   				
				   			},
				   			success :function(response) {
				   				alert(response);
								<c:forEach var = "usersData" items = "${users}">
		   						<td><c:out value="${usersData.firstName}"></c:out></td>
		   						alert('<c:out value="${usersData.firstName}"></c:out>');
		   						</c:forEach>
				   			},
				   			error :function(response){
				   				alert(response);
				   			},
				      });
				      
				      
				    });
			
			$(".dropdown-menu li a[rel=student]").on('click',function(){
				var rel = $(this).attr('rel');
				$('.panel-control').hide();
				$('#' + rel).show();
			
			});
				
			$(".dropdown-menu li a[rel=passwordContainer]").on('click',function(){
				var rel = $(this).attr('rel');
				$('.panel-control').hide();
				$('#' + rel).show();
			
			});
			
			
			$(".dropdown-menu li a[rel=logout]").on('click',function(){
				alert('test');
				/* var rel = $(this).attr('rel');
				$('.panel-control').hide();
				$('#' + rel).show(); */
			
			});
});		
			</script>

</head>
<body id="body">
			
		<div>
			<c:if test="${fn:length(users) > 0}">
			
			<c:forEach var = "userData" items = "${users}" >
			<td><c:out value="${usersData.firstName}"></c:out></td>
			</c:forEach>
			
			</c:if>		
			
		</div>
			

<div id="dialog-form" title="Create new user">
<form>
<div class="container">	
	<div class="row">
	 <div class="form-group">
	<div class="page-header" style="margin-left: 55px;">
	
	<ul class="nav navbar-right">
	
	<li class="dropdown">
               
       <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                Settings <span class="caret"></span></a>
                
                <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                  <li role = "updatePassword"><a href="#" rel="passwordContainer">Change Password</a></li>
                  <li role = "profile"><a href="javascript:void(0)" rel = "editProfile">Edit Profile</a></li>
                  <li role="logout"><a href="javascript:void(0)" rel="logout">Logout</a></li>
                  <li class="divider"></li>
                  <li role="student"><a tabindex="-1"  href="javascript:void(0)" rel="student">My Student Profile</a>
		                  <ul class="dropdown-menu">
		   						<a href = "javascript:void(0)">Subjects</a>
		   						<a href = "javascript:void(0)">Grades</a>
		   						<a href = "javascript:void(0)">Sports Team</a>
		    			  </ul>
                  </li>
                </ul>
              </li>
	</ul>
	
<div class="panel panel-default" style="float: left; ">
  <div class="panel-heading">
    	<h3 class="panel-title">${messages}</h3>
    	<b><c:if test="${not empty emptyList}">
    		${emptyList} 
		    		
    	</c:if></b>
  </div>
</div>
   <div class="message" style="color: red;">
   
   </div>
    <h3 class="text-center login-title">Enter following information</h3>
    </div>
    
    <%@include file="/leftmenutemplate.jsp"%>
    <div class="col-md-6">

     <div class="row">
     <div>
     		<c:out value="${result}"></c:out>
     </div>
     
     <c:out value="${Successfull}"></c:out>
     
     <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Health Chart</h3>
            </div>
            	
            	<%@include file="/foodtemplate.jsp"%>
            	<%@include file="/coach.jsp"%>
            	<%@include file="/update.jsp"%>
            	<%@include file="/student.jsp"%>
            	
            
            <div id="bmicalculator" class="panel-control">
            
            <div class="panel-body">
            	<div class="form-group">
            		<label>
           					Age
            		</label>
            		<input type="text" id="age" value="" class="form-control"/>
            	
            	</div>
            	
            	
            	<div class="form-group">
            		<label>
           					Height
            		</label>
            		<input type="text" id="height" value="" class="form-control"/>
            	
            	</div>
            	
            	<div class="form-group">
            		<label>
           					Weight
            		</label>
            		<input type="text" id="weight" value="" class="form-control"/>
            	
            	</div>
           		
           		<div class="form-group">
           			<label>BMI</label>
           			<input type="text" class="form-control" value = "${result}" id = "bmiresult" placeholder="BMI" readonly/>
           			
           		</div>
                <div class="form-group">
                	<input type="button" name = "bmi" id = "bmi_calculate" value = "Calculate" class="btn btn-lg btn-success"/>
                	<input type="button" name = "saveCalculation" id = "saveCalculation" value = "Save" class="btn btn-lg btn-success" style="float: right; vertical-align: middle;"/>
                </div>

            </div>
            </div>
          </div>
          </div>
   
    </div>
    </div>
    </div>
  </div>
</form>

			

				

</div>
</body>
</html>