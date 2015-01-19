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

<link href="/walker/styles/layout.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/wysiwyg.css" rel="stylesheet" type="text/css" />
<link href="/walker/styles/styles.css" rel="stylesheet" type="text/css" />

<!-- <link href="/walker/styles/styles.css" rel="stylesheet" type="text/css" /> -->

<title>Admin User Search Parameters</title>

<style>
	/* body{
		background: lightblue;
	} */
	
</style>
			<script type="text/javascript">
				function goback(){
						window.location = "";
					}

				/* //Need to ask// */

				/* $(document).ready(function() {
					$("#logout").on("click", function(response){
						url "/walker/admin.jsp";
						$.ajax({
							url: url
					});
				}); */

				/* End
				 */
				  $(function(){ 
						 $("a[rel=add]").on('click',function(){
							$.get('/walker/addmoreusers.jsp',function(response){
								$('#finduser').append(response);
								});
							});

							$("a[rel=createusertab]").on('click',function(){
								$.get('/walker/admin_create_user.jsp',function(response){
									$('#rightside').html(response);
									});
								});

							$("#profile").on('click',function(){
								$('#loader').show();
								$.post('/walker/userinformation',{'username' : '${messages}', 'lastname' : '','emailid' : ''}, function(response){
									$('#rightside').html(response);
									$('#loader').hide();
									});
								});
						 });
			</script>
</head>
<body id="homepage">



	<form:form action="/walker/userinformation" method="POST,GET" commandName="User">
	<div id="header">
	<div id="searcharea">
	<p class="left smltxt">
            <input type="text" class="searchbox" value="Search control panel..." onclick="if (this.value =='Search control panel...'){this.value=''}"/>
            <input type ="text" class="searchbox" value="search control panel"></input>
            <input type="submit" value="Search" class="searchbtn" />
            </p>
        </div>
	</div>
	<!-- top bread crumb -->
	<table>
	<div id="breadcrumb">
    	<ul>	
        	<li><img src="/walker/styles/icon_breadcrumb.png" alt="Location" /></li>
        	<li><strong>Location:</strong></li>
            <li><a href="#" title="">Sub Section</a></li>
            <li>/</li>
            <li class="current">Control Panel</li>
            
            <li class="current">
            <a href="javascript:void(0);" rel='add'>Add More Users to search</a>
            </li>
            <div id ="loader" style="float: right; margin: 0 10px; display:none">
            <img src="/walker/styles/loading.gif" alt="Loading"/>
            </div>
            <td></td>
           
        </table>
       
        </ul>
    </div>
      

			<div id="rightside">
			<c:out value="${message}"></c:out>
			<div class="contentcontainer" id="graphs">
			<p>Please Enter the Username or lastname or emailid to retrieve user information</p>
					<table align="left" border="1" cellspacing="2" summary="userSearch">
			<tr>
				<td>Search by</td>
				<th>UserName:<input type="text" name="username"/></th>
				<td>or search by</td>
				<th>lastname:<input type="text" name="lastname"/></th>
				<td>or search by</td>
				<th>email id:<input type="text" name="emailid"/></th>
				<div id="searcharea">
					<td><input type="submit" name="profile" value="Submit" class ='btn'></input></td>
				</div>
			</tr>
			<tr>
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
									
									<td><a href="javascript:void(0);"><img src="/walker/styles/icon_delete.png" alt="Delete" title="Delete"/></a>
										<a href="javascript:void(0);">Update</a>
									</td>
								</tr>
								</c:forEach>
						</table>
						</c:if>
						</div>
			</div>
		<div id="leftside">
	    	<div class="user">
	        	<img src="/walker/styles/avatar.png" width="44" height="44" class="hoverimg" alt="Avatar" />
	            <p>Logged in as:</p>
	            <p class="username"><c:out value="${messages}"></c:out></p>
	            <input type="button" class="userbtn" name="profile" value="Profile" id="profile"></input>
	            <p class="userbtn"> <a href="/walker/admin.jsp" title="">Log out</a></p>
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
                
                
                
                <!-- <ul class="navigation">
                    <li class="heading selected">Search User</li>
                  	<li><a href="#" title="">Create Search user functionality</a></li>
                </ul>
                <ul class="navigation">
                    <li class="heading selected">Delete User</li>
                  	<li><a href="#" title="">Create Delete user functionality</a></li>
                </ul>
                <ul class="navigation">
                    <li class="heading selected">Update User</li>
                  	<li><a href="#" title="">Create update user functionality</a></li>
                </ul> -->
                
            </li>
        </ul>
        
    </div>
		
			
	</form:form>
			
</body>
</html>