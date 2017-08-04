'use strict';

angular.module('AppErrorReport').factory('AppService', ['$http', '$q', function($http, $q) {
	
	var REST_SERVICE_URI = 'http://localhost:8080/ApplicationErrorReport/app_catalog/create.action';
	
	var factory = {
			createApp: createApp
	};
	
	return factory;
	
	function createApp(app){
		var deferred = $q.defer();
		$http.post(REST_SERVICE_URI, app)
		.then(
			function (response) {
				deferred.resolve(response.data);
			},
			function (errResponse) {
				console.error('Error while creating the App.');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
}]);