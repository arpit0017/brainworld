<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Create | Brain World</title>
<script src="js/jquery-2.1.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/CreateExams.js"></script>
<script src="js/tooltipster.bundle.min.js"></script>


<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/Create.css">
<link rel="stylesheet" href="css/CreateExams.css">
<link rel="stylesheet" type="text/css" href="css/tooltipster.bundle.min.css" />
<link rel="stylesheet" type="text/css" href="css/tooltipster-sideTip-punk.min.css" />
<style>

body
{
	position:relative;
}
#MainBody
{
	overflow:hidden;	
}
.affix, #myScrollspy
{
	top:100px;
}

div.col-sm-9 div {
      height: 80vh;
      font-size: 28px;
  }
@media screen and (max-width: 810px) {
    #section1, #section2, #section3, #section41, #section42  {
        margin-left: 150px;
    }
  }
  @media screen and (max-device-width: 480px) {
     #MainBody {overflow:visible;}
   }
  .ActiveDiv
  {
  	background-color:#f0f0f0;
  	color:#000;
  }
</style>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".VS a").on('click', function(event) {

    // Prevent default anchor click behavior
    event.preventDefault();

    // Store hash
    var hash = this.hash;
    var href=this.href;
    var extraScroll=0;
    if(hash=="#section1")
    	{
    		extraScroll=100;
    	}

    // Using jQuery's animate() method to add smooth page scroll
    // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
    $('html, body').animate({
      scrollTop: $(hash).offset().top - extraScroll
    }, 900, function(){
   
      // Add hash (#) to URL when done scrolling (default click behavior)
      window.location.hash = hash;
    });
  });
  
  $(window).scroll(function() {
	  $("#section3").each(function(){
	    var pos = $(this).offset().top;

	    var winTop = $(window).scrollTop();
	    if (pos < winTop+200) {
	      $("#testDiv").addClass("ActiveDiv");}
	  });
  });
  $('.my-tooltip').tooltipster({
	   animation: 'fade',
	   delay: 200,
	   theme: 'tooltipster-punk',
	   trigger: 'hover'
	});  
	  
});
</script>
  
<style>
</style>
 
</head>

<body id="MainBody" class="bg-black text-white" data-spy="scroll" data-target="#myScrollspy" data-offset="20">
<button class="upbutton btn btn-success btn-lg" style="z-index:+999;border-radius:50%; position:fixed;right:50px;bottom:50px;">
	<span class="glyphicon glyphicon-arrow-up" style="font-size:25px; color:#fff;"></span>
</button>
<div class="container-fluid"><center><img src="images/BrainWorld1.png" class="img-responsive" style="height:80px"></center></div> 

<%@ page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<%
	HttpSession sess=request.getSession(false);
	String Username=sess.getAttribute("Username").toString();
	String Role=sess.getAttribute("Role").toString();
// 	if(!Role.matches("admin"))
// 	{
// 		sess.invalidate();
// 		request.setAttribute("Error", 2);		//Invalid Access
// 		RequestDispatcher rd= request.getRequestDispatcher("Home.jsp");
// 		rd.forward(request, response);
// 	}
%>
<nav class="nav navbar-DarkBlue">
	<div class="navbar-header">
        <button type="button" class="navbar-toggle threeLine" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="Home.jsp" style="font-size:23px;color:#fff;" ><span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse text-bold font-times" id="myNavbar">
      
        <ul class="nav navbar-nav" style="letter-spacing:3px;font-size:18px;">
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
          <li><a href="Profile.jsp"><span class="text-DarkGreen text-bold">Profile</span></a></li>
          <li><a href="Welcome.jsp"><span class="text-DarkGreen text-bold">Exit</span></a></li>
        </ul>
        </li>
        </ul>
      </div>
    </div>
