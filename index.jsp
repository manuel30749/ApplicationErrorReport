<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error Report App</title>
<link href="/ApplicationErrorReport/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/ApplicationErrorReport/js/jquery-3.2.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<form action="#">
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
							    	<li><a id="addApp" href="#" data-toggle="modal" data-target="#addError">Add</a></li>
							        <li><a id="modifyApp" href="#">Modify</a></li>						       
							    </ul>
							</li>
							<li class="dropdown">
          						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Error<span class="caret"></span></a>
          						<ul class="dropdown-menu">
							    	<li><a id="addError" href="#" data-toggle="modal" data-target="#myModal">Add</a></li>
							        <li><a id="modifyError" href="#">Modify</a></li>							       
							    </ul>
							</li>
  						</ul>
  					</div>
  				</div>
			</nav>
		</div>
	</div>	
	
	<div id="myModal" class="modal fade" role="dialog">
  		<div class="modal-dialog">		   
			<div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title"><span class="glyphicon glyphicon-plus"></span> Add Application</h4>
		      </div>
		      <div class="modal-body">		        
  				<div class="form-group">
    				<label for="exampleInputEmail1">Application name:</label>
    				<input type="text" class="form-control" id="appName"  placeholder="Application Name">
    				<small id="appHelp" class="form-text text-muted">The application should exist in the system.</small>
  				</div>  				
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
		      </div>
    		</div>
  		</div>
	</div>
	
	<div id="addError" class="modal fade" role="dialog">
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

<script type="text/javascript" src="/ApplicationErrorReport/js/app.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/ApplicationErrorReport/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>