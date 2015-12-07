<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>



<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/additional-methods.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.14.0/jquery.validate.min.js"></script>

<script src="/walker/styles/submitrequest.js"></script>	

<link rel="stylesheet"
	href="/walker/styles/submitrequest.css"></link>

<title>AC21 Form</title>
</head>
<body>
<form id = "accForm">
		<div id = "submitRequestForm">
		
				<div class="row">
				
					<div class="col-sm-6">
					
								<div class = "form-group submit-request-form">
										<label for = "Location" class = "control-label col-sm-4">
																Location
										</label>
										<div class = "col-sm-8">
											<input type = "text" class = "form-control" value = "" placeholder = "Location">
										</div>
								</div>
								<br>
								
								<div class = "form-group submit-request-form">
										<label for = "Location" class = "control-label col-sm-4">
																Inventory Date
										</label>
										<div class = "col-sm-8">
											<input type = "text" class = "form-control" value = "" placeholder = "Inventory Date">
										</div>
								</div>
								
								<br>
								<div class = "form-group submit-request-form">
										<label for = "Location" class = "control-label col-sm-4">
																Date Entered
										</label>
										<div class = "col-sm-8">
											<input type = "text" class = "form-control" value = "" placeholder = "Date Entered">
										</div>
								
								</div>
								
								<br>
								
								<div class = "form-group submit-request-form">
										
										<label for = "Location" class = "control-label col-sm-4">
																Reason For Correction
										</label>
										
										<div class = "col-sm-8">
											
											<select multiple="multiple" name = "correctionReason" class = "form-control">

														<option value = "reason1">Reason 1</option>

														<option value = "reason2">Reason 2</option>

										</select>
										
										</div>
								</div>
								
					</div>
					
					
					<div class="col-sm-6">
							
							<div class = "form-group submit-request-form">
									
								<div class = "col-sm-8">
										
								<div class = "row">
										<div class = "col-sm-4">
											<label class = "control-label col-sm-3">Category</label>
											<select>
													<option value = "">Please Select</option>
											</select>
										
										</div>
										
										<div class = "col-sm-4">
											<label class = "control-label col-sm-3">Division</label>
											<select>
													<option value = "">Please Select</option>
											</select>
										
										</div>

										
										<div class = "col-sm-4">
												<label class = "control-label col-sm-3">Division</label>
												<select>
													<option value = "">Please Select</option>
												</select>
										
										</div>
										
										<input type = "button" id = "add" value = "Add" class = "btn btn-success pull-right">
										<input type = "button" id = "remove" value = "Remove" class = "btn btn-warning">
										
								</div>
									
								</div>
							</div>
					
					</div>
				</div>
				
					<div class = "" align="center" style = "margin-top:10px;">
										<input type = "button" class = "btn btn-success" value = "Submit">
										<input type = "button" class = "btn btn-warning" value ="Reset">
					</div>
				
			</div>
</form>
				
								
				
				
</body>
