<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home-BrainWorld</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/tooltipster.bundle.min.js"></script>
<script src="js/typed.js"></script>
<script type="text/javascript" src="js/uikit.min.js"></script>

<script src="js/Home.js"></script>

<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/Create.css">
<link rel="stylesheet" type="text/css" href="css/tooltipster.bundle.min.css" />
<link rel="stylesheet" type="text/css" href="css/tooltipster-sideTip-punk.min.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/uikit.min.css" /> -->


<style>
.panel
{
	margin-top:25px;
	margin-bottom:35px;
	width:60vw;
	border: 1px Solid #008000;
}
.panel-gray
{
/* 	box-shadow:0px 0px 5px 5px #a0a0a0; */
}
.panel-gray .panel-heading
{
	background-color:#000;
}
.panel-title
{
	font-size:25px;
	color:#0f0;
}
.panel-gray .panel-footer
{
	border:none;
	background-color:#fff;
}

@media only screen and(max-device-width: 480px)
{
	.panel
	{
		width:80vw;
	}
}
.typed-cursor{
    opacity: 1;
    -webkit-animation: blink 0.7s infinite;
    -moz-animation: blink 0.7s infinite;
    animation: blink 0.7s infinite;
}
.inner-scroll
{
	overflow:scroll;
}
@keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
@-webkit-keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
@-moz-keyframes blink{
    0% { opacity:1; }
    50% { opacity:0; }
    100% { opacity:1; }
}
</style>
</head>
<body class="bg-black" style="overflow:hidden;transition:all 0.5s;">
<%
				Object value=request.getAttribute("Username");
        		String Role=null;
        		
        		try{
        			Role=request.getAttribute("Role").toString();
        		
        		}catch(Exception error)
        		{
        			HttpSession sess=request.getSession();
        			Role=sess.getAttribute("Role").toString();
        			System.out.println(Role);
        		}
        		String Username=null;
				if(value!=null)
				{
// 					out.println(value);
					Username=value.toString();
					HttpSession sess=request.getSession();
					sess.setAttribute("Username", Username);
					sess.setAttribute("Role",Role);
				}
				else
				{
					
					HttpSession sess=request.getSession(false);
					Username=sess.getAttribute("Username").toString();
// 					Role=sess.getAttribute("Role").toString();
// 					out.println(Username);
				}
// 			out.println("<script>$(document).ready(function(){alert(\""+Role+"\")});</script>");
%>
<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px;	animation-name:Rotator;
	animation-duration:50s;"></center></div> 
