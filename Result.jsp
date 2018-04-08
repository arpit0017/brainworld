<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Result | Brain World</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="js/Profile.js"></script> -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">

<!-- <link rel="stylesheet" href="css/Profile.css"> -->
</head>
<body class="bg-black">
        	<%
        	
        	HttpSession sess=request.getSession(false);
        	String Username=sess.getAttribute("Username").toString();
        	String Role=sess.getAttribute("Role").toString();
//         	if(!Role.matches("admin"))
//         	{
//         		sess.invalidate();
//         		request.setAttribute("Error", 2);		//Invalid Access
//         		RequestDispatcher rd= request.getRequestDispatcher("Home.jsp");
//         		rd.forward(request, response);
//         	}
        %>
<%
	int Score=Integer.parseInt(request.getAttribute("Score").toString());
	String PassOrFail=request.getAttribute("PassOrFail").toString();
	
%>
<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 

<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand nav-active" href="Home.jsp" style="font-size:23px;" ><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-papyrus" id="myNavbar">
      
        <ul class="nav navbar-nav" style="letter-spacing:3px;font-size:15px;">
         <%
	        if(Role.matches("admin")){
		        out.println(""+
		         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
		         "<li><a href=\"Create.jsp\"><span class=\"text-DarkGreen text-bold\">CREATE</span></a></li>"+
// 		         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
		         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
		         "");
	        }
	        else
	        {
	        	out.println(""+
	       	         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
// 	       	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
	       	         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
	       	         "");
	        }
         %>
        </ul>
        <ul class="nav navbar-nav navbar-right font-fantasy text-bold" style="font-size:23px;">
        	<li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        	
        	<li class="dropdown">
        	<a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="text-DarkGreen text-bold">
        	<%
				out.println(Username);
			%>		
			</span>
			<span class="caret"></span>
			</a>
		<ul class="dropdown-menu dropdown-menu-create bg-DarkBlue">
          <li><a href="Profile.jsp"><span class="text-DarkGreen text-bold">Profile</span></a></li>
          <li><a href="Welcome.jsp"><span class="text-DarkGreen text-bold">Log Out</span></a></li>
        </ul>
        </li>
        </ul>
      </div>
    </div>
</nav>

<center>
<div class="bg-GrayShine BorderGreen font-ArialR container text-white" style="margin-top:20px;padding:10px;">
<h1 class="font-papyrus text-white text-center">Result</h1>
<hr>
<h2 class="pull-right">Total Score: &nbsp;<span class="text-danger"><%out.println(Score); %></span></h2>
<h2 class="pull-left">Grade: &nbsp;<span class="text-danger"><%out.println(PassOrFail); %></span></h2>
	
</div>
</center>

</body>
</html>