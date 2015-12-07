<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"></link>
<link href="/walker/styles/walker_style.css" rel="stylesheet"
	type="text/css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

<div class = "panel-control" id = "login_admin">
	<div class="container">
		
		<form action="/walker/adminLogin" class="form-signin" commandName = "admin"  method="post" novalidate>
			<table align = "center">
			<tr>
				<td>
					<h2 class="form-signin-heading">Please sign in</h2>
					
					<label for="inputEmail" class="sr-only">Email address</label> 
					<input type="email" id="inputEmail" class="form-control" placeholder="Email address" name = "emailID" 
						required autofocus style="width:250px;">
					
					<br/>
					
					<label for="inputPassword" class="sr-only">Password</label> 
					<input type="password" id="inputPassword" class="form-control" placeholder="Password" name = "password" 
					required autofocus style="width:250px;">
					
					<div class="checkbox">
						
						<label> <input type="checkbox" value="remember-me">
								Remember me
						</label>
					
					</div>
					
					
					<button class="btn btn-primary" type="submit" style = "position: relative; padding-left: 10px;">Sign in</button>
					</td>
			</tr>
		</table>
		</form>

	</div>
</div>

</body>
</html>