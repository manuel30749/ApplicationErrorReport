'use strict';

App.controller('AppController', ['$scope', '$http', function($scope, $http){
	
	$scope.checkbox = {
			appStatus : true
	};
	
	$scope.statusVal = "Enable";
	
	$scope.stateChange = function() {
		if($scope.checkbox.appStatus)	
			$scope.statusVal = "Enable";
		else
			$scope.statusVal = "Disable";
	};	
	
	$scope.view = function(){

		$http.get("http://localhost:8080/ApplicationErrorReport/app_catalog/view.action")
	    	.then(function (response) {
	    		$scope.flag = false;
	    		$scope.apps = response.data.data;	    		
	    	});
	};
	
	$scope.viewError = function(){

		$http.get("http://localhost:8080/ApplicationErrorReport/error_catalog/view.action")
	    	.then(function (response) {
	    		$scope.flagError = false;
	    		$scope.errors = response.data.data;	    		
	    	});
	};
	
	$scope.update = function(){
		
		swal({
			  title: 'Are you sure?',
			  text: "The application " + $('#appModify').val() + " will be modify." ,
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, update it!',
			  cancelButtonText: 'No, cancel!',
			  confirmButtonClass: 'btn btn-success',
			  cancelButtonClass: 'btn btn-danger',
			  buttonsStyling: false
			}).then(function () {
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
					if(response){						
					
						swal(
							    'Update!',
							    'The application has changed.',
							    'success'
							);
						$('#error_reportForm')[0].reset();
						$('#myModalAppModify').modal('hide');
					}
					else
						alert("in fail");						
				}, function (responseError){
					alert(responseError.status + " " + responseError.data);
				});
				
			}, function (dismiss) {
			  // dismiss can be 'cancel', 'overlay',
			  // 'close', and 'timer'
			  if (dismiss === 'cancel') {
			    swal(
			      'Cancelled',
			      'The operation has been canceled.',
			      'error'
			    );
			  }
		});		
	};
	
	$scope.submit = function() {
		
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
			if(response){
				swal(
						'Successful!',
						'The ' + $scope.appName + ' app has been added.',
						'success'
				);
				$('#error_reportForm')[0].reset();
			}
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
	
	$scope.submitError = function(){
		
		$http({
			
			method: 'POST',
			url: 'http://localhost:8080/ApplicationErrorReport/error_catalog/create.action',
			data: {
				description: $scope.errorDescription
			},
			headers: {
				'Content-type' : 'application/json'
			}			
		}).then(function(response){
			
			if(response){
				swal(
						'Successful!',
						'The ' + $scope.errorDescription + ' error has been added.',
						'success'
				);
				$('#error_reportForm')[0].reset();
			}
			else
				swal(
						'Fail!',
						'Something has failed trying to save the ' + $scope.errorDescription + ' error.',
						'error'					
				);	
		},function (responseError){
			alert(responseError.status + " " + responseError.data);
		});	
		
	};
	
	$scope.searchAppbyId = function() {
		if($('#search').val() == "")
			swal(
					'Error',
				    'Please inserte a value.',
				    'error'
			);
		else{
			
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
					$('#error_reportForm')[0].reset();
				}				
				else{					
				
					swal(
							'Error',
						    'The app with ID: ' + $scope.searchidApp + ' does not exists in the data base.',
						    'error'
					);
					$('#error_reportForm')[0].reset();
				}
	//			if(response)
	//				alert("in success");
	//			else
	//				alert("in fail");						
			}, function (responseError){
				alert(responseError.status + " " + responseError.data);
			});
		}
	};
}]);