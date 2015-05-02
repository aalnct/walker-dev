<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet" type="text/css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>History Health Record</title>
</head>
<body>
			<form>
			
	<section class="panel panel-primary">
				<div class="panel-heading" style="padding:0px;">
			 	<h3 class="text-center login-title">Health Record</h3>
			 	<div style="float:right; padding: 0px;">
			 			back
			 	</div>
			 </div>
		<div class="panel-body">
			<div class="table-responsive">
			<table class="table table-hover" border="2" style="width:30%;" align="center">
			
				<thead>
					<tr>
						<th>#</th>
						<th>Age</th>
						<th>Weight</th>
						<th>Height</th>
						<th>bmi</th>
					</tr>
				</thead>
				
				<tbody>
				
				<c:forEach items= "${history}" var="data">
					<tr class="active">
							<td width="10%"><c:out value="${data.userId}"></c:out></td>
							
						
							<td width="10%"><c:out value="${data.age}"></c:out></td>
					
					
							<td width="10%"><c:out value="${data.weight}"></c:out></td>
						
							<td width="10%"><c:out value="${data.height}"></c:out></td>
						
							<td width="10%"><c:out value="${data.bmi}"></c:out></td>
						</tr>
					</c:forEach>
					</tbody>	
			</table>
			
			</div>
			</div>
			</section>
			</form>
			
</body>
</html>