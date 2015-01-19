<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Welcome ${username}</title>



<style>
    body { font-size: 80.5%; }
    label, input { display:block; }
    input.text { margin-bottom:12px; width:10%; padding: .4em; }
    fieldset { padding:0; border:0; margin-top:25px;  }
    h1 { font-size: 1.8em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .4em 8px; text-align: center; }
    .ui-dialog .ui-state-error { padding: .3em; }
    .validateTips { border: 1px solid transparent; padding: 0.1em; }
  </style>

</head>
<body>
<div id="dialog-form" title="Create new user">
  <p class="validateTips">All form fields are required.</p>
<form>
    <fieldset>
		      <label for="height">height</label>
		      <input type="text" name="height" id="height" value="" class="text ui-widget-content ui-corner-all">
		      <label for="Weight">Weight</label>
		      <input type="text" name="weight" id="weight" value="" class="text ui-widget-content ui-corner-all">
		      <label for="age">Age</label>
		      <input type="text" name="age" id="age" value="" class="text ui-widget-content ui-corner-all">
		      <!-- Allow form submission with keyboard without duplicating the dialog button -->
		      <input type="submit" tabindex="-1" style="position:absolute;">
		      
		      <div id="piechart" style="width: 900px; height: 500px;"></div>
		      
    </fieldset>
</form>
</div>
</body>
</html>