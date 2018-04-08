<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Profile</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tooltipster.bundle.min.js"></script>
<script src="js/Profile.js"></script>
<script src="js/iconate.min.js"></script>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">
<link rel="stylesheet" href="css/Profile.css">
<link rel="stylesheet" type="text/css" href="css/tooltipster.bundle.min.css" />
<link rel="stylesheet" type="text/css" href="css/tooltipster-sideTip-punk.min.css" />
<link rel="stylesheet" href="css/iconate.min.css">


<style>
.save-icon
{
	font-size:30px;
	color:rgba(232,136,67,1);
	cursor:pointer;
	float:right;
	margin-top:5px;
}
</style>

</head>

<body class="bg-black" style="overflow:hidden;">
<%@ page import="java.sql.*"%>

<%
	
	String Username=new String();
	String Role=new String();
	HttpSession sess=request.getSession(false);
	Username=sess.getAttribute("Username").toString();
	Role=sess.getAttribute("Role").toString();

	
	//System.out.println(Username);
	
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	String Query=new String();
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Db=DriverManager.getConnection("jdbc:mysql://localhost/brainworld","root","p@t@n@hi");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception 101:\t"+error);
	}
	catch(ClassNotFoundException error)
	{
		System.out.println("Class Not Found Error 101:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception 101:\t"+error);
	}
	
	try
	{
		Query="select * from users where username = BINARY ?";
		St=Db.prepareStatement(Query);
		St.setString(1, Username);
		Results=St.executeQuery();
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 102 :\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 102:\t"+error);
	}
	String Fname=null;String Lname=null;String Email=null;String Password=null;String Phone=new String();
	try
	{
		if(Results.next())
		{
				Fname=Results.getString("fname");
				Lname=Results.getString("lname");
				Email=Results.getString("email");
				Phone=Results.getString("phone");
				if(Phone==null)
				{
					Phone="0";
				}
				
		}
		else
		{
			System.out.println("Impossible!:No Data Found!Check Code Again!");
		}
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 103:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 103:\t"+error);
	}
	
%>

<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div>
<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Home.jsp" style="font-size:23px;" ><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-times" id="myNavbar">
      
        <ul class="nav navbar-nav" style="letter-spacing:3px;font-size:18px;">
        <%
	        if(Role.matches("admin")){
		        out.println(""+
		         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
		         "<li><a href=\"Create.jsp\"><span class=\"text-DarkGreen text-bold\">CREATE</span></a></li>"+
// 		         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
		         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
		         "");
	        }
	        else
	        {
	        	out.println(""+
	       	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
// 	       	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
	       	         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
	       	         "");
	        }
         %>
        </ul>
        <ul class="nav navbar-nav navbar-right font-times text-bold" style="font-size:23px;">
        	<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        	
        	<li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="text-DarkGreen text-bold">
        	<%        	
	        	if(Role.matches("admin"))
	    		{
	    			out.println("<span class=\"my-tooltip glyphicon glyphicon-ok-circle role-specifier\" title=\"Admin,Best Wishes!\" style=\"font-size:15px;\"></span>");
	    		}
				out.println(Username);
			%>
			</span>
			<span class="caret"></span>
			</a>
		<ul class="dropdown-menu dropdown-menu-create bg-DarkBlue">
<!--           <li><a href="#"><span class="text-DarkGreen text-bold">Settings</span></a></li> -->
          <li><a href="Profile.jsp"><span class="text-DarkGreen text-bold">Profile</span></a></li>
          <li><a href="Welcome.jsp"><span class="text-DarkGreen text-bold">Log Out</span></a></li>
        </ul>
        </li>
        </ul>
      </div>
    </div>
</nav>
 
<div class="container bg-GrayShine" style="margin-top:20px;height:72vh;width:90vw;overflow-y:scroll;overflow-x:hidden;">
	<ul class="nav nav-tabs profile-tabs font-times" style="margin-top:20px;">
		<li class="active" style="background:transparent"><a href="#personal-info" class="text-bold font-times" style="color:#0f0;" data-toggle="tab">Personal Info</a></li>
		<li class=""><a href="#account-info" class="text-bold font-times" style="color:#0f0;" data-toggle="tab">Account Info</a></li> 
	</ul>
	<div class="tab-content">
		<div id="personal-info" class="tab-pane fade in active">
			<form name="profile-mod" method="post" id="profile-mod" action="ProfileMod">
			
			<div class="container-fluid col-md-12">
			<div class="col-md-8">
			<h2 class="text-white text-center font-lucida" style="margin:20px;">Personal Information</h2>
			</div>
			<div class="col-md-4" style="margin-top:5px;">
				<span class="glyphicon glyphicon-floppy-save save-icon"></span>
			</div>
			
			</div>
			<%out.println("<input type=\"hidden\" name=\"Username\" value=\""+Username+"\">");%>
			<table class="table table-bordered font-papyrus profile-table bg-GrayShine">
<!-- 				<tr> -->
<!-- 					<th class="text-center">Property</th> -->
<!-- 					<th class="text-center">Value</th> -->
<!-- 				</tr> -->
				<tr>
					<td>First Name:</td>
					<td><%out.println("<input type=\"text\" name=\"Fname\" class=\"bg-NoColor noBorder\" value=\""+Fname+"\">");%></td>
				</tr>
				<tr>
					<td>Last Name:</td>
					<td><%out.println("<input type=\"text\" name=\"Lname\" class=\"bg-NoColor noBorder\" value=\""+Lname+"\">");%></td>
				</tr>
				<tr>
					<td>Email id:</td>
					<td><%out.println("<input type=\"text\" name=\"Email\" class=\"bg-NoColor noBorder\" value=\""+Email+"\">");%></td>
				</tr>
				<tr>
					<td>Phone:</td>
					<td><%out.println("<input type=\"text\" name=\"Phone\" class=\"bg-NoColor noBorder\" value=\""+Phone+"\">");%></td>
				</tr>
				<tr>
					<td>Country:</td>
					<td></td>
				</tr>
				<tr>
					<td>Domains:</td>
					<td>
					<div class="loadDomains">
<!-- 					AJAX -->

					</div>
					</td>
				</tr>
			</table>
			
			</form>
		</div>
		<div id="account-info" class="tab-pane fade">
			<div class="container-fluid col-md-12">
			<div class="col-md-8">
			<h2 class="text-white text-center font-lucida" style="margin:20px;">Account Information</h2>
			</div>
			<div class="col-md-4" style="margin-top:5px;">
				<span class="glyphicon glyphicon-floppy-save save-icon"></span>
			</div>
			
			</div>
			<table class="table table-reponsive table-bordered font-times profile-table">
				<tr>
					<th class="text-center">Property</th>
					<th class="text-center">Value</th>
				</tr>
				<tr>
					<td>Username:</td>
					<td><%out.println(Username); %></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><button class="bg-black" data-toggle="collapse" data-target="#change-password">Change Password</button>
					<div class="collapse" id="change-password">Coming Soon! :P</div>
					
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>

</body>
</html>