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
				$('.panel-body').hide();
				
				
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
							//alert(result);
						},
						//dataType : 'Json',

						/* beforeSend: function(xhr) {
				            xhr.setRequestHeader("Accept", "application/json");
				            xhr.setRequestHeader("Content-Type", "application/json");
				        }, */
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
					});
				});
			});
			</script>

</head>
<body id="body">
<div id="dialog-form" title="Create new user">
  <!-- <p class="validateTips">All form fields are required.</p> -->
<form>
<div class="container">
	<div class="row">
	 <div class="form-group">
	<div class="page-header">
	<ul class="nav navbar-nav navbar-right">
                        <div class="input-group custom-search-form" style="width: 180px;">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
	</ul>
  <div class="panel panel-default" style="float: left;">
  <div class="panel-heading">
    	<h3 class="panel-title">${messages}</h3>
    		
  </div>
</div>
    
    <h3 class="text-center login-title">Enter following information</h3>
    </div>
    
    <%!
    String theDate = "dash";
	%>

    <%@include file="/leftmenutemplate.jsp"%>
    <div class="col-md-6">
     <div class="row">
     
     <div>
    
     		<c:out value="${result}"></c:out>
     </div>
     
     <div class="panel panel-default">
            <div class="panel-heading">
              <h3 class="panel-title">Health Chart</h3>
            </div>
            	<%@include file="/foodtemplate.jsp"%>
            <div class="panelbmi">
            
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
		      
		      <!-- Allow form submission with keyboard without duplicating the dialog button -->
		      
		      <!-- <div id="piechart" style="width: 900px; height: 500px;"></div> -->

		      
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