</nav>
<!-- <div class="VNavs"> -->
<!-- 	<ul type=none> -->
<!-- 	<li><span class="glyphicon glyphicon-folder-close"></span></li> -->
<!-- 	<li><span class="glyphicon glyphicon-folder-close"></span></li> -->
<!-- 	<li><span class="glyphicon glyphicon-folder-close"></span></li> -->
<!-- 	</ul> -->
<!-- </div> -->

  <div class="row">
    <div class="col-sm-12">
      <div class = "Vertical-Scroll" id="Developer">    
		<div class="row">
		
		<div class="col-sm-12 col-md-12 text-center" style="margin-top:20px;">
			<span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;">Developer</span>
			<p class="font-times text-white" style="font-size:22px;margin:10px;letter-spacing:2px;
			text-shadow:1px 1px 2px #fff;">
				Hey there!.. Welcome to developer mode.<br>
			
			</p>
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
				
				String Query=new String();
				int TotalSubjects=0,TotalExams=0,TotalQuestions=0;
				try
				{
					Query="select count(*) from subjects";
					St=Db.prepareStatement(Query);
					Results=St.executeQuery();
					if(Results.next())
					{
						TotalSubjects=Results.getInt(1);
					}
					Query="select count(*) from tests";
					St=Db.prepareStatement(Query);
					Results=St.executeQuery();
					if(Results.next())
					{
						TotalExams=Results.getInt(1);
					}
					Query="select count(*) from questions";
					St=Db.prepareStatement(Query);
					Results=St.executeQuery();
					if(Results.next())
					{
						TotalQuestions=Results.getInt(1);
					}
				}
				catch(SQLException error)
				{
					System.out.println("SQL ERROR: "+error);
				}
				catch(Exception error)
				{
					System.out.println("General Error "+error);
				}
				
				try
				{
					Results.close();
					Db.close();
				}
				catch(Exception error)
				{
					System.out.println("Error Closing connections: "+error);
				}
			%>
			
			<div class="row">
				<div class="col-md-4">
					<div class="Stats panel">
						<div class="panel-heading font-ArialR"><h1>Subjects</h1></div>
						<div class="panel-body font-times text-bold font-serif">
						<span style="font-size:50px;"><%out.println(TotalSubjects); %></span></div>
						<div class="panel-footer text-center">
						<center>
							<button data-target="#CreateSubject" class="btn btn-lg btn-primary buttonCircle" style="background-color:color:#fff;">
								<span class="glyphicon glyphicon-plus" style="font-size:20px;"></span>
							</button>
						</center>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="Stats panel">
						<div class="panel-heading font-ArialR"><h1>Exams</h1></div>
						<div class="panel-body font-times text-bold font-serif">
						<span style="font-size:50px;"><%out.println(TotalExams); %></span></div>
						<div class="panel-footer text-center">
						<center>
							<button data-target="#CreateExam" class="btn btn-lg btn-primary buttonCircle" style="background-color:color:#fff;">
								<span class="glyphicon glyphicon-plus" style="font-size:20px;"></span>
							</button>
						</center>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<div class="Stats panel">
						<div class="panel-heading font-ArialR"><h1>Questions</h1></div>
						<div class="panel-body font-times text-bold font-serif"><span style="font-size:50px;"><%out.println(TotalQuestions); %></span></div>
						<div class="panel-footer text-center">
						<center>
							<button data-target="#CreateQuestion" class="btn btn-lg btn-primary buttonCircle" style="background-color:color:#fff;">
								<span class="glyphicon glyphicon-plus" style="font-size:20px;"></span>
							</button>
						</center>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		</div>
        </div>
      <div class = "Vertical-Scroll" id="CreateSubject"> 
        <div class="row">
		<div class="col-sm-12 col-md-12 text-center" style="margin-top:20px;">
			<span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;">Subject</span>
		</div>
		<div class="col-sm-12" id="ListOfAllSubjects" style="overflow:hidden;max-height:700px;">
			
		</div>
		
		</div>
		<div style="max-height:0px;display:none;" id="SubjectMod">
			Subject Name:<input type="text" id="SubjectModNameBox" name="SubjectName">
		</div>	
      </div>
              
      <div class = "Vertical-Scroll" id="CreateExam">         
        <div class="row">
		
		<div class="col-sm-12 col-md-12 text-center" style="margin-top:20px;">
			<span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;">Exam</span>
		</div>
		<div class="col-sm-12" id="ListOfAllSubjectsForExam" style="z-index:+1;overflow:hidden;max-height:700px;">
<!-- 				Ajax for List Of Subjects -->
		</div>
		<div class="col-sm-12" id="ListOfExams" style="overflow:hidden; max-height:0px;">
<!-- 			Ajax For List of Exams -->
		</div>
		<div class="col-sm-12" id="ExamMod" style="overflow:hidden; max-height:0px">
<!-- 				Ajax For Exam Mod		 -->
		</div>
		
		</div>	
      </div>
      <div class = "Vertical-Scroll" id="CreateQuestion">         
        <div class="row">
		
		<div class="col-sm-12 col-md-12 text-center" style="margin-top:20px;">
			<span class="text-white font-AdobeB"
			style="font-size:50px;letter-spacing:4px;border-bottom:Solid 2px #fff;
			border-radius:15%;">Question</span>
		</div>
		<div class="col-sm-12" id="ListOfAllSubjectsForQuestion" style="overflow:hidden;max-height:700px">
<!-- 				Ajax For List OF Subjects -->
		</div>	
		<div class="col-sm-12" id="ListOfQuestions" style="overflow:hidden;max-height:0px">
<!-- 				Ajax for list of questions	 -->
        </div>
        <div class="col-sm-12" id="QuestionMod" style="overflow:hidden;max-height:0px">
<!--         			Ajax for Question Mod -->
        </div>
        <div class="col-sm-12" id="ListOfExamsForQuestion" style="overflow:hidden";max-height:0px">
<!--         			Ajax for List Of Exams for Adding into -->
        </div>
    </div>
  </div>
</div>
</div>

</body>
</html>