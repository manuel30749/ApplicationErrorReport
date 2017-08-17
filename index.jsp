<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error Report App</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.8/sweetalert2.min.css" rel="stylesheet" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular-messages.js"></script>
</head>
<body ng-app="AppErrorReport">
<div ng-controller="AppController as ctrl">
	<form action="#" method="POST" ng-name="myForm" id="error_reportForm" name="error_reportForm" novalidate>	
		<div class="row">		
			<div class="col-md-4 col-md-offset-4" style="text-align: center;"><h2>Error Report Application</h2></div>		
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-4" style="text-align: center;">
				<nav class="navbar navbar-inverse">
	  				<div class="container-fluid">
	  					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	  						<ul class="nav navbar-nav">
	  							<li class="dropdown">
	          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Application<span class="caret"></span></a>
	          						<ul class="dropdown-menu">
								    	<li><a id="viewApps" href="" data-toggle="modal" data-target="#myModalAppView" ng-click="view()">View</a></li>	
									    <li><a id="addApp" href="" data-toggle="modal" data-target="#myModalAppAdd">Add</a></li>
										<li><a id="modifyApp" href="" data-toggle="modal" data-target="#myModalAppModify" ng-click="view()">Modify</a></li> 								        						       
								    </ul>
								</li>
								<li class="dropdown">
	          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Error<span class="caret"></span></a>
	          						<ul class="dropdown-menu">
	          							<li><a id="viewErrors" href="" data-toggle="modal" data-target="#myModalErrorView" ng-click="viewError()">View</a></li>
								    	<li><a id="addError" href="" data-toggle="modal" data-target="#myModalErrorAdd">Add</a></li>
								        <li><a id="modifyError" href="" data-toggle="modal" data-target="#myModalErrorModify" ng-click="viewError()">Modify</a></li>									        					       
								    </ul>
								</li>
	  						</ul>
	  					</div>
	  				</div>
				</nav>
			</div>
		</div>	
		
		<div id="myModalAppAdd" class="modal fade" role="dialog">
	  		<div class="modal-dialog">		   
				<div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"><span class="glyphicon glyphicon-plus"></span> Add Application</h4>
			      </div>
			      <div class="modal-body">		        
	  				<div class="form-group">
	  					<div class="row">
	  						<div class="col-xs-3">
		    					<label for="lblAppName">App Name:</label>
		    				</div>		    				
		    				<div class="col-xs-5">
		    					<input type="text" class="form-control" id="appName" ng-model="appName" placeholder="Ex: Microsoft Office Word" required>
		    				</div>		    			
		    				<div class="col-xs-4">
		    					<small id="appHelp" class="form-text text-muted">The application should exist in the system.</small>
		    				</div>
		    			</div>	
		    			<div class="row">
		    				<div class="col-xs-3">		
		    			    	<label for="lblAppStatus">App Status:</label>
		    			   	</div>		    			    
		    			    <label class="col-xs-5" style="font-weight: normal;">
      							<input type="checkbox" ng-model="checkbox.appStatus" ng-change="stateChange()" checked> {{ statusVal }}
   						    </label>
