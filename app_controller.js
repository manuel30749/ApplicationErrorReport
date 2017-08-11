'use strict';

App.controller('AppController', ['$scope', '$http', function($scope, $http) {
	
	$scope.view = function(){
		$http.get("http://localhost:8080/ApplicationErrorReport/app_catalog/view.action")
	    	.then(function (response) {
	    		$scope.apps = response.data.data;	    		
	    	});
	}
	
	
	//$http.defaults.headers.post['Content-Type'] = 'application/json;'; 
	$scope.checkbox = {
		appStatus : true
	}
	 	
	$scope.submit = function(){	
		
		$http({
			method: 'POST',
			url: 'http://localhost:8080/ApplicationErrorReport/app_catalog/create.action',
			data: {				
				app: $scope.appName,
				status:  $scope.checkbox.appStatus ? 1 : 0
			},
			headers: {
				'Content-Type': 'application/json'
			}
		}).then(function(response){
			if(response)
				alert("in success");
			else
				alert("in fail");
		}, function(responseError){
			alert("Error status HTTP: " + responseError.status + "Data: " + responseError.data);
		});	
	};	
}]);

