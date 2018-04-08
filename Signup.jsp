<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Signup</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">
<link rel="stylesheet" href="css/Signup.css">
<link rel="stylesheet" href="css/animate.css">

<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/Signup.js"></script>
<script>

</script>

<style>
.input-lg
{
	background-color:transparent;
	color:#0f0;
	text-shadow: 1px 1px #008000;
	border:none;
	border-bottom:2px Solid #fff;
}
.input-lg :active
{
	all:none;
}
</style>
</head>
<body class="bg-black">
<div class="col-md-4"></div>
<div class="container col-md-4 bg-GrayShine BorderGreen" style="margin-top:50px;">
<h1 class="text-center text-white font-arielBlack" style="margin:0 auto; margin-bottom:20px;">Sign up</h1>
<div class="container-fluid">
<form class="form-horizontal text-white" role="form" method="post" action="Signup">
	<div class="form-group">
	<input type="text" class="form-control input-lg" name="fname" id="fname" placeholder="Enter First Name">
	</div>
	<div class="form-group">
	<input type="text" class="form-control input-lg" name="lname" id="lname" placeholder="Enter Last Name">
	</div>
	<div class="form-group">
		<div class="has-feedback">
			<input type="text" class="form-control input-lg" name="email" id="email" placeholder="Enter Email">
			<span class="glyphicon glyphicon-envelope form-control-feedback text-success"></span>
		</div>
	</div>
	<div class="form-group">
		<div class="has-feedback">
			<input type="text" class="form-control input-lg" name="username" id="username" placeholder="User Name">
			<span class="glyphicon glyphicon-user form-control-feedback text-success"></span>
		</div>
	</div>
	<div class="form-group">
		
		<div class="has-feedback">
			<input type="password" class="form-control input-lg" name="password" id="password" placeholder="Enter Password">
			<span class="glyphicon glyphicon-lock form-control-feedback text-success"></span>
		</div>
	</div>
	<div class="form-group">        
		<div class="col-sm-offset-2 col-sm-10">
			<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div>
		</div>
	</div>
	<div class="form-group">        
    
    </div>
</form>
<div >
        <center><button id="SubmitButton" type="submit" class="btn btn-success btn-lg" style="margin:0 auto;">Submit</button></center>
</div>
</div>
</div>
<div class="col-md-4"></div>
</body>
</html>