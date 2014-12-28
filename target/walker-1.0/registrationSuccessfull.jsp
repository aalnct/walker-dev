<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Registration Successful</title>
</head>
<body>
		<h5>User Details</h5>
		<%String fname = request.getParameter("fname");
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
				  out.print(list.get(i));
			}	%>
</body>
</html>