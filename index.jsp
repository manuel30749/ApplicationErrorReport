<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error Report App</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
</head>
<body ng-app="AppErrorReport">
	<div ng-controller="AppController as ctrl">
		<form name="myForm">
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
									    	<li><a id="addApp" href="#" data-toggle="modal" data-target="#myModalAppAdd">Add</a></li>
									        <li><a id="modifyApp" href="" data-toggle="modal" data-target="#myModalAppModify" ng-click="view()">Modify</a></li>						       
									    </ul>
									</li>
									<li class="dropdown">
		          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Error<span class="caret"></span></a>
		          						<ul class="dropdown-menu">
									    	<li><a id="addError" href="#" data-toggle="modal" data-target="#myModalError">Add</a></li>
									        <li><a id="modifyError" href="#">Modify</a></li>							       
									    </ul>
									</li>
		  						</ul>
		  					</div>
		  				</div>
					</nav>
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
								<div class="col-md-8 col-md-offset-2">
									<table class="table table-sm table-inverse">
									  <thead>
									    <tr>
									      <th>#ID</th>									      
									      <th>Application Name</th>
									      <th>Status</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr ng-repeat="x in apps">
									      <th scope="row">{{ x.idApp }}</th>
									      <td>{{ x.app }}</td>
									      <td>{{ x.status }}</td>									      
									    </tr>									    
									  </tbody>
									</table>		
								</div>		
							</div>
		  				</div>  				
				      </div>
		    		</div>
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
		    				<label for="lblAppName">Application name:</label>
		    				<input type="text" class="form-control" id="app" ng-model="appName" placeholder="Application Name">
		    				<small id="appHelp" class="form-text text-muted">The application should exist in the system.</small>
		    				<br/>
		    				<label for="lblAppStatus">Application status:</label>
		    				<br />
		    				<input type="checkbox" ng-model="checkbox.appStatus" checked> <div ng-if="checkbox.appStatus">Able</div> <div ng-if="checkbox.appStatus != true">Disable</div>
		    				<br />
		    				<small id="statusHelp" class="form-text text-muted">If the application is set like " Able " it gonna be monitored. {{ checkbox.appStatus }}</small>
		  				</div>  				
				      </div>
				      <div class="modal-footer">
					  	  <button class="btn btn-success" ng-click="submit()">Save</button>
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
		    				<label for="lblAppName" class="col-md-4 control-label">Application List:</label>				       
					        <div class="col-md-4 selectContainer">
					            <select class="form-control" name="appList">					                
					                <option ng-repeat="x in apps" value="{{ x.idApp }}">{{ x.app }}</option>
					            </select>
					        </div> 		    				
		  				</div>  				
				      </div>
				      
				      <div class="modal-body">				      
				      	<div class="input-group">
      					  <input type="text" class="form-control" aria-label="...">
					      <div class="input-group-btn">
					        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action <span class="caret"></span></button>
					        <ul class="dropdown-menu dropdown-menu-right">
					          <li><a href="#">Action</a></li>
					          <li><a href="#">Another action</a></li>					          
					          <li role="separator" class="divider"></li>
					          <li><a href="#">Delete from DB</a></li>
					        </ul>
					      </div>
					    </div>
  					  </div>     	
				      
				      <div class="modal-footer">
					  	  <button class="btn btn-success" ng-click="modify()">Done</button>
				      </div>
				      
		    		</div>
		  		</div>
			</div>
			
			<div id="myModalError" class="modal fade" role="dialog">
		  		<div class="modal-dialog">		   
					<div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title"><span class="glyphicon glyphicon-plus"></span> Add Error</h4>
				      </div>
				      <div class="modal-body">		        
		  				<div class="form-group">
		    				<label for="exampleInputEmail1">Error description:</label>
		    				<input type="text" class="form-control" id="errorDescription"  placeholder="Error description">
		    				<small id="errorHelp" class="form-text text-muted">The ID error will be auto-generated.</small>
		  				</div>  				
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
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
					      <th>Application Name</th>
					      <th>Error</th>
					    </tr>
					  </thead>
					  <tbody>
					    <tr>
					      <th scope="row">1</th>
					      <td>mtapia</td>
					      <td>Mozilla FireFox</td>
					      <td>404 - Page Not Found.</td>
					    </tr>
					    <tr>
					      <th scope="row">2</th>
					      <td>rcruz</td>
					      <td>Internet Explorer</td>
					      <td>405 - DNS fail.</td>
					    </tr>
					    <tr>
					      <th scope="row">3</th>
					      <td>mtapia</td>
					      <td>Eclipse</td>
					      <td>0x00003 - JRM fail.</td>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript" src="/ApplicationErrorReport/js/app.js"></script>  	
    <script type="text/javascript" src="/ApplicationErrorReport/js/app_controller.js"></script>
</body>
</html>