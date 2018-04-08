<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BrainWorld | Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/uikit.min.css">
<link rel="stylesheet" href="css/Create.css">

<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/uikit.min.js"></script>

<style>
.input-lg
{
	background-color:transparent;
	color:#0f0;
	text-shadow: 1px 1px #008000;
	border:none;
	border-bottom:2px Solid #fff;
}
</style>

<script>
	$(document).ready(function(){
		$("#username").focus();
	});
</script>
</head>
<body class="bg-black" style="height: 100vh !important;">
<!-- <div class="col-md-3"></div> -->
<div class="container col-md-4 col-md-offset-4 bg-GrayShine BorderGreen" style="margin-top:100px; padding: 30px;">
<h1 class="text-center text-white font-inconsolata" style="margin:0 auto; margin-bottom:20px;">Log in</h1>
<div class="container-fluid">
<form class="form-horizontal text-white" role="form" method="post" action="login">
	<div class="form-group">
		<div class="col-sm-12 has-feedback">
			<input type="text" class="form-control sentence" name="username" id="username" placeholder="Enter Username">
			<span class="glyphicon glyphicon-user form-control-feedback text-success"></span>
		</div>
	</div>

	<div class="form-group">
		<div class="col-sm-12 has-feedback">
			<input type="password" class="form-control sentence" name="password" id="password" placeholder="Enter Password">
			<span class="glyphicon glyphicon-lock form-control-feedback text-success"></span>
		</div>
	</div>
	<!-- <div class="form-group">        
		<div class="col-sm-offset-2 col-sm-10">
			<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div>
		</div>
	</div> -->
	<div class="form-group">        
      <div>
        <center>
			<button id="enter" type="submit" class="uk-button uk-button-primary uk-button-large enter">Submit</button>
        </center>
      </div>
    </div>
</form>
</div>
</div>
<div class="col-md-4"></div>
</body>
</html>