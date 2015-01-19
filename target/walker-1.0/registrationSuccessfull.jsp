<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Registration Successful</title>
			
			<script type="text/javascript">
				function createText(id){
					//id.innerHTML = id.innerHTML + "<input type='text' value='' name='updatevalues'>"  + "update";
					createTextbox.innerHTML = createTextbox.innerHTML +"<br><input type='text' name='mytext' >"
					//will use JSTL <c tag here>
					
					//alert('Hi');
					}
			</script>
				
			<style type="text/css">
			
			body {
 				   background-color: lightblue;
			}
				#UserDetails{
					background: red;
					font-family: cursive;
				}
				#submitUpdatedValues{
					cursor:pointer;
					/* //background:#35b128 center; */
					
					
			}
			
			</style>
			
</head>
<body>
		<h2 align="center">User Details</h2>
		<table id="UserDetails" align="center" border="2">
		
		<!-- <div id="createTextbox" align="center"></div> -->
		
		<th>First Name</th>
		<th>Last Name</th>
		<th>Email ID</th>
		<th>Date OF Birth</th>
		<th>UserName</th>
		<th id="createTextbox"></th>
		<tr>
		
		<%
		  String fname = request.getParameter("fname");
		  String lname = request.getParameter("lname");
		  String email = request.getParameter("emailid");
		  String dob = request.getParameter("dob");
		  String uname = request.getParameter("uname");
		  List<String> list = new ArrayList<String>();
		  
		  list.add(fname);
		  list.add(lname);
		  list.add(email);
		  list.add(dob);
		  list.add(uname);
			for(int i=0;i<list.size();i++){
				
				%>	 
				<td> 
				<a href="#" onclick="createText(this)"><%out.print(
						  list.get(i)
						  );%>
				</a>  </td>
			<% }	%>
			</tr>
			</table>
			<p align="center" >
			Please click the URL to update the value
			</p>
			
				<p  id="submitUpdatedValues" align="center">
				<input type="submit" name="update" value="update"/>
				<input action="action" type="button" value="Back" onclick="history.go(-1);" />
				</p>
</body>
</html>