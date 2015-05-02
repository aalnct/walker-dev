<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript" src='/walker/styles/functions.js'></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<link href="/walker/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/styles.css" rel="stylesheet" type="text/css" />

<title>Admin User Search Parameters</title>

<style>
	/* body{
		background: lightblue;
	} */
	
</style>
			<script type="text/javascript">
				  $(function(){ 

					  	$('#coachTable').hide();
					  	
						 $("a[rel=add]").on('click',function(){
							$.get('/walker/addmoreusers.jsp',function(response){
								$('#finduser').append(response);
								});
							});

						 $("a[rel=advance]").on('click',function(){
							 		$('#advancesearch').toggle();
								});

						 $("#logout").on('click',function(){
							 	$.post('/walker/searchuser/',function(response){
									$('#finduser').html(response);
									});
								});
						 
						 
						 $("a[rel=delete]").on('click',function(e){
							 
								$.get('/walker/deleteuser/',{'username' : '${usersList.id}'},function(response){
									
									});
								});				
						
					
							$("a[rel=createusertab]").on('click',function(){
								$.get('/walker/admin_create_user.jsp',function(response){
									$('#rightside').html(response);
									});
								});
							
							$("a[rel=coachinformation]").on('click',function(){
								$.get('/walker/admin_create_coach.jsp',function(response){
									$('#rightside').html(response);
									});
								});

							$("a[rel=coachlist]").on('click',function(){
								$.get('/walker/coachlist/',function(response){
										$('#coachTable').show();
										$('#coachTable').append(response);
									});
								});
							
							$("#profile").on('click',function(){
								$('#loader').show();
								$.post('/walker/userinformation',{'username' : '${messages}', 'lastname' : '','emailid' : ''}, function(response){
									$('#rightside').html(response);
									$('#loader').hide();
									});
								});

							$("#userlist").on('click',function(){
								$('#loader').show();
								$.get('/walker/userinformation',{'username' : '${messages}', 'lastname' : '','emailid' : ''}, function(response){
									$('#rightside').html(response);
									$('#loader').hide();
									});
								});
							
							
							$('a[rel=assignCoach]').click(function(){
									$.get('/walker/assignCoach.jsp',function(response){
										$('#rightside').html(response);
									});
							});
							
						 });
			</script>
