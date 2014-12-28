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
<title>Admin User Search Parameters</title>

<style>
	body{
		background: lightblue;
	}
	
	
</style>

</head>
<body>

	<form:form action="/walker/userinformation" method="post" commandName="User">
	
	
	
		<c:out value="${message}">
			
		</c:out>
	
	
			<c:out value="${username}"></c:out>
			<p>Please Enter the Username or lastname or emailid to retrieve user information</p>
				<table align="left" border="1" cellspacing="2" summary="userSearch">
			<tr>
			
				<td>Search by</td>
				<th>UserName:<input type="text" name="username"/></th>
				<td>or search by</td>
				<th>lastname:<input type="text" name="lastname"/></th>
				<td>or search by</td>
				<th>email id:<input type="text" name="emailid"/></th>
				
			</tr>
				
				<tr>
					<td align="center"><input type="submit" value="Submit"></input></td>
				</tr>
		</table>
			
	</form:form>
			
</body>
</html>