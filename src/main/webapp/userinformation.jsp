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
<title>Retrieved User Information</title>

<script type="text/javascript" >
		$(':radio').change(function (event) {
			alert('Hi');
		    var id = $(this).data('id');
		    $('#' + id).addClass('none').siblings().removeClass('none');
		});
</script>

	<style>
		/* .none {
	 	   display:none;
		} */
	</style>
</head>
	
<body>
				<c:if test="${result !=null}">
					<c:out value="${result}">information deleted</c:out>
				</c:if>
				<c:out value=""></c:out>
					
					<form:form method="post" action="deleteuser">
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
							
								<tr>
									<td><c:out value="${user.firstName}"></c:out></td>
									<td><c:out value="${user.lastName}"></c:out></td>
									<td><c:out value="${user.username}"></c:out></td>
									<td><c:out value="${user.emailAddress}"></c:out></td>
									<td><c:out value="${user.dob}"></c:out></td>
									<td><c:out value="${user.address.addressLine1}"></c:out></td>
									<td><c:out value="${user.address.addressLine2}"></c:out></td>
									<td><c:out value="${user.address.addressLine3}"></c:out></td>
									<td><c:out value="${user.address.city}"></c:out></td>
									<td><c:out value="${user.address.state}"></c:out></td>
									<td><c:out value="${user.address.zipcode}"></c:out></td>
								</tr>
								
						</table>
									
									<!-- </br><input type = "radio" name ="user" value = "Create" data-id="createuser">Create New User</input>
									</br><input type = "radio" name ="user" value = "update" data-id="updateuser">Update</input>	
									</br><input type = "radio" name ="user" value = "deleteUser" data-id="deleteuser">Delete</input> -->
									
									
									<tr></tr>
									<tr></tr>
									<tr></tr>
									<td></td>
									<td></td>
									
									</br>
									
									<!-- </br><div id="createuser" class="none"><input type="submit" name="creatinguser" value="Create User" align="top"/></div>
									</br><div id="updateuser" class="none"><input type="submit" name="update" value="update" align="top"/></div> -->
									<p>If you want to delete some user information, please enter his username</p>
									<input type="text" name="username" placeholder="delete.."></input>
									</br><div id="deleteuser" class="none"><input type="submit" name="delete" value="Delete" align="top"/></div>
									
					</form:form>
					
</body>
</html>