<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Home.jsp" style="font-size:23px; color:#fff;" ><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-times" id="myNavbar">
        <ul class="nav navbar-nav" style="letter-spacing:3px;font-size:18px;">
        <%
        if(Role.matches("admin")){
	        out.println(""+
	         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
	         "<li><a href=\"Create.jsp\"><span class=\"text-DarkGreen text-bold\">CREATE</span></a></li>"+
// 	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
	         "<li><a href=\"Leaderboard.jsp\"><span class=\"text-DarkGreen text-bold\">LEADERBOARD</span></a></li>"+
	         "");
        }
        else
        {
        	out.println(""+
       	         "<li><a href=\"Practice.jsp\"><span class=\"text-DarkGreen text-bold\">PRACTICE</span></a> </li>"+
//        	         "<li><a href=\"#\"><span class=\"text-DarkGreen text-bold\">ACHIEVEMENTS</span></a></li>"+
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
		<ul class="dropdown-menu dropdown-menu-create bg-DarkBlue" style="border-radius:5%;">
          <li><a href="Profile.jsp"><span class="text-DarkGreen text-bold">Profile</span></a></li>
          <li><a href="Welcome.jsp"><span class="text-DarkGreen text-bold">Exit</span></a></li>
        </ul>
        </li>
        </ul>
      </div>
    </div>
</nav>
<div class="fitScreen col-md-12">


<!-- <div class="bg-GrayShine col-md-2 center-block BorderGreen" id="CareToRead" style=""> -->
<!-- 	<div class="VisibleAfterSomeTime" style="display:none;"> -->
<!-- 		<h1 class="text-center text-white font-comic font-bold"><u>Care to read?</u></h1> -->
<!-- 		<ul type="square" class="text-white font-papyrus" style="font-size:20px;"> -->
<!-- 			<li>Brain World provides you the best online environment to take up Computer based exams.</li> -->
<!-- 			<li>We offer you more than a 100 subjects to get a degree in.</li> -->
<!-- 			<li>Our certificates are accepted world wide.</li> -->
<!-- 		</ul>	 -->
<!-- 	</div> -->
<!-- </div>  -->


<div class="col-md-12" id="YourDomains" style="padding:0px;">
 <div class="center-block scrollbar-macosx" id ="inner-scroll"
 		 style="position:absolute;left:0px;padding:20px;
 		 		background-color:#000;height:80vh;width:99vw;overflow:scroll">
 <center><span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;">Your Domains</span></center>

<%@ page import="java.sql.*"%>
<%
	
	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	
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
	String query=new String(),Test_Name=new String(),Test_Desc=new String(), Sub_Desc=new String();
	int Test_Id=0;
	try
	{
		query="select count(*) from usr_sub us, users u where us.user_id=u.user_id and u.username=?";
		St=Db.prepareStatement(query);
		St.setString(1, Username);
		Results=St.executeQuery();
		Results.next();
		int GetCount=Results.getInt(1);
		if(GetCount==0)
		{
			
			out.println("<div class=\"container-fluid text-lg text-center text-danger font-times text-bold\">Add Subjects to your profile and see the tests available for you here!</div>");
			out.println("<div class=\"container-fluid\"><center><a href=\"Profile.jsp\"><button class=\"btn-danger btn-lg font-times text-bold\" style=\"margin:0 Auto;\">Add Subjects</button></a></center></div>");
		}
		else
		{
			out.println("<center><div style=\"font-size:20px;color:rgba(0,255,0,0.7);\"><span id=\"lets-see\" class=\"font-arial text-center proper-letters\"" +
						"></span><span class=\"typed-cursor\"></span></div></center>");
			out.println("<div class=\"container\">"+
				    		"<form name=\"GoForm\" action=\"RegisterForExam.jsp\">"+
				 	"<input type=\"hidden\" id=\"GoValue\" name=\"GoValue\" value=\"0\">");
		query="select test_id,test_name, test_desc, sub_desc from users u, usr_sub us,tests t,subjects s where us.user_id=u.user_id and t.subject_id = us.subject_id and us.subject_id=s.subject_id and u.username=?";
		St=Db.prepareStatement(query);
		St.setString(1, Username);
		Results=St.executeQuery();
		int i=0;
		while(Results.next())
		{
			Test_Name=Results.getString("test_name");
			Test_Desc=Results.getString("test_desc");
			Sub_Desc=Results.getString("sub_desc");
			Test_Id=Results.getInt("test_id");
			
			out.println("<div class=\"panel panel-gray center-block\"> <div class=\"panel-heading \"><span class=\"panel-title font-times text-bold letter-readable\">"+
						""+Test_Name+
						"</span></div><div class=\"panel-body\">"+Test_Desc+
						"</div><div class=\"panel-footer\"><div class=\"row\">"+
						"<span class=\"col-md-4 col-xs-12 font-times letter-readable\" style=\"font-size:17px;\">"+
						"<strong>Domain:</strong><i>"+Sub_Desc+
						"</i></span><span class=\"col-md-8\" style=\"float:right;\">"+
								"<button class=\"btn-success btn-lg Go\" data-id=\""+Test_Id+
								"\" style=\"float:right;\">Go!</button></span></div></div></div>");
			
		    i++;
			//System.out.println("\nTest_Name: "+Test_Name+"\tTest_Desc: "+Test_Desc+"\tSub_Desc: "+Sub_Desc);
		}
		out.println("</form></div>");
		}
	}
	catch(SQLException error)
	{
		System.out.println("HOME:SQL Exception 102:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("HOME:Exception 102:\t"+error);
	}
	try
	{
		Results.close();
		Db.close();
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 104:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 104:\t"+error);
	}
	
%>
</div>
 </div>
 
<!--  <div class="bg-GrayShine col-md-2 BorderGreen" id="NewsFlash" style=""> -->
<!-- 	<div class="VisibleAfterSomeTime" style="display:none;"> -->
<!-- 	<h1 class="text-center text-white font-comic font-bold"><u>News Flash</u></h1> -->
<!-- 	<ul type="square" class="text-white font-papyrus" style="font-size:20px;"> -->
<!-- 		<li>Last added test: A Test on C.</li> -->
<!-- 		<li>Currently working on the Achievements section.Will be out soon!!</li> -->
<!-- 		<li>Finding solutions for providing a better UX.</li> -->
<!-- 	</ul> -->
<!-- 	</div> -->
<!-- </div> -->
 
</div>

<!-- </div> -->


</body>
</html>