<!--	    				<input type="checkbox" class="form-control col-xs-2" ng-model="checkbox.appStatus" checked> Enable -->
<!-- 		    			<div ng-if="checkbox.appStatus">Enable</div> -->
<!-- 		    			<div ng-if="checkbox.appStatus != true">Disable</div> -->
		    				
		    				<div class="col-xs-4">		        				
		    					<small id="statusHelp" class="form-text text-muted">If set "Enable" the application will be monitored.</small>
	  						</div>
	  					</div>
	  				</div>  				
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="submit()">Save</button>
			      </div>
	    		</div>
	  		</div>
		</div>
		
		<div id="myModalErrorAdd" name="modalAddError" class="modal fade" role="dialog">
	  		<div class="modal-dialog">		   
				<div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title"><span class="glyphicon glyphicon-plus"></span> Add Error</h4>
			      </div>
			      <div class="modal-body">		        
	  				<div class="form-group" ng-class="{ 'has-error' : error_reportForm.errorDescription.$invalid && !error_reportForm.errorDescription.$pristine }">
	  					<div class="row">
	  						<div class="col-xs-3">
		    					<label for="lblErrorName">Error description:</label>
		    				</div>		    				
		    				<div class="col-xs-5">
		    					<input 
		    						type="text"
		    						name="errorDescription"
		    						class="form-control"
		    						id="errorName"
		    						ng-model="errorDescription"
		    						placeholder="Ex: Bad request" 
		    						ng-minlength="3"
        							ng-maxlength="50"
		    						required />		    					
		    					<div class="help-block" ng-messages="error_reportForm.errorDescription.$error" ng-if="error_reportForm.errorDescription.$touched" role="alert">
							        <p ng-message="minlength">Error description is too short.</p>
							        <p ng-message="maxlength">Error description is too long.</p>
							        <p ng-message="required">Error description is required.</p>
							    </div>
		    				</div>		    			
		    				<div class="col-xs-4">
		    					<small id="errorHelp" class="form-text text-muted">The error should be tiggered by aleast one application.</small>
		    				</div>
		    			</div>
	  				</div>  				
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="submitError()">Save</button>
			      </div>
	    		</div>
	  		</div>
		</div>
		
		<div id="myModalAppView" class="modal fade" role="dialog">
		  		<div class="modal-dialog">		   
					<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span> Applications</h4>
				      </div>
				      <div class="modal-body">		        
		  				<div class="form-group">
		    				<div class="row">		
								<div class="col-md-10 col-md-offset-1">
									<table class="table table-hover">
									  <thead>
									    <tr>
									      <th>#ID</th>									      
									      <th>Application name</th>
									      <th>Status</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr ng-if="flag">
									      <th scope="row">{{ app.idApp }}</th>
									      <td>{{ app.app }}</td>
									      <td ng-if="app.status" class="success">Enable</td>
									      <td ng-if="app.status != true" class="danger">Disable</td> 									      
									    </tr>
									    <tr ng-if="flag != true" ng-repeat="x in apps">
									      <th scope="row">{{ x.idApp }}</th>
									      <td>{{ x.app }}</td>
									      <td ng-if="x.status" class="success">Enable</td>
									      <td ng-if="x.status != true" class="danger">Disable</td> 									      
									    </tr>									 									    
									  </tbody>
									</table>												
								</div>		
							</div>
		  				</div>  				
				      </div>
				      <div class="modal-footer">
				      	<div class="row">				      						      	
							<div class="form-group form-inline" ng-class="{ 'has-error' : errorSearch }">
								<div class="col-md-4">
									<label for="lblsearch">Search App by ID:</label>
								</div>
								<div class="col-md-1">
							    	<input type="number" class="form-control" id="searchApp" name="searchidApp" ng-model="searchidApp" placeholder="App ID" ng-minlength="1" ng-maxlength="3" required />		
							    </div>
							    <div class="col-md-3 col-md-offset-2">
							    	<button type="button" href="" class="btn btn-default" ng-click="searchAppbyId()">Search</button>	
							    </div>						    
							</div>								
						</div>		        	
			      	  </div>
		    		</div>
		  		</div>
		</div>
		
		<div id="myModalErrorView" class="modal fade" role="dialog">
		  		<div class="modal-dialog">		   
					<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span> Errors</h4>
				      </div>
				      <div class="modal-body">		        
		  				<div class="form-group">
		    				<div class="row">		
								<div class="col-md-10 col-md-offset-1">
									<table class="table table-hover">
									  <thead>
									    <tr>
									      <th>#ID</th>									      
									      <th>Error description</th>									      
									    </tr>
									  </thead>
									  <tbody>
									    <tr ng-if="flagError">
									      <th scope="row">{{ error.idError }}</th>
									      <td>{{ error.description }}</td>									      									      
									    </tr>
									    <tr ng-if="flagError != true" ng-repeat="x in errors">
									      <th scope="row">{{ x.idError }}</th>
									      <td>{{ x.description  }}</td>									     									      
									    </tr>									 									    
									  </tbody>
									</table>												
								</div>		
							</div>
		  				</div>  				
				      </div>
				      <div class="modal-footer">
				      	<div class="row">				      						      	
							<div class="form-group form-inline">
								<div class="col-md-4">
									<label for="lblsearchError">Search Error by ID:</label>
								</div>
								<div class="col-md-1">
							    	<input type="number" class="form-control" id="searchError" ng-model="searchidError" placeholder="Error ID" ng-minlength="1" ng-maxlength="3" required>
							    </div>
							    <div class="col-md-3 col-md-offset-2">
							    	<button type="button" class="btn btn-default" ng-click="searchErrorbyId()">Search</button>	
							    </div>						    
							</div>								
						</div>		        	
			      	  </div>
		    		</div>
		  		</div>
		</div>
		
		<div id="myModalAppModify" class="modal fade" role="dialog">
		  		<div class="modal-dialog">		   
					<div class="modal-content">
					
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><span class="glyphicon glyphicon-wrench"></span> Modify Application</h4>
				      </div>
				      <div class="modal-body">		        
		  				<div class="form-group">
			  				<div class="row">
			  					<div class="col-xs-3">
			    					<label for="lblAppName" class="control-label">Application List:</label>
			    				</div>			    					    						       
						        <div class="col-xs-5 selectContainer">
						            <select class="form-control" name="appList" id="optsModify" ng-model="optsModify" ng-options="data as data.app for data in apps track by data.idApp">
						            	<option disabled selected value>Please Select</option>					                
						                <!-- <option ng-repeat="val in apps" value="{{ val.idApp }}">{{ val.app }}</option> -->					                
						            </select>
						        </div>
						    </div>
						    <br />
						    <div class="row">
						    	<div class="col-xs-3">
						        	<label>Data to change:</label>
						        </div>							
						    </div>
						    <div class="row">
						    	<div class="col-xs-9">
								  	<div class="input-group-btn">
										<input type="text" class="form-control" aria-label="..." id="appModify" style="float:left; border-radius: 4px 0px 0px 4px;" placeholder="Application name" value="{{ optsModify.app }}">
					      				<input type="hidden" id="idAppModify" value="{{ optsModify.idApp }}">
										<button type="button" class="btn btn-default dropdown-toggle" style="border-radius: 0px 4px 4px 0px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Change status <span class="caret"></span></button>
										<ul class="dropdown-menu dropdown-menu-right">
										   <li><a href="" ng-if="optsModify.status" ng-click="optsModify.status = false">Click to Disable</a><a href="" ng-if="optsModify.status != true" ng-click="optsModify.status = true">Click to Enable</a></li>					          				          
										</ul>
									</div>
								</div>							
							</div>			   		    				
		  				</div>  				
				      </div>			         	
				      
				      <div class="modal-footer">
					  	  <button type="button" class="btn btn-success" ng-click="update()">Done</button>
				      </div>				      
		    		</div>
		  		</div>
			</div>	

		
		<div class="row">		
			<div class="col-md-4 col-md-offset-4">
				<table class="table table-sm table-inverse">
				  <thead>
				    <tr>
				      <th>#</th>
				      <th>User Name</th>
				      <th>Application name</th>
				      <th>Error</th>
				      <th>Timestamp</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>mtapia</td>
				      <td>Mozilla FireFox</td>
				      <td>404 - Page Not Found.</td>
				      <td>05-15-2017/08:45</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>rcruz</td>
				      <td>Internet Explorer</td>
				      <td>405 - DNS fail.</td>
				      <td>05-15-2017/08:48</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>mtapia</td>
				      <td>Eclipse</td>
				      <td>0x00003 - JRM fail.</td>
				      <td>05-15-2017/08:49</td>
				    </tr>
				  </tbody>
				</table>		
			</div>		
		</div>
		<div class="row">		
			<div class="col-md-4 col-md-offset-4" style="text-align: center;">			
				<button type="button" class="btn btn-primary">Refresh</button>
			</div>		
		</div>		
	</form>
</div>

<script type="text/javascript" src="/ApplicationErrorReport/js/app.js"></script>
<script type="text/javascript" src="/ApplicationErrorReport/js/app_controller.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.6.8/sweetalert2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>