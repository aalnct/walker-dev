<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>

<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>

<script

	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"

	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css"></link>	
	
<script

	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
	
<link rel="stylesheet"

	href="/walker/styles/accounting.css"></link>	

<script src="/walker/styles/submitrequest.js"></script>

<title>Accounting Department Form</title>
</head>
<body>


				<div class = "container">
						
						
						<div class = "row">
						
								
								<div class = "col-xs-12">
								
									<h3>Basic Form</h3>
									
									<div class = "accounting">
										<form action = "" method = "" id = "accountingForm" commandName = "AccountingForm">
												
												<div class = "form-group">
													
													<label for = "">Status</label>
													
													<select class = "form-control" name = "status">
															<option value = "">Please Select</option>
															<option value = "approved">Approved</option>
															<option value = "denied">Denied</option>
													</select>
												</div>
												
												<div class = "form-group">	
													
													<label for = "">Completion Type</label>
														<select class = "form-control" name = "completionType">
															<option value = "">Please Select</option>
															<option value = "ac21">AC21 Form</option>
															<option value = "misc">Miscellaneous</option>
													</select>
												
												</div>
												
												<div class = "form-group">
													<label for = "">Total Correction Amount</label>
														<input type = "text" class = "form-control" id = "amount" name = "amount" value = "total amount">
												</div>
												
												<div class = "form-group">
														<label for = "">Date Completed</label>
														<input type = "text" value = "" id = "datepicker" name = "datecompleted" class = "form-control">
												</div>
												
												<div class = "form-group">
														<label for = "">Date Last Updated</label>
														<input type = "text" value = "" id = "datepicker" name = "dateupdated" class = "form-control">
												</div>
												
												<div class = "form-group">
														<label for = "">Last Updated By</label>
														<label name = "lastUpdatedBy">:
														<!-- UserID will be Pre populated -->
															User ID
														</label>
												</div>
												
												
												<div class = "form-group">
														
														<button type = "submit" class = "btn btn-primary" id = "submitAccForm">Submit</button>
														<button type = "button" class = "btn btn-info" id = "mainmenu">Return to Main Menu</button>
														
														
												</div>
												
										</form>
									</div>
								</div>
							
						
						</div>
				
				</div>
				
				



</body>
</html>