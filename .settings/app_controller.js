'use strict';

angular.module('AppErrorReport').controller('AppController', ['$scope', 'AppService', function($scope, AppService){
	
	var self = this;
	self.app={idApp:null, app:'', status:true};
	
	self.submit = submit;
	
	function createApp(app){
		AppService.createApp(app)
		.then(
				
			function(errResponse){
				
				console.error('Error while creating App.');
			}
		);
	}
	function submit() {
	     if(self.app.idApp===null){
	         console.log('Saving New App', self.app);
	         createApp(self.app);
	     }
	     reset();
	}
	
	function reset(){
        self.app={idApp:null,app:'',status:false};
        $scope.myForm.$setPristine(); //reset Form
    }
	
}]);