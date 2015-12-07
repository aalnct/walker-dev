//var FormModule = angular.module("Employee_Details",[]);
//FormModule.controller("processController",function($scope){
//	
//	$scope.users = [];
//	
//	$scope.save = function(user){
//		console.log(user.firstname);
//	}
//	
//	$scope.cancel = function(user){
//		
//		$scope.user = '';
//	}
//	
//	
//	$scope.submit = function(user){
//		console.log(user.firstname);
//	}
//	
//	
//});


//Submit button form validation script for Employee details form
var Validation = angular.module('formValidationApp',[]);
Validation.controller('processController',function($scope){
	
	$scope.submit = function(){
		//alert('Form Submitted');
		//console.log($scope.user);
	}
	
	$scope.cancel = function(){
		alert('test');
		
	}
	
});
