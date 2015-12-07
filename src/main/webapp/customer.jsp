<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body >
			
			<div class = "panel-control" id = "customer">
			
			<form:form  commandName="customerForm">
				
				<div class="panel-body" align = "center">
						
					<div class="input-group">
            		<label>
           					Login ID* 
            		</label>
            		<input type="text" name = "EmailID" value="" class="form-control" data-validate = "require"/>
            		<!-- <span class="input-group-addon" id="basic-addon2">@example.com</span> -->
            		</div>
            	
            		</br>
            		
            		<div class="input-group">
            		<label>
           					Password*
            		</label>
            		<input type="password" name = "password" value="" class="form-control" data-validate = "require"/>
            	</div>
            	
            	</br>
            	
            	
            		
            	
            	<div class="btn-group" data-toggle="buttons">
            	
                <label class="btn btn-primary">
                	
                    <input type="radio"  name="" value="customer" /> Customer
                </label> 
                
                
                <label class="btn btn-primary">
                	
                    <input type="radio" name="" value="employees" /> Employees
                </label> 
                
            	</div>
            	
            	
            	
            	
            	</br>
            	</br>
            	<div class="input-group" align="center">
                	<input type="submit" name = "save" value = "Login" class="btn btn-lg btn-success"/>
                </div>
            
            </div>
            	
			</form:form>
			
			
			</div>
			
</body>
</html>