</head>
<body id="homepage">

	<form:form action="/walker/userinformation" method="post,get" commandName="User" pagesize="7" >
	<div id="header" style="#FF0000;">
		
	</div>
	<!-- top bread crumb -->
	<table>
	<div id="breadcrumb">
    	<ul>	
        	<li><img src="/walker/styles/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>Location:</strong></li>
            
            
            <div id ="loader" style="float: right; margin: 0 10px; display:none">
            <img src="/walker/styles/loading.gif" alt="Loading"/>
            </div>
            <td></td>
           
        </table>
       
        </ul>
    </div>
    
    			
    			
    			
    
			<div id="rightside" style= "margin-top:0px;">
			<c:out value="${message}"></c:out>
			<div class="contentcontainer" style= "margin:0px 0 10px 0; float:left;">
			<!-- <p>Please Enter the Username or lastname or emailid to retrieve user information</p> -->
					<table align="left" cellspacing="2" summary="userSearch">
			<tr>
				
				<td><label>UserName</label>
				<input type="text" name="username"/></td>
				
				<td><label>Last Name</label><input type="text" name="lastname"/></td>
				
				<td><label>Email ID</label><input type="text" name="emailid"/></td>
				
				<td valign="bottom"><label></label>
				<input type="submit" name="submit" value="Search" class="btn"/>
				&nbsp;&nbsp;<a href="javascript:void(0)" rel="advance">Advance Search</a>
				</td>
				
			</tr>		
				
				<tr id = "advancesearch" style = "display:none;">
					<td><label>Date of Birth</label><input type="text" id = "datepicker" name="dob" maxlength="20"/></td>
					<td><label>ZipCode</label><input type="text" name="zip" maxlength="20"/></td>
				</tr>
			
				</table>
				<div id="finduser">
				</div>
				
			</div>
			
			<div id="searchedusers">
			<c:if test="${fn:length(userlist) > 0}">
					<table align="center" border="2">
								<th>First Name</th>
								<th>Last Name</th>
								<th>UserName</th>
								<th>Email ID</th>
								<th>Date of Birth</th>
								<th>Address Line 1</th>
								<th>Address Line 2</th>
								<th>Address Line 3</th>
								<th>City</th>
								<th>State</th>
								<th>Zipcode</th>
								<th>Actions</th>
							<c:forEach var = "usersList" items = "${userlist}">
								<tr>
									<td><c:out value="${usersList.firstName}"></c:out></td>
									<td><c:out value="${usersList.lastName}"></c:out></td>
									<td><c:out value="${usersList.username}"></c:out></td>
									<td><c:out value="${usersList.emailAddress}"></c:out></td>
									<td><c:out value="${usersList.dob}"></c:out></td>
									<td><c:out value="${usersList.address.addressLine1}"></c:out></td>
									<td><c:out value="${usersList.address.addressLine2}"></c:out></td>
									<td><c:out value="${usersList.address.addressLine3}"></c:out></td>
									<td><c:out value="${usersList.address.city}"></c:out></td>
									<td><c:out value="${usersList.address.state}"></c:out></td>
									<td><c:out value="${usersList.address.zipcode}"></c:out></td>
									
									<td>
									<a href="/walker/deleteuser/${usersList.id}" rel="delete">
									<img src="/walker/styles/icon_delete.png" alt="Delete" title="Delete"/></a>
										<a href="javascript:void(0);"><img src="/walker/styles/icon_edit.png" alt="Update" title="Update"/></a>
									</td>
								</tr>
								</c:forEach>
								
						</table>
								<div style="float: center; margin: 0 10px;">
								        <ul>
								        </br>
								            <li align="center">
								            
								            <a href="/walker/userinformation" name="page">First</a>|
									        <a href="/walker/userinformation" name="page">Prev</a>|
									        <a href="/walker/userinformation" name="page">2</a>|
									        <a href="/walker/userinformation" name="page">3</a>|
									        <a href="/walker/userinformation" name="page">4</a>|
									        <a href="/walker/userinformation" name="page">Next</a>|
									        <a href="/walker/userinformation" name="page">Last</a>
									        
								            </li>
								        </ul>
        
    						</div>
						</c:if>
						</div>
			</div>
		<div id="leftside">
	    	<div class="user">
	        	<img src="/walker/styles/avatar.png" width="44" height="44" class="hoverimg" alt="Avatar" />
	            <p>Logged in as:</p>
	            <p class="username"><c:out value="${messages}"></c:out></p>
	            <input type="button" class="userbtn" name="profile" value="Profile" id="profile"></input>
	            <input type="submit" class="userbtn" name="logout" value="Log Out" id="logout"></input>
	            <!-- <p class="userbtn"><a href="/walker/admin.jsp" title="">Log out</a></p> -->
	        </div>
	        <div class="notifications">
	        	<p class="notifycount"><a href="" title="" class="notifypop">10</a></p>
	            <p><a href="" title="" class="notifypop">New Notifications</a></p>
	            <p class="smltxt">(Click to open notifications)</p>
	        </div>
        
        <ul id="nav">
        	    
                <li>
                <a class="collapsed heading selected">User Manager</a>
                 	<ul class="navigation">
                	 <!-- to do -->
                    <li><a href="/walker/userinformation" rel="userlist">User List</a></li>
                    <!-- to do end -->
                    <li><a href="javascript:void(0)" title="Add User" rel="createusertab">Add User</a></li>
                </ul>
            	</li>
            	
            	
            	<li>
                <a class="collapsed heading selected">Coach</a>
                 	<ul class="navigation">
                	 <!-- to do -->
                	 <li><a href="javascript:void(0)" title = "Coach" rel="coachlist">Coaches</a></li>
                    <li><a href="javascript:void(0)" title = "Coach" rel="coachinformation">Enter New Coach Information</a></li>
                    <li><a href="javascript:void(0)" title = "Coach" rel="assignCoach">Assign Coach to Member</a></li>
                    <!-- to do end -->
                    
                </ul>
            	</li>
            	
            </li>
        </ul>
        		<table id="coachTable">
        			<tr>
        				<th>Name</th>
        				<th>ID</th>
        				<th>Description</th>
        			</tr>
        		</table>
        		
    </div>
			
			
		
			
	</form:form>
			
</body>
</html>