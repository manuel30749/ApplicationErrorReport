'use strict';

App.controller('AppController', ['$scope', '$http', function($scope, $http){
	
	$scope.checkbox = {
			appStatus : true
	};
	
//	$scope.stateChange = function() {
//		if($scope.checkbox.appStatus)	
//			$scope.statusVal = "Enable";
//		else
//			$scope.statusVal = "Disable";
//	};
	
	$scope.view = function(){
		$http.get("http://localhost:8080/ApplicationErrorReport/app_catalog/view.action")
	    	.then(function (response) {
	    		$scope.flag = false;
	    		$scope.apps = response.data.data;	    		
	    	});
	};
	
	$scope.update = function(){
		
		$http({
			method: 'POST',
			url: 'http://localhost:8080/ApplicationErrorReport/app_catalog/create.action',
			data: {
				idApp: $('#idAppModify').val(),
				app: $('#appModify').val(),
				status: $scope.optsModify.status ? 1 : 0
			},
			headers: {
				'Content-Type': 'application/json'
			}
		}).then(function(response) {			
			if(response)
				alert("in success");
			else
				alert("in fail");						
		}, function (responseError){
			alert(responseError.status + " " + responseError.data);
		});
		
	};
	
	$scope.submit = function() {				
		
		if($scope)
		
		$http({
			method: 'POST',
			url: 'http://localhost:8080/ApplicationErrorReport/app_catalog/create.action',
			data: {				
				app: $scope.appName,
				status: $scope.checkbox.appStatus ? 1 : 0
			},
			headers: {
				'Content-Type': 'application/json'
			}
		}).then(function(response) {			
			if(response)
				swal(
						'Successful!',
						'The ' + $scope.appName + ' app has been added.',
						'success'
				);
			else
				swal(
						'Fail!',
						'Something has failed trying to save the ' + $scope.appName + ' app.',
						'error'
					
				);						
		}, function (responseError){
			alert(responseError.status + " " + responseError.data);
		});
	};
	
	$scope.searchAppbyId = function() {
		
		$http({
			
			method: 'GET',
			url: 'http://localhost:8080/ApplicationErrorReport/app_catalog/searchApp.action',
			params: {
				idApp: $scope.searchidApp
			}				
		}).then(function(response) {
			
			if(response.data.data !== null) {
				$scope.flag = true;
				$scope.app = response.data.data;
			}				
			else
				alert("The app with ID: " + $scope.searchidApp + " does not exists in the data base.");
			
			if(response)
				alert("in success");
			else
				alert("in fail");						
		}, function (responseError){
			alert(responseError.status + " " + responseError.data);
		});
	};